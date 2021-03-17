module Programs.PartialSumsOfHarmonicSeries.Test (
  tests,
  Input,
  Output
) where

type Input = Integer
type Output = Integer

tests :: [(Input, Output)]
tests = [
    (1, 1),
    (2, 4),
    (3, 11),
    (4, 31),
    (5, 83)
  ]