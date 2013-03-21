import Math.NumberTheory.Primes
import Data.List

main :: IO ()
main = print $ sum $ take 11 $ filter truncatable $ dropWhile (<10) primes

truncatable :: Integer -> Bool
truncatable n = let xs = show n
                in all (isPrime . read) $ tail (inits xs) ++ init (tails xs)