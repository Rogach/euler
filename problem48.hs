main :: IO ()
main = print $ reverse $ take 10 $ reverse $ show $ sum $ map (\i -> i^i) [1..1000]