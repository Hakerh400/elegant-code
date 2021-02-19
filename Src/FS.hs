module Src.FS (
  exists,
  rename,
  readFile,
  writeFile,
  unlink,
  touch,
  readdir,
  mkdir,
  rmdir
) where

import Prelude hiding (readFile, writeFile)
import qualified System.IO as IO

import qualified System.Directory as Directory

exists :: String -> IO Bool
exists = Directory.doesPathExist

rename :: String -> String -> IO ()
rename = Directory.renamePath

readFile :: String -> IO String
readFile = IO.readFile

writeFile :: String -> String -> IO ()
writeFile = IO.writeFile

touch :: String -> IO ()
touch pth = writeFile pth []

readdir :: String -> IO [String]
readdir = Directory.listDirectory

mkdir :: String -> IO ()
mkdir = Directory.createDirectory

rmdir :: String -> IO ()
rmdir = Directory.removeDirectory

unlink :: String -> IO ()
unlink = Directory.removeFile