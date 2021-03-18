module Programs.ShapeOfAnArray.Test (
  tests,
  Input,
  Output,
  Data(..)
) where

import Data.Char
import Data.List

import Src.Examinable

data Data =
  Arr [Data] |
  Int Integer

type Input = Data
type Output = [Integer]

tests :: [(Input, Output)]
tests = [
    (parse "[]", [0]),
    (parse "[0]", [1]),
    (parse "[[]]", [1, 0]),
    (parse "[[], []]", [2, 0]),
    (parse "[[4, 4], [0, 3]]", [2, 2]),
    (parse "[[[4], [6]]]", [1, 2, 1]),
    (parse "[[[[7], [0]]]]", [1, 1, 2, 1])
  ]

instance Show Data where
  show (Int a) = show a
  show (Arr a) = "[" ++ intercalate ", " (fmap show a) ++ "]"

instance Examinable Data where
  examineType a = examineType (show a)
  examineVals a = examineVals (show a)

parse :: String -> Data
parse str = finalize (parseData str)

parseData :: String -> (Data, String)
parseData ('[':rest) = parseArr rest
parseData str = parseInt str

parseInt :: String -> (Data, String)
parseInt str = parseInt' str 0 where
  parseInt' :: String -> Integer -> (Data, String)
  parseInt' [] n = (Int n, [])
  parseInt' str@(c:rest) n = if isDigit c
    then parseInt' rest (n * 10 + digit2int c)
    else (Int n, str)

parseArr :: String -> (Data, String)
parseArr str = parseArr' str [] where
  parseArr' :: String -> [Data] -> (Data, String)
  parseArr' (']':rest) arr = (Arr (reverse arr), rest)
  parseArr' (',':' ':rest) arr = parseArr' rest arr
  parseArr' str arr = parseArr' strNew arrNew where
    (parsed, strNew) = parseData str
    arrNew = parsed : arr

finalize :: (Data, String) -> Data
finalize (a, "") = a

digit2int :: Char -> Integer
digit2int c = fromIntegral (ord c) - 0x30