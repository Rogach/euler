import Data.Char

main :: IO ()
main = let digits = concatMap show [1..]
       in print $ product $ map ((\n -> digitToInt $ digits !! (n-1)) . (10^)) [0..6]