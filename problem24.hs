import Data.List
import Data.Maybe

main :: IO ()
main = print $ permutation [0..9] 999999

permutation :: [Int] -> Int -> [Int]
permutation [n] _ = [n]
permutation digits count = let ln = length digits - 1
                               nextIdx = fromJust $ find (\i -> (i+1) * fact ln > count) [0..ln]
                               d = digits !! nextIdx
                            in d : permutation (digits \\ [d]) (count - nextIdx * fact ln)

fact :: Int -> Int
fact 1 = 1
fact n = n * fact (n-1)
