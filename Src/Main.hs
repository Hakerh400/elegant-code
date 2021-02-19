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
import qualified Src.FS as FS
import qualified Src.CP as CP

main :: IO ()
main = do
  FS.exists "abc" >>= log
  FS.mkdir "abc"
  FS.exists "abc" >>= log