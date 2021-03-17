module Programs.PrimeDif.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.Char
import Data.List

import Common.Main
import Programs.PrimeDif.Test

func :: Input -> Output
func dif = minimize (testInt dif)

testInt :: Integer -> Integer -> Bool
testInt dif int =
  isPrime int &&
  (nextPrime int - int >= dif)