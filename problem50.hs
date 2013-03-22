import Math.NumberTheory.Primes
import Data.Ord
import Data.List

main :: IO ()
main = print $ sum $ 
       maximumBy (comparing length) $ 
       filter (isPrime . sum) $
       concat $ takeWhile (not . null) $
       map (tail . takeWhile ((<1000000) . sum) . tail . inits) $ tails primes
