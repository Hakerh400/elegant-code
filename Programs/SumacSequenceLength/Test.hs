module Programs.SumacSequenceLength.Test (
  tests,
  Input,
  Output
) where

type Input = (Integer, Integer)
type Output = (Integer)

tests :: [(Input, Output)]
tests = [
    ((120, 71), 5),
    ((101, 42), 3),
    ((500, 499), 4),
    ((387, 1), 3),
    ((3, -128), 1),
    ((-2, 3), 0),
    ((3, 2), 4)
  ]