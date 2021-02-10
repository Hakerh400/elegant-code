{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE MonoLocalBinds #-}

module Log (
  log,
  -- logInc,
  -- logDec,
  logb
) where

import Data.List
import Data.IORef
import System.IO
import Prelude hiding (log)

import Common
import Inspectable

class (Inspectable a) => Log a where
  toStr :: a -> String

instance (Inspectable a) => Log a where
  toStr = inspect

-- indent :: IORef Integer
-- indent = newIORef 0

log :: (Log a) => a -> IO ()
log arg = do
  -- a <- indent
  -- b <- readIORef a

  let str = toStr arg
  let tab = "" --replicate (fromIntegral b * 2) ' '

  putStrLn $ tab ++ replace '\n' ("\n" ++ tab) str
  hFlush stdout

abc :: String -> Char -> String
abc tab c = tab ++ [c]

-- logInc :: IO ()
-- logInc = do
--   a <- indent
--   b <- readIORef a
--   writeIORef a (b + 1)

-- logDec :: IO ()
-- logDec = do
--   a <- indent
--   b <- readIORef a
--   writeIORef a (b - 1)

logb :: IO ()
logb = do
  log("\n" ++ replicate 100 '=' ++ "\n")

replace :: (Eq a) => a -> [a] -> [a] -> [a]
replace a b list = concat $ fmap replace' list where
  replace' c = ite (c == a) b [c]