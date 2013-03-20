import Data.List

main :: IO ()
main = print $ length $ split 200 [200,100,50,20,10,5,2,1]

split :: Int -> [Int] -> [[Int]]
split n coins = 
  if n == 0 
  then [[]]
  else concatMap (\cs -> map (head cs :) $ split (n - head cs) cs) $ 
       filter ((<=n) . head) (init $ tails coins)
