#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main() {
	int n;
	printf("Enter number of nodes: ");
	scanf("%d", & n);
	int arr[n][n];
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			if (i == j) {
				arr[i][j] = true;
				continue;
			}
			printf("Does %dth node and %dth node have a connection in that direction (y/n): ", i, j);
			char temp;
			scanf("%c", & temp);
			char ch;
			scanf("%c", & ch);
			if (ch == 'y') {
				arr[i][j] = true;
			} else if (ch == 'n') {
				arr[i][j] = false;
			}
		}
	}
	printf("Adjacency matrix: \n");
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			printf("%d\t", arr[i][j]);
		}
		printf("\n");
	}
	return 0;
}
