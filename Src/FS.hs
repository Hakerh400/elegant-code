module Src.FS (
  mkdir,
  exists
) where

import qualified System.Directory as Directory

mkdir :: String -> IO ()
mkdir = Directory.createDirectory

exists :: String -> IO Bool
exists = Directory.doesPathExist

readFile :: String -> IO Bool