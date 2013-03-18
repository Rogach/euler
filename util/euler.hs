module Euler.Util
       ( euler
       , factor
       , module Euler.Sieve
       ) where

import Data.List
import Euler.Sieve (sieve)

euler :: IO ()
euler = putStrLn "Euler problem"

factor :: Int -> [Int]
factor n = let max = floor $ sqrt (fromIntegral n)
           in case find (\x -> mod n x == 0) [2..max] of
             Just d -> d:factor (n `div` d)
             Nothing -> [n]