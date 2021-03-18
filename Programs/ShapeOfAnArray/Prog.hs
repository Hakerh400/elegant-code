module Programs.ShapeOfAnArray.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.Char
import Data.List

import Common.Main
import Programs.ShapeOfAnArray.Test

func :: Input -> Output
func (Int _) = []
func (Arr []) = [0]
func (Arr arr@(a:_)) = len arr : func a