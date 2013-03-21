import Euler.Util
import Data.List

main :: IO ()
main = print $ head $ head $ 
       filter (\s -> s == [head s .. head s + 3]) $ sliding 4 $ 
       map fst $ filter (\(i, fs) -> length fs == 4) $ 
       map (\i -> (i, nub $ factor i)) [1..]
