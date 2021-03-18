module Programs.LongestIncreasingSubsequence.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.Char
import Data.List

import Common.Main
import Programs.LongestIncreasingSubsequence.Test

func :: Input -> Output
func list = maxLen $ filter increasing $ allSublists list

allSublists :: [a] -> [[a]]
allSublists [] = [[]]
allSublists (x:xs) =
  allSublists xs ++
  map (x:) (allSublists xs)

increasing :: (Ord a) => [a] -> Bool
increasing [] = True
increasing (a:[]) = True
increasing (a:b:rest) = a < b && increasing (b : rest)

maxLen :: [[a]] -> Integer
maxLen [] = 0
maxLen (x:xs) = max (len x) (maxLen xs)