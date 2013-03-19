import Euler.Util
import Data.List

main :: IO ()
main = print $ sum $ nub $ concat [[a,b] | a <- [1..9999], b <- [1..9999], a /= b, d a == b, d b == a]
           
d :: Int -> Int
d = sum . properDivisors
