module Lib (
  toDigits, toDigitsRev, doubleEveryOther, sumDigits, validate, hanoi
  ) where


-- Exercise 1 
-- find the digits of a number

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
  | n <= 0     = []
  | n < 10     = [n]
  | otherwise  = (n `mod` 10) : toDigitsRev(n `div` 10) 

toDigits :: Integer -> [Integer]
toDigits n = reverse( toDigitsRev n )


-- Exercise 2
-- double every other nubmer in a list

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther []         = []
doubleEveryOther (x:[])     = [x]
doubleEveryOther (x:y:zs)
 | ( len zs ) `mod` 2 == 0  = x*2 : y : doubleEveryOther zs
 | otherwise                = x : y*2 : doubleEveryOther zs  

len :: [a] -> Integer
len []     = 0
len (x:xs) = 1 + len xs


-- Exercise 3
-- given a miz of 1- and 2-digit numbers, sum all digits

sumDigits :: [Integer] -> Integer
sumDigits (x:[])
 | x < 10     = x
 | otherwise  = (x `mod` 10) + (x `div` 10)
sumDigits (x:ys) = (sumDigits [x]) + sumDigits(ys)


-- Exercise 4
-- define a function indicating whether an integer is a valid credit card number

validate :: Integer -> Bool
validate x = ( sumDigits( doubleEveryOther( toDigits x ))) `mod` 10 == 0


-- Exercise 5
-- (Hanoi) given the number of discs and names for the three pegs, 
-- return a list of moves to be performed to move the stack of 
-- discs from the first peg to the second

type Peg = String
type Move = (Peg,Peg)
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 a b c = []
hanoi x a b c = ( hanoi (x-1) a c b ) ++ ( (a,b) : ( hanoi (x-1) c b a ) )
