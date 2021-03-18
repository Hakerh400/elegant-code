module Programs.WeaveStringsTogether.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.Char
import Data.List

import Common.Main
import Programs.WeaveStringsTogether.Test

func :: Input -> Output
func [] = []
func ([]:ys) = func ys
func ((x:xs):ys) = x : (func (ys ++ [xs]))