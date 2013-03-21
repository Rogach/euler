main :: IO ()
main = print $ head
       [ a-b
       | a <- pentagonals
       , b <- takeWhile (<a) pentagonals
       , isPentagonal (a-b)
       , isPentagonal (a+b)
       ]

pentagonals :: [Int]
pentagonals = map (\n -> n * (3*n - 1) `div` 2) [1..]

isPentagonal :: Int -> Bool
isPentagonal n = let i = (1 + sqrt (fromIntegral $ 24*n+1)) / 6
                 in i == fromIntegral (floor i)