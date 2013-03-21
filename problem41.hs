import Data.List
import Math.NumberTheory.Primes

-- don't do 8, 9 digits, since (mod (sum [1..8]) 3 == 0), thus there are no primes in those pandigitals
main :: IO ()
main = print $ last $ filter isPrime $ sort $ concatMap pandigitals [4..7] 

pandigitals :: Int -> [Integer]
pandigitals n = map (read . concatMap show) $ permutations [1..n]
