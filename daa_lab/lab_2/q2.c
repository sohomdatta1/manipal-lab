#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#define MAX_ARR_SIZE [4096];

int prime_factorization(int n, int * factor_arr) {
  int factor = 0;
  for(int i = 2; i <= n; i++) {
    if ( n % i == 0 ) {
        n = n / i;
        factor_arr[factor++] = i;
        i--;
    }
  }
  return factor - 1;
}

int gcd(int m, int n) {
  int m_factors MAX_ARR_SIZE;
  int n_factors MAX_ARR_SIZE;
  int result MAX_ARR_SIZE;
  int mf_size = prime_factorization(m, m_factors);
  int nf_size = prime_factorization(n, n_factors);

  int i = 0, j = 0, k = 0, op_count = 0;
  while(i <= mf_size && j <= nf_size) {
    op_count++;
    if ( m_factors[i] > n_factors[j] ) {
      j++;
    } else if ( m_factors[i] < n_factors[j] ) {
      i++;
    } else {
      result[k++] = m_factors[i];
      i++;
      j++;
    }
  }

  int gcd = 1;

  for (int i = 0; i < k; i++) {
    gcd *= result[i];
  }

  printf("Number of operations = %d\n", op_count);
  return gcd;
}

int main() {
  int n, m;
  printf("Enter m: ");
  scanf("%d", &n);
  printf("Enter n: ");
  scanf("%d", &m);
  printf("The GCD of a %d and %d is %d", m, n, gcd(m, n));
  return 0;
}
