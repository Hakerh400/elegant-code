module Programs.HelloWorld.Test (test) where

import Programs.HelloWorld.Program

test :: Bool
test = foldl test' True testCases where
  test' :: Bool -> String -> Bool
  test' a b = a && f == b

testCases :: [String]
testCases = [
    "Hello, World!"
  ]