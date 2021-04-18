module Programs.BeaverCodeDecryption.Test (
  tests,
  Input,
  Output
) where

type Input = String
type Output = String

tests :: [(Input, Output)]
tests = [
    ("CTYROP", "CRYPTO"),
    ("EOYCTNNPRI", "ENCRYPTION"),
    ("RUOENFSEAFMRDHT", "RANDOMSTUFFHERE")
  ]