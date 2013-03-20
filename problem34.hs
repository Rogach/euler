import Data.Char

main :: IO ()
main = print $ sum $ filter (\n -> (sum $ map (fact . digitToInt) (show n)) == n) [3..7*(fact 9)]

fact :: Int -> Int
fact n = if n == 0 then 1 else if n == 1 then 1 else n * fact (n-1)