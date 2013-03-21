import Math.NumberTheory.Primes
import Data.Maybe
import Data.List

main :: IO ()
main = print $ head $ 
       filter (\c -> isNothing $ find (\p -> is2square (c - p)) $ takeWhile (<c) primes) $
       filter (not . isPrime) [33,35..]

is2square :: Integer -> Bool
is2square n = let v = floor $ sqrt $ fromIntegral $ n `div` 2
              in 2*v^2 == n