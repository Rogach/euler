import Data.List
import Data.Ord

-- dumb way, but fast (completes in 5.2s)
main :: IO ()
main = print $ fst $ maximumBy (comparing (length . snd)) $ map (\n -> (n, collatz n)) [1..999999]
collatz :: Int -> [Int]
collatz n
  | n == 1 = [1] 
  | even n = n : collatz (n `div` 2) 
  | otherwise = n : collatz (3*n + 1)
