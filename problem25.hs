import Data.List

main :: IO ()
main = print $ fst $ head $ dropWhile ((<10^999) . snd) $ zip [1..] fibs

fibs :: [Integer]
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
