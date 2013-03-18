import Euler.Sieve
main = fmap length (sieve 1000000) >>= print