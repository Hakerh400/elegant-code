module Programs.SumacSequenceLength.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.Char
import Data.List

import Common.Main
import Programs.SumacSequenceLength.Test

func :: Input -> Output
func (t1, t2) = computeSumacLen t1 t2

computeSumacLen :: Integer -> Integer -> Integer
computeSumacLen t1 t2 = if t1 <= 0
  then 0
  else 1 + computeSumacLen t2 (t1 - t2)