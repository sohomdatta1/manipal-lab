#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int gcd(int m, int n) {
  int t = m > n ? n: m;
  int opcount = 0;
  while(m % t != 0 || n % t != 0) {
    opcount++;
    t--;
  }
  printf("Number of operations : %d\n", opcount);
  return t;
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
