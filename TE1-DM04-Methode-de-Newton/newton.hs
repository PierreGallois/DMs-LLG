f :: (Num r) => r -> r
f x = x^3 - 2

derivee f x h = (f (x + h) - f (x - h)) / (2*h)

newton f h e x =
    if (abs . f) x > e
    then newton f h e (x - (f(x) / (derivee f x h)))
    else x


main :: IO ()
main = do
    let initialGuess = 1.0  -- Initial guess for the root
        h = 1e-4            -- Small step for derivative approximation
        e = 1e-6            -- Tolerance level for convergence
        root = newton f h e initialGuess
    putStrLn $ "Root found: " ++ show root