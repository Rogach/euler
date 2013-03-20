main :: IO ()
main = print $ sum $ spiral 1001

spiral :: Int -> [Int]
spiral n = if n == 1
           then [1]
           else map (\i -> n*n - n*i + i) [0..3] ++ spiral (n - 2)
