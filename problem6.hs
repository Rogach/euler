main :: IO ()
main = print $ (sum [1..100] * sum [1..100]) - sum (map (\x -> x*x) [1..100])