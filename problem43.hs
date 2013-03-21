import Euler.Util
import Data.List
import Data.Char

main :: IO ()
main = print $ sum $ map (read . map intToDigit) $ concat
       [ grow [a,b,c] ([0..9] \\ [a,b,c]) [13,11,7,5,3,2] 
       | a <- [0..9]
       , b <- [0..9]
       , c <- [0..9]
       , mod (a*100 + b*10 + c) 17 == 0
       , a /= b
       , b /= c
       , a /= c
       ]

grow :: [Int] -> [Int] -> [Int] -> [[Int]]
grow end digits primes = 
  if length digits == 1
  then [digits ++ end]
  else let ds = filter (\d -> mod (read $ map intToDigit (d : take 2 end)) (head primes) == 0) digits
       in concatMap (\d -> grow (d:end) (digits \\ [d]) (tail primes)) ds
