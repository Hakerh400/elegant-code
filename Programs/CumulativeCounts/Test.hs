module Programs.CumulativeCounts.Test (
  tests,
  Input,
  Output
) where

type Input = [Integer]
type Output = [Integer]

tests :: [(Input, Output)]
tests = [
    ([1, 1, 2, 2, 2, 1, 1, 1, 3, 3], [1, 2, 1, 2, 3, 3, 4, 5, 1, 2]),
    ([3, 7, 5, 4, 9, 2, 3, 2, 6, 6], [1, 1, 1, 1, 1, 1, 2, 2, 1, 2])
  ]