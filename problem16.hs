import Data.Char

main = print $ sum $ map digitToInt $ show $ product $ replicate 1000 2