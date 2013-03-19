main :: IO ()
main = print $ head [ 
  a * b * c
  | a <- [1..1000]
  , b <- [a..1000]
  , let c2 = a*a + b*b
  , c2 < 1000000
  , isSquare c2
  , let c = floor $ sqrt (fromIntegral c2)
  , a + b + c == 1000
  ]
       
isSquare :: Int -> Bool
isSquare i = let root = floor $ sqrt (fromIntegral i)
             in root*root == i
