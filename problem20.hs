import Data.Char
main = print $ sum $ map digitToInt $ show $ product $ takeWhile (<=100) $ iterate (+1) 1