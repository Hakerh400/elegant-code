module Src.Main (main) where

import Control.Exception
import Prelude hiding (log)

import qualified Src.FS as FS
import qualified Src.CP as CP

import Src.Log
import Src.Common
import qualified Src.Prog as Prog

dataDir = "./Data";

main :: IO ()
main = do
  Prog.run
  -- FS.exists dataDir >>= \exi ->
  --   itn (not exi) initDataDir
  --
  -- log("Welcome to Elegant Code.")
  --
  -- repl

repl :: IO ()
repl = do
  logRaw("\n> ")

  line <- getLine
  let parts = words line

  ite (parts == []) repl $ do
    let cmd = head parts
    let args = tail parts

    case cmd of
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