module Challenges.HelloWorld (
  Input,
  Output,
  tests
) where

type Input = ()
type Output = String

tests :: [(Input, Output)]
tests = [
    ((), "Hello, World!")
  ]