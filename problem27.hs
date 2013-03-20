import Math.NumberTheory.Primes
import Data.Ord
import Data.List

main :: IO ()
main = print $ fst $ maximumBy (comparing snd) [ (a*b, test a b) | a <- [-999..999], b <- [-999..999]]

test :: Int -> Int -> Int
test a b = length $ takeWhile (isPrime . fromIntegral) $ map (\n -> n*n + a*n + b) [0..]