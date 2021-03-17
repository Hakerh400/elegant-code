module Src.Main (main) where

import Control.Exception
import Prelude hiding (log)

import Src.Log
import Src.Common
import qualified Src.FS as FS
import qualified Src.CP as CP

dataDir = "./Data";

main :: IO ()
main = do
  FS.exists dataDir >>= \exi ->
    itn (not exi) initDataDir

  log("Welcome to Elegant Code.")

  repl

repl :: IO ()
repl = do
  logRaw("\n> ")

  line <- getLine
  let parts = words line

  ite (parts == []) repl $ do
    case head parts of
      "q" -> exit
      "exit" -> exit
      a -> unknownCommand a

initDataDir :: IO ()
initDataDir = do
  FS.mkdir dataDir

unknownCommand :: String -> IO ()
unknownCommand cmd = do
  log("Unknown command")
  repl

exit :: IO ()
exit = nop