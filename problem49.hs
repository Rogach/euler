import Math.NumberTheory.Primes
import Data.Char
import Data.List
import Data.Maybe

main :: IO ()
main = print $ concatMap show $ fromJust $ head $ tail $
       filter isJust $ map test $ takeWhile (<10000) $ dropWhile (<1000) primes

test :: Integer -> Maybe [Integer]
test n = let ds = map digitToInt $ show n
             mkn = read . map intToDigit
         in listToMaybe
            [ [n, n1, n2] 
            | n1 <- map mkn $ permutations ds
            , n1 > n
            , n2 <- map mkn $ permutations ds
            , n2 > n1
            , n2 - n1 == n1 - n
            , isPrime n1
            , isPrime n2
            ]
