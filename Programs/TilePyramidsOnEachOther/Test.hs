module Programs.TilePyramidsOnEachOther.Test (
  tests,
  Input,
  Output
) where

type Input = Integer
type Output = String

tests :: [(Input, Output)]
tests = [
    (1, "/\\"),
    (7,
      "      /\\\n" ++
      "     //\\\\\n" ++
      "    ///\\\\\\\n" ++
      "   ////\\\\\\\\\n" ++
      "  /////\\\\\\\\\\\n" ++
      " //////\\\\\\\\\\\\\n" ++
      "///////\\\\\\\\\\\\\\"),
    (11,
      "          /\\\n" ++
      "         //\\\\\n" ++
      "        ///\\\\\\\n" ++
      "       ////\\\\\\\\\n" ++
      "      /////\\\\\\\\\\\n" ++
      "     //////\\\\\\\\\\\\\n" ++
      "    ///////\\\\\\\\\\\\\\\n" ++
      "   ////////\\\\\\\\\\\\\\\\\n" ++
      "  /////////\\\\\\\\\\\\\\\\\\\n" ++
      " //////////\\\\\\\\\\\\\\\\\\\\\n" ++
      "///////////\\\\\\\\\\\\\\\\\\\\\\")
  ]