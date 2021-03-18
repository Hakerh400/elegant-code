module Programs.PreorderInorderPostorder.Prog (
  func,
  tests,
  Input,
  Output,
) where

import Data.Char
import Data.List

import Common.Main
import Programs.PreorderInorderPostorder.Test

data Tree =
  Node Integer Tree Tree |
  Nil

func :: Input -> Output
func (pre, ino) = postorder $ reconstructTree pre ino

reconstructTree :: [Integer] -> [Integer] -> Tree
reconstructTree [] [] = Nil
reconstructTree (x:xs) ino = reconstructTreeFromInoPair
  x xs (splitAtElem x ino)

reconstructTreeFromInoPair :: Integer -> [Integer] -> ([Integer], [Integer]) -> Tree
reconstructTreeFromInoPair x pre (inoLeft, inoRight) = Node x
  (reconstructTree (filterByRef inoLeft pre) inoLeft)
  (reconstructTree (filterByRef inoRight pre) inoRight)

splitAtElem :: Integer -> [Integer] -> ([Integer], [Integer])
splitAtElem a list = splitAtElemHelper a [] list

splitAtElemHelper :: Integer -> [Integer] -> [Integer] -> ([Integer], [Integer])
splitAtElemHelper a before (x:xs) = if a == x
  then (reverse before, xs)
  else splitAtElemHelper a (x : before) xs

filterByRef :: [Integer] -> [Integer] -> [Integer]
filterByRef ref list = filter (belongsToList ref) list

belongsToList :: [Integer] -> Integer -> Bool
belongsToList ref a = elem a ref

postorder :: Tree -> [Integer]
postorder Nil = []
postorder (Node val left right) =
  postorder left ++
  postorder right ++
  [val]