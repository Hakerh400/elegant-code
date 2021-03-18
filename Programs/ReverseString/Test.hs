module Programs.ReverseString.Test (
  tests,
  Input,
  Output
) where

type Input = String
type Output = String

tests :: [(Input, Output)]
tests = [
    ("abcdef", "fedcba"),
    ("Hello, World!", "!dlroW ,olleH"),
    ("racecar", "racecar")
  ]