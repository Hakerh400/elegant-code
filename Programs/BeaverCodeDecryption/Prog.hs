module Programs.BeaverCodeDecryption.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.Char
import Data.List

import Common.Main
import Programs.BeaverCodeDecryption.Test

func :: Input -> Output
func = decrypt

decrypt :: [a] -> [a]
decrypt [] = []
decrypt (a:[]) = [a]
decrypt a = callWithPair flatZip (decryptParts a)

decryptParts :: [a] -> ([a], [a])
decryptParts a = pmap decrypt (splitAtHalf a)

callWithPair :: (a -> b -> c) -> (a, b) -> c
callWithPair f (a, b) = f a b

flatZip :: [a] -> [a] -> [a]
flatZip [] a = a
flatZip a [] = a
flatZip (x:xs) (y:ys) = x : y : flatZip xs ys

splitAtHalf :: [a] -> ([a], [a])
splitAtHalf a = splitAtHalfPair [] a;

splitAtHalfPair :: [a] -> [a] -> ([a], [a])
splitAtHalfPair a b@(x:xs) = if len a >= len b
  then (reverse a, b)
  else splitAtHalfPair (x : a) xs

pmap :: (a -> b) -> (a, a) -> (b, b)
pmap f (a, b) = (f a, f b)