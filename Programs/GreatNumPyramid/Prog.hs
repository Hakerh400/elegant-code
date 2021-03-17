module Programs.GreatNumPyramid.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.Char
import Data.List

import Programs.GreatNumPyramid.Test

func :: Input -> Output
func () = createPyramidText 9

createPyramidText :: Integer -> String
createPyramidText size = lines2text (createPyramidLines size)

createPyramidLines :: Integer -> [String]
createPyramidLines size = finalizePyramid (iteratePyramids size)

finalizePyramid :: [String] -> [String]
finalizePyramid pyramid =
  addIndent $
  addSpaces pyramid

addIndent :: [String] -> [String]
addIndent pyramid = addIndentToLines (initIndent pyramid) pyramid

initIndent :: [String] -> String
initIndent pyramid = rept (len pyramid - 1) ' '

addIndentToLines :: String -> [String] -> [String]
addIndentToLines [] pyramid = pyramid
addIndentToLines indent@(x:xs) (line:rest) =
  addIndentToSingleLine indent line :
  addIndentToLines xs rest

addIndentToSingleLine :: String -> String -> String
addIndentToSingleLine indent line = indent ++ line

addSpaces :: [String] -> [String]
addSpaces pyramid = map (intersperse ' ') pyramid

iteratePyramids :: Integer -> [String]
iteratePyramids size = nextPyramid (size - 1) (initialPyramid size)

initialPyramid :: Integer -> [String]
initialPyramid size = [show size]

nextPyramid :: Integer -> [String] -> [String]
nextPyramid (-1) pyramid = pyramid
nextPyramid size pyramid = nextPyramid (size - 1) (updatePyramidWithSize size pyramid)

updatePyramidWithSize :: Integer -> [String] -> [String]
updatePyramidWithSize size pyramid = updatePyramidWithChar (size2char size) pyramid

updatePyramidWithChar :: Char -> [String] -> [String]
updatePyramidWithChar c pyramid =
  prependChar c $
  prependTwoChars c $
  appendCharRow c $
  updateLinesWithChar c pyramid

prependChar :: Char -> [String] -> [String]
prependChar c pyramid = [c] : pyramid

prependTwoChars :: Char -> [String] -> [String]
prependTwoChars c pyramid = [c, c] : pyramid

appendCharRow :: Char -> [String] -> [String]
appendCharRow c pyramid = pyramid ++ [rept (len pyramid + 3) c]

updateLinesWithChar :: Char -> [String] -> [String]
updateLinesWithChar c pyramid = map (updateSingleLineWithChar c) pyramid

updateSingleLineWithChar :: Char -> String -> String
updateSingleLineWithChar c line = (c : line) ++ [c]

lines2text :: [String] -> String
lines2text strs = intercalate "\n" strs

size2char :: Integer -> Char
size2char size = head (show size)

len :: [a] -> Integer
len [] = 0
len (_:xs) = 1 + len xs

rept :: Integer -> a -> [a]
rept 0 _ = []
rept n a = a : rept (n - 1) a