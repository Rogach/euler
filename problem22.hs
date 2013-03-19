import Data.List.Split
import Data.Char
import Data.List

main :: IO ()
main = readFile "data/names.txt" >>= print . sum . zipWith (*) [1..] . map (sum . map charValue . tail . init) . sort . splitOn ","

charValue :: Char -> Int
charValue c = ord c - 64