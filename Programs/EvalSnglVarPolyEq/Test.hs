module Programs.EvalSnglVarPolyEq.Test (
  tests,
  Input,
  Output
) where

type Input = ([Integer], Integer)
type Output = Integer

tests :: [(Input, Output)]
tests = [
    (([1], 182), 1),
    (([1, 2], 4), 9),
    (([25, 20], 5), 125),
    (([1, 2, 3, 4], 3), 142)
  ]