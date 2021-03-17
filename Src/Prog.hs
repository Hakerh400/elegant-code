module Src.Prog (
  run
) where

import Prelude hiding (log)

import Programs.Blank.Prog
import Src.Common
import Src.Log

run :: IO ()
run = run' tests where
  run' :: [(Input, Output)] -> IO ()
  run' [] = nop
  run' ((inp, out):rest) = do
    let result = func inp

    if result == out then run' rest else do
      log(inp)
      logb
      log(out)
      logb
      log(result)