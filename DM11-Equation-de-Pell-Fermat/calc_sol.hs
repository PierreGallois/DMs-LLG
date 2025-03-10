#!/usr/bin/env runhaskell

f :: Double -> Double
f b = sqrt (1 + 5 * b^2)

test_to :: Double -> [Double]
test_to n = filter (isNat . f) [1..n]

-- Ignore after
isNat :: Double -> Bool
isNat n = n >= 0 && (n - fromIntegral (truncate n)) <= 10^^(-7)

main :: IO()
main = print (map truncate (test_to 200000000000000))
-- to debug change truncate to id