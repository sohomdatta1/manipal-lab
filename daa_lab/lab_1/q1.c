#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
typedef struct node {
	int data;
	struct node * left;
	struct node * right;
}
node;
typedef struct tree {
	struct node * root;
}
tree;
void inorderTraversal(node * temp) {
	if (!temp -> right && !temp -> left) {
		printf("%d ", temp -> data);
	} else if (temp -> right && !temp -> left) {
		printf("%d ", temp -> data);
		inorderTraversal(temp -> right);
	} else if (temp -> left && !temp -> right) {
		inorderTraversal(temp -> left);
		printf("%d ", temp -> data);
	} else {
		inorderTraversal(temp -> left);
		printf("%d ", temp -> data);
		inorderTraversal(temp -> right);
	}
}
void postOrderTraversal(node * temp) {
	if (!temp -> right && !temp -> left) {
		printf("%d ", temp -> data);
	} else if (temp -> left && !temp -> right) {
		postOrderTraversal(temp -> left);
		printf("%d ", temp -> data);
	} else if (temp -> right && !temp -> right) {
		postOrderTraversal(temp -> right);
		printf("%d ", temp -> data);
	} else {
		postOrderTraversal(temp -> left);
		postOrderTraversal(temp -> right);
		printf("%d ", temp -> data);
	}
}
void preOrderTraversal(node * temp) {
	if (!temp -> right && !temp -> left) {
		printf("%d ", temp -> data);
	} else if (temp -> left && !temp -> right) {
		printf("%d ", temp -> data);
		preOrderTraversal(temp -> left);
	} else if (temp -> right && !temp -> left) {
		printf("%d ", temp -> data);
		preOrderTraversal(temp -> right);
	} else {
		printf("%d ", temp -> data);
		preOrderTraversal(temp -> left);
		preOrderTraversal(temp -> right);
	}
}
bool search(node * temp, int data) {
	if (temp -> data < data) {
		if (!temp -> left) {
			return false;
		}
		return search(temp -> left, data);
	} else if (temp -> data > data) {
		if (!temp -> right) {
			return false;
		}
		return search(temp -> right, data);
	} else if (temp -> data == data) {
		return true;
	}
}
void add(node * temp, int data) {
	if (temp -> data < data) {
		if (!temp -> left) {
			node * t1 = (node * ) malloc(sizeof(node));
			t1 -> data = data;
			temp -> left = t1;
			printf("Added to left\n");
		}
		add(temp -> left, data);
	} else if (temp -> data > data) {
		if (!temp -> right) {
			printf("Added to right\n");
			node * t1 = (node * ) malloc(sizeof(node));
			t1 -> data = data;
			temp -> right = t1;
		}
		add(temp -> right, data);
	}
}
tree * createBinaryTree() {
	tree * tr = (tree * ) malloc(sizeof(tree));
	tr -> root = NULL;
	int t = 0;
	bool flag = true;
	int t1 = 0;
	printf("Enter element, enter -1 to exit: ");
	scanf("%d", & t1);
	if (t1 == -1) {
		return tr;
	}
	node * tn = (node * ) malloc(sizeof(node));
	printf("Is root");
	tn -> data = t1;
	tr -> root = tn;
	while (flag) {
		printf("Enter element, enter -1 to exit: ");
		scanf("%d", & t);
		if (t == -1) {
			flag = false;
			continue;
		}
		node * temp = tr -> root;
		add(temp, t);
	}
	return tr;
}
int main() {
	tree * tr = createBinaryTree();
	printf("Inorder Travesal : ");
	inorderTraversal(tr -> root);
	printf("\n");
	printf("Preorder Travesal : ");
	preOrderTraversal(tr -> root);
	printf("\n");
	printf("Postorder Travesal : ");
	postOrderTraversal(tr -> root);
	printf("\n");
	printf("Enter number to search: ");
	int data;
	scanf("%d", & data);
	bool result = search(tr -> root, data);
	if (!result) {
		printf("key not found\n");
	} else if (result) {
		printf("key found\n");
	}
	return 0;
}
