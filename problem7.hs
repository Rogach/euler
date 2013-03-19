import Euler.Util
import Control.Applicative

main :: IO ()
main = print =<< (!! 10000) <$> sieve 200000
