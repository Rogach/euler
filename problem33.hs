import Data.Ratio
import Data.Char

main :: IO ()
main = print $ denominator $ product
       [ a % b
       | a <- [10..99]
       , b <- [10..99]
       , a < b
       , mod a 10 /= 0
       , mod b 10 /= 0
       , test a b
       ]

test :: Int -> Int -> Bool
test a b = let (a1:a2:[]) = map digitToInt (show a)
               (b1:b2:[]) = map digitToInt (show b)
           in a2 == b1 && (a1 % b2 == a % b)
