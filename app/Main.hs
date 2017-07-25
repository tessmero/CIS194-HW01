module Main where

import Lib
import Language.Haskell.Interpreter

demor :: String -> String -> IO ()
demor cmd sresult =
  putStrLn (cmd ++ " = " ++ (drop 6 (sresult)))

demoInts :: String -> IO ()
demoInts cmd = do
  result <- runInterpreter $ setImports ["Prelude","Lib"] >> interpret cmd (as :: [Integer])
  demor cmd (show result)

demo1Int :: String -> IO ()
demo1Int cmd = do
  result <- runInterpreter $ setImports ["Prelude","Lib"] >> interpret cmd (as :: Integer)
  demor cmd (show result)

demoBool :: String -> IO ()
demoBool cmd = do
  result <- runInterpreter $ setImports ["Prelude","Lib"] >> interpret cmd (as :: Bool)
  demor cmd (show result)

demoMovs :: String -> IO ()
demoMovs cmd = do
  result <- runInterpreter $ setImports ["Prelude","Lib"] >> interpret cmd (as :: [Move])
  demor cmd (show result)

main :: IO ()
main = do
  putStrLn "CIS194 Homework 1"

  putStrLn "\nExercise 1"
  demoInts "toDigits 1234              "
  demoInts "toDigitsRev 1234           "
  demoInts "toDigits 0                 "
  demoInts "toDigits (-17)             "

  putStrLn "\nExercise 2" 
  demoInts "doubleEveryOther [8,7,6,5] "
  demoInts "doubleEveryOther [1,2,3]   "

  putStrLn "\nExercise 3"
  demo1Int "sumDigits [16,7,12,5]      "

  putStrLn "\nExercise 4"
  demoBool "validate 4012888888881881  "
  demoBool "validate 4012888888881882  "

  putStrLn "\nExercise 5"
  demoMovs "hanoi 2 \"a\" \"b\" \"c\""
  demoMovs "hanoi 3 \"a\" \"b\" \"c\""
