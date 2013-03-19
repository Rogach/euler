import Data.List
import Euler.Util

main :: IO ()
main = print $ product $ foldr ((\acc pr -> acc ++ (pr \\ acc)) . factor) [] [2..20]

-- Dumb way. It actually completes in 50s, but still it's not good
-- find (\x -> all (\n -> mod x n == 0) [2..20]) [1..]
