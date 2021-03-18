module Programs.LongestIncreasingSubsequence.Test (
  tests,
  Input,
  Output
) where

type Input = [Integer]
type Output = Integer

tests :: [(Input, Output)]
tests = [
    ([1], 1),
    ([2, 1], 1),
    ([1, 2, 3], 3),
    ([5, 2, 1, 4, 3], 2),
    ([7, 1, 8, 10, 3, 9, 5, 4, 6, 2], 4)
  ]