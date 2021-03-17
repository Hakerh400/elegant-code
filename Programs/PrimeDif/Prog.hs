module Programs.PrimeDif.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.Char
import Data.List

import Programs.PrimeDif.Test

func :: Input -> Output
func dif = minimize (testInt dif)

testInt :: Integer -> Integer -> Bool
testInt dif int =
  isPrime int &&
  (nextPrime int - int >= dif)

minimize :: (Integer -> Bool) -> Integer
minimize func = minimizeHelper func 0

minimizeHelper :: (Integer -> Bool) -> Integer -> Integer
minimizeHelper func int = if func int
  then int
  else minimizeHelper func (int + 1)

isPrime :: Integer -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime int = not (any (divisible int) [2 .. int - 1])

nextPrime :: Integer -> Integer
nextPrime int = if isPrime (int + 1)
  then int + 1
  else nextPrime (int + 1)

divisible :: Integer -> Integer -> Bool
divisible a b = a `mod` b == 0