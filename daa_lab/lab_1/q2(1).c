#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct node {
	int destNode;
	struct node * next;
}
node;
typedef struct adjlist {
	node * head;
}
adjlist;
void add(int src, int dest, adjlist ** arr) {
	node * new = (node * ) malloc(sizeof(node));
	new -> destNode = dest;
	node * temp = arr[src] -> head;
	if (!temp) {
		arr[src] -> head = new;
		return;
	}
	while (!!temp -> next) {
		temp = temp -> next;
	}
	temp -> next = new;
}
adjlist ** createGraph(int n) {
	adjlist ** arr = (adjlist ** ) calloc(n, sizeof(adjlist * ));
	for (int i = 0; i < n; i++) {
		arr[i] = (adjlist * ) malloc(sizeof(adjlist * ));
		arr[i] -> head = NULL;
	}
	return arr;
}
void printGraph(adjlist ** arr, int n) {
	for (int i = 0; i < n; i++) {
		printf("%d -> ", i);
		node * temp = arr[i] -> head;
		while (!!temp) {
			printf("%d -> ", temp -> destNode);
			temp = temp -> next;
		}
		printf("(nil)\n");
	}
}
int main() {
	int n;
	printf("Enter number of nodes: ");
	scanf("%d", & n);
	adjlist ** arr = createGraph(n);
	bool flag = true;
	for (int i = 0; i < n; i++) {
		printf("Enter nodes adjacent to %d: \n", i);
		while (true) {
			printf("Enter node, enter -1 to stop: ");
			int t1 = 0;
			scanf("%d", & t1);
			if (t1 == -1) {
				break;
			}
			add(i, t1, arr);
		}
	}
	printf("Adjacency matrix: \n");
	printGraph(arr, n);
	return 0;
}
