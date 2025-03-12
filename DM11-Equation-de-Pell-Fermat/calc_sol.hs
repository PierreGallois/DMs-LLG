#!/usr/bin/env runhaskell

f b = sqrt (1 + 5 * b^2)

test_to n = [ (a, b) | b <- [1..n]
                     , let a = f b
                     , isNat a
            ]

-- Ignore after
isNat n = n >= 0 && (n - fromIntegral (truncate n)) <= 10^^(-7)

main :: IO()
main = print (map (\(x, y) -> (truncate x, truncate y)) (test_to 200000000000000))
-- to debug change truncate to id