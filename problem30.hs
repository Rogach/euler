import Data.Char

main :: IO ()
main = print $ sum $ filter (\n -> sum (map ((^5) . digitToInt) (show n)) == n ) [2..9^5*6]
