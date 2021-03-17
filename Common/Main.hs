module Common.Main where

import Data.Char
import Data.List

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

factoriel :: Integer -> Integer
factoriel 0 = 1
factoriel n = n * (factoriel (n - 1))

sumList :: [Integer] -> Integer
sumList = foldl (+) 0

createList :: (Integer -> a) -> Integer -> [a]
createList func len = reverse (createListRev func len)

createListRev :: (Integer -> a) -> Integer -> [a]
createListRev func 0 = []
createListRev func len = func (len - 1) : createListRev func (len - 1)

len :: [a] -> Integer
len [] = 0
len (_:xs) = 1 + len xs

rept :: Integer -> a -> [a]
rept 0 _ = []
rept n a = a : rept (n - 1) a

lines2text :: [String] -> String
lines2text strs = intercalate "\n" strs