module Programs.HelloWorld.Test (
  tests,
  Input,
  Output
) where

type Input = ()
type Output = String

tests :: [(Input, Output)]
tests = [
    ((), "Hello, World!")
  ]