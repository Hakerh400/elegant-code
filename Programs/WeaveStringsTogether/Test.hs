module Programs.WeaveStringsTogether.Test (
  tests,
  Input,
  Output
) where

type Input = [String]
type Output = String

tests :: [(Input, Output)]
tests = [
    (["kino", "cinema", "movie"], "kcmiionnvoeimea"),
    (["code", "golf"], "cgoodlef"),
    (["Hi", "", "There"], "HTihere"),
    (["Explanation"], "Explanation"),
    (["Dyalog APL", "Cultivation", "Orchard"], "DCOyuralclthoiagvr adAtPiLon")
  ]