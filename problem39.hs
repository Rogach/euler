import Data.Function
import Data.List
import Data.Ord

main :: IO ()
main = print $ fst $ head $ 
       maximumBy (comparing length) $ groupBy (on (==) fst) $ 
       sort
       [ (a+b+c,(a,b,c)) | a <- [1..500], b <- [1..500], a < b, c <- getC a b, a + b + c <= 1000]

getC :: Int -> Int -> [Int]
getC a b = let kt = a*a + b*b
               c = sqrt (fromIntegral kt)
           in [floor c | c == fromIntegral (floor c)]
