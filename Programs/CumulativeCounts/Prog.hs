module Programs.CumulativeCounts.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.Char
import Data.List

import Common.Main
import Programs.CumulativeCounts.Test

func :: Input -> Output
func = count

count :: (Eq a) => [a] -> [Integer]
count a = countWithInfo a []

countWithInfo :: (Eq a) => [a] -> [(a, Integer)] -> [Integer]
countWithInfo [] _ = []
countWithInfo (x:xs) counts = getCount x counts + 1 :
  countWithInfo xs (updateCounts x counts)

getCount :: (Eq a) => a -> [(a, Integer)] -> Integer
getCount _ [] = 0
getCount a ((x,n):xs) = if a == x
  then n
  else getCount a xs

updateCounts :: (Eq a) => a -> [(a, Integer)] -> [(a, Integer)]
updateCounts a [] = [(a, 1)]
updateCounts a ((x,n):xs) = if a == x
  then (x, n + 1) : xs
  else (x, n) : updateCounts a xs