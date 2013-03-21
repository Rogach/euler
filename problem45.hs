-- all hexagonal numbers are also the triangle ones, so we can skip that test
main :: IO ()
main = print $ [ n | n <- hexagonals, isPentagonal n] !! 2

hexagonals :: [Int]
hexagonals = map (\n -> n * (2*n -1)) [1..]

isPentagonal :: Int -> Bool
isPentagonal n = let i = (1 + sqrt (fromIntegral $ 24*n+1)) / 6
                 in i == fromIntegral (floor i)
