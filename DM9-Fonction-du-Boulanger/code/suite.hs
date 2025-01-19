#!/usr/bin/env runhaskell

f x
  | 0 <= x     &&  x <= 1 / 2  =  2 * x
  | 1 / 2 < x  &&  x <= 1      =  2 * (1 - x)

suite a 1 = a
suite a p = suite (a ++ [f (last a)]) (p-1)

-- Ignore after
main :: IO()
main = print (suite [0.33] 25)