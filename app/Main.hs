module Main where

import Lib
import Language.Haskell.Interpreter

demo :: String -> IO ()
demo cmd = do
  result <- runInterpreter $ setImports ["Prelude","Lib"] >> interpret cmd (as :: [Integer])
  putStrLn (cmd ++ " = " ++ (drop 6 (show result)))

main :: IO ()
main = do
  putStrLn "CIS194 Homework 1\n"

  putStrLn "Exercise 1"
  demo "toDigits 1234    "
  demo "toDigitsRev 1234 "
  demo "toDigits 0       "
  demo "toDigits (-17)   "

  putStrLn "\nExercise 2" 

