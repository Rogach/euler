compile:
	ghc -optc -std=gnu99 --make -o primes primes.hs sieve_ffi.hs sieve.c
clean:
	rm *.o sieve primes *.hi sieve.h.gch 2>/dev/null || true
