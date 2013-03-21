import Data.List
import Euler.Util

main :: IO ()
main = readCsvFile "data/names.txt" >>= print . sum . zipWith (*) [1..] . map (sum . map charValue) . sort
