import Euler.Util
import Control.Applicative

main = print =<< (!! 10000) <$> sieve 200000