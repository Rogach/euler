#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include <math.h>

long long * sieve(long long, long long *);
long long * sieve(long long N, long long * result_size) {
  bool* numbers;
  numbers = calloc(N, sizeof(bool));
    
  for (long long q = 2; q < sqrt(N);) {
    for (long long w = q*q; w < N; w += q) {
      numbers[w] = true;
    }
    q++;
    while (q < N && numbers[q]) {
      q++;
    }
  }
    
    
  // now, when the heavy lifting is done, we need to marshall the data for haskell

  long long sz = 0;
  for (long long e = 2; e < N; e++) {
    if (!numbers[e]) {
      sz++;
    }
  }

  *result_size = sz;

  long long * result;
  result = malloc(sz * sizeof(long long));
  long long i = 0;
  for (long long e = 2; e < N; e++) {
    if (!numbers[e]) {
      result[i++] = e;
    }
  }

  free(numbers);

  return result;
}
