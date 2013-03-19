import Euler.Util

main :: IO ()
main = print $ sum $ filter (not . hasSum) [1..28123]

hasSum :: Int -> Bool
hasSum n = hasSum' abundant (reverse abundant)
           where hasSum' (s:_) (b:_) | s + b == n = True
                 hasSum' (s:sx) (b:bx) | s + b > n  = hasSum' (s:sx) bx
                 hasSum' (s:sx) (b:bx) | s + b < n  = hasSum' sx (b:bx)
                 hasSum' _ _ = False

abundant :: [Int]
abundant = filter (\n -> sum (properDivisors n) > n) [1..28123]
