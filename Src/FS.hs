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

import qualified System.Directory as Dir

exists :: String -> IO Bool
exists = Dir.doesPathExist

rename :: String -> String -> IO ()
rename = Dir.renamePath

readFile :: String -> IO String
readFile = IO.readFile

writeFile :: String -> String -> IO ()
writeFile = IO.writeFile

touch :: String -> IO ()
touch pth = writeFile pth []

readdir :: String -> IO [String]
readdir = Dir.listDirectory

mkdir :: String -> IO ()
mkdir = Dir.createDirectory

rmdir :: String -> IO ()
rmdir = Dir.removeDirectory

unlink :: String -> IO ()
unlink = Dir.removeFile