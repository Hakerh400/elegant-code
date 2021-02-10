module Src.Main (main) where

import Data.Maybe
import Control.Exception
import System.Exit
import GHC.IO.Handle
import qualified Foreign.Ptr as Ptr
import qualified Foreign.Marshal.Alloc as Alloc
import qualified Foreign.Marshal.Utils as Utils
import qualified Foreign.Storable as Storable
import qualified System.Process as Proc
import Control.Exception
import Prelude hiding (log)

import Src.Log
import Src.Common
import qualified Src.CP as CP

main :: IO ()
main = do
  let procName = "node"
  let procArgs = ["-p", "process.stdin.pipe(process.stdout);setTimeout(()=>process.exit(),1e3)"]

  result <- CP.execSync Nothing procName procArgs Nothing

  imte result (\(exitCode, stdout, stderr) -> do
      log("Exit code:", show exitCode)
      log()
      log("Stdout:", stdout)
      log("Stderr:", stderr)
    ) (do
      log("Failed")
    )