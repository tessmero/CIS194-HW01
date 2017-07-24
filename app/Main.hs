module Main where

import Lib
import System.Eval.Haskell

printAndEval :: String -> IO ()
printAndEval cmd = putStrLn( cmd ++ " = " ++ (eval cmd) )

main :: IO ()
main = do
  printAndEval "toDigits 1234"
  
