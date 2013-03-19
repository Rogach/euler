import Euler.Util
import Control.Applicative

main :: IO ()
main = print =<< sum <$> sieve 2000000
