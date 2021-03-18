module Programs.ReverseString.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.Char
import Data.List

import Common.Main
import Programs.ReverseString.Test

func :: Input -> Output
func str = reverse str