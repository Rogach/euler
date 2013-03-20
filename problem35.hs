import Math.NumberTheory.Primes
import Data.List

main :: IO ()
main = print $ length $ filter (all (isPrime . fromIntegral) . rotate) $ takeWhile (<1000000) primes

rotate :: Integer -> [Integer]
rotate n = let xs = show n
           in map read $ init $ tail $ zipWith (++) (tails xs) (inits xs)