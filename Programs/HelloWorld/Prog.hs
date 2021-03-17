module Programs.HelloWorld.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Programs.HelloWorld.Test

func :: Input -> Output
func () = "Hello, World!"