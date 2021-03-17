module Programs.GreatNumPyramid.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.List
import Data.Char

import Programs.GreatNumPyramid.Test

func :: Input -> Output
func () = intercalate "\n" $ indent $ triangle [] '9' '0'

triangle :: [String] -> Char -> Char -> [String]
triangle strs start end = if start < end
  then strs
  else triangle' strs start end where
    triangle' :: [String] -> Char -> Char -> [String]
    triangle' [] start end = triangle [[start]] prev end
    triangle' strs start end = triangle (
        [[start]] ++
        [[start, ' ', start]] ++
        (map updateLine strs) ++
        [intersperse ' ' $ replicate (length strs + 3) start]
      ) prev end
    updateLine :: String -> String
    updateLine line = [start, ' '] ++ line ++ [' ', start];
    prev :: Char
    prev = prevChar start

indent :: [String] -> [String]
indent strs = snd $ indent' strs where
  indent' :: [String] -> (String, [String])
  indent' strs = foldr foldFunc ([], []) strs
  foldFunc :: String -> (String, [String]) -> (String, [String])
  foldFunc str (ind, acc) = (' ' : ind, (ind ++ str) : acc)

prevChar :: Char -> Char
prevChar a = chr (ord a - 1)