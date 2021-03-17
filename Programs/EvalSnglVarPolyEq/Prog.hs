module Programs.EvalSnglVarPolyEq.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Programs.EvalSnglVarPolyEq.Test

func :: Input -> Output
func ([], _) = 0
func ((x:xs), y) = x + y * (func (xs, y))