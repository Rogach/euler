{-# LANGUAGE ForeignFunctionInterface #-}

module Euler.Sieve where 
import Foreign.C
import Foreign
import Control.Applicative

foreign import ccall "sieve" c_sieve :: Int -> Ptr Int -> IO (Ptr Int)

sieve :: Int -> IO [Int]
sieve n = alloca $ \ptr -> do
  resultPtr <- c_sieve n ptr
  resultSize <- peek ptr
  primes <- peekArray resultSize resultPtr
  free resultPtr
  return primes