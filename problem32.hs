import Data.List

main :: IO ()
main = print $ sum $ nub [ a*b | a <- [1..9999], b <- takeWhile ((<10000) . (*a))[1..9999], test a b]

test :: Int -> Int -> Bool
test a b = sort (show a ++ show b ++ show (a*b)) == "123456789"