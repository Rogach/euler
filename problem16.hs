import Data.Char

main :: IO ()
main = print $ sum $ map digitToInt $ show $ product $ replicate 1000 2
