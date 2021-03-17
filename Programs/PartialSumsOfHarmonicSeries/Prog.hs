module Programs.PartialSumsOfHarmonicSeries.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.Char
import Data.List

import Common.Main
import Programs.PartialSumsOfHarmonicSeries.Test

func :: Input -> Output
func n = minimize (testFunc n)

testFunc :: Integer -> Integer -> Bool
testFunc n k = getIntegerPartOfSeries k >= n

getIntegerPartOfSeries :: Integer -> Integer
getIntegerPartOfSeries 0 = 0
getIntegerPartOfSeries k =
  getNumeratorOfSeries k `div`
  getDenominatorOfSeries k

getNumeratorOfSeries :: Integer -> Integer
getNumeratorOfSeries k = sumList (getFactors k)

getDenominatorOfSeries :: Integer -> Integer
getDenominatorOfSeries k = factoriel k

getFactors :: Integer -> [Integer]
getFactors k = createList (getSingleFactor k) k

getSingleFactor :: Integer -> Integer -> Integer
getSingleFactor k index = getDenominatorOfSeries k `div` (index + 1)