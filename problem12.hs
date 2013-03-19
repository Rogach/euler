import Euler.Util
import Data.List

main = print $ find (\t -> length (divisors t) >= 500) $ scanl (+) 1 [2..]
