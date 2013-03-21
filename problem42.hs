import Euler.Util

main :: IO ()
main = readCsvFile "data/words.txt" >>= print . length . filter isTriangle

isTriangle :: String -> Bool
isTriangle word = let v = sum $ map charValue word
                  in v == (head $ dropWhile (<v) triangle)

triangle :: [Int]
triangle = map (\n -> n * (n + 1) `div` 2) [1..]
  
