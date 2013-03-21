import Data.List
import Data.Maybe

main :: IO ()
main = print $ last $ sort $ filter ((== "123456789") . sort) $ 
       catMaybes $ map pandigital [1..9999]
       
pandigital :: Int -> Maybe String
pandigital n = find ((==9) . length) $ map (\i -> concatMap (show . (n*)) [1..i])  [1..9]