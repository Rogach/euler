import Numeric
import Data.Char

main :: IO ()
main = print $ sum $ filter (\n -> isPalindromic (show n) && isPalindromic (showBin n)) [1..999999]

showBin :: Int -> String
showBin n = showIntAtBase 2 intToDigit n ""

isPalindromic :: (Eq a) => [a] -> Bool
isPalindromic l = reverse l == l