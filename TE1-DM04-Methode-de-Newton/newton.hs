f :: (Num r) => r -> r
f x = x^3 - 2

derivee f x h = (f (x + h) - f (x - h)) / 2*h

newton f h e x =
    if (abs . f) x > e
    then newton f h e (x - (f(x) / (derivee f x h)))
    else x


main = do
    let result = newton f 1e-4 1e-6 1
    (putStrLn . show) result
