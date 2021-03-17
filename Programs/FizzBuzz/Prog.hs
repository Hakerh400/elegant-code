module Programs.FizzBuzz.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.Char
import Data.List

import Common.Main
import Programs.FizzBuzz.Test

func :: Input -> Output
func () = lines2text createLines

createLines :: [String]
createLines = createList processIndex0Indexed 100

processIndex0Indexed :: Integer -> String
processIndex0Indexed n = processIndex1Indexed (n + 1)

processIndex1Indexed :: Integer -> String
processIndex1Indexed n = if divisible n 15
  then fizz ++ buzz
  else if divisible n 3
    then fizz
    else if divisible n 5
      then buzz
      else show n

fizz :: String
fizz = "Fizz"

buzz :: String
buzz = "Buzz"