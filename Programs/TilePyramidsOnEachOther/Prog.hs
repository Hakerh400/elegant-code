module Programs.TilePyramidsOnEachOther.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.Char
import Data.List

import Common.Main
import Programs.TilePyramidsOnEachOther.Test

func :: Input -> Output
func size = createPyramidText size

createPyramidText :: Integer -> String
createPyramidText size = lines2text (createPyramidLines size)

createPyramidLines :: Integer -> [String]
createPyramidLines size = finalizePyramid (iteratePyramids size)

finalizePyramid :: [String] -> [String]
finalizePyramid pyramid = addIndent pyramid

addIndent :: [String] -> [String]
addIndent pyramid = addIndentToLines (initIndent pyramid) pyramid

initIndent :: [String] -> String
initIndent pyramid = rept (len pyramid - 1) ' '

addIndentToLines :: String -> [String] -> [String]
addIndentToLines [] pyramid = pyramid
addIndentToLines indent (line:rest) =
  addIndentToSingleLine indent line :
  addIndentToLines (tail indent) rest

addIndentToSingleLine :: String -> String -> String
addIndentToSingleLine indent line = indent ++ line

iteratePyramids :: Integer -> [String]
iteratePyramids size = nextPyramid (size - 1) initialPyramid

initialPyramid :: [String]
initialPyramid = ["/\\"]

nextPyramid :: Integer -> [String] -> [String]
nextPyramid 0 pyramid = pyramid
nextPyramid size pyramid = nextPyramid (size - 1) (updatePyramid pyramid)

updatePyramid :: [String] -> [String]
updatePyramid pyramid =
  prependTop $
  updateLines pyramid

prependTop :: [String] -> [String]
prependTop pyramid = "/\\" : pyramid

updateLines :: [String] -> [String]
updateLines pyramid = map updateSingleLine pyramid

updateSingleLine :: String -> String
updateSingleLine line = ('/' : line) ++ "\\"