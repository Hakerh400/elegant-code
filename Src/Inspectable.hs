{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE MonoLocalBinds #-}

module Src.Inspectable (
  Inspectable(..)
) where

import Data.List

import Src.Common
import Src.Examinable

class (Examinable a) => Inspectable a where
  inspect :: a -> String

instance (Examinable a) => Inspectable a where
  inspect a = inspect' (examine a)

inspect' :: Type -> String
inspect' (Type typeInfo valsInfo) = (case typeInfo of
    TypeInfo "()" _ -> ""
    TypeInfo "(,)" _ -> sjoin " " vals
    TypeInfo "[]" [TypeInfo "Char" _] -> ttoStr valsInfo
    TypeInfo "[]" _ -> slist vals
    TypeInfo "Bool" _ -> tname (head valsInfo)
    TypeInfo "Char" _ -> "'" ++ tname (head valsInfo) ++ "'"
    TypeInfo "Integer" _ -> tname (head valsInfo)
    a -> "\nInspectable ---> " ++ show a ++ "\n"
  ) where
    vals = fmap inspect' valsInfo