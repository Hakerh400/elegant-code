module Programs.PrimeDif.Test (
  tests,
  Input,
  Output
) where

type Input = Integer
type Output = Integer

tests :: [(Input, Output)]
tests = [
    (1, 2),
    (2, 3),
    (3, 7),
    (4, 7),
    (5, 23),
    (6, 23),
    (7, 89),
    (8, 89)
  ]