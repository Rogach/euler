module Euler.Util
       ( factor
       , sliding
       , module Euler.Sieve
       ) where

import Data.List
import Euler.Sieve (sieve)
import System.IO.Unsafe

primeCache :: [Int]
primeCache = unsafePerformIO $ sieve 1000000 -- gods save us

-- capable of factoring ints up to 10^12
factor :: Int -> [Int]
factor n = let max = floor $ sqrt (fromIntegral n)
           in case find (\x -> mod n x == 0) (takeWhile (<=max) primeCache) of
             Just d -> d:factor (n `div` d)
             Nothing -> [n]
             
sliding :: Int -> [a] -> [[a]]
sliding w l = if length (take w l) == w
              then take w l : sliding w (drop 1 l)
              else []
