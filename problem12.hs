import Euler.Util
import Data.List
import Control.Applicative

main = print $ find (\t -> length (divisors t) >= 500) $ scanl (+) 1 [2..]

divisors :: Int -> [Int]
divisors n = nub $ product <$> (tail $ subsequences (factor n))
