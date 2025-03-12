#!/usr/bin/env runhaskell

f :: Double -> Double
f b = sqrt (1 + 5 * b^2)

test_to :: Double -> [(Double, Double)]
test_to n = filter (isNat . image) (map (\e -> (e, f e)) [1..n])

-- Ignore after
isNat :: Double -> Bool
isNat n = n >= 0 && (n - fromIntegral (truncate n)) <= 10^^(-7)

image :: (a, a) -> a
image (_, y) = y 

main :: IO()
main = print (map (\(x, y) -> (truncate x, truncate y)) (test_to 200000000000000))
-- to debug change truncate to id