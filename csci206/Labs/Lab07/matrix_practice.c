#include <stdio.h>

int print_m (int x[2][3]) {
	int i,j;
	for (j = 0; j < 2; j++){
		for (i = 0; i < 3; i++) {
			printf("%d ", x[j][i]);
		}
		printf ("\n");
	}
	printf ("\n");
}

int main(void) {
	int A[2][3] = {{0, 1, 2}, {9, 8, 7}};
	int B[2][3] = {{6, 5, 4}, {3, 4, 5}};
	int C[2][3] = {0};

	print_m(A);
	print_m(B);

	matrix_sum(A,B,C);

	print_m(C);
}

int matrix_sum(int A[2][3], int B[2][3], int C[2][3]) {
	int row;
	int col;
	for (row = 0; row < 2; row++) {
		for (col = 0; col < 3; col++) {
			C[row][col] = A[row][col] + B[row][col];
		}
	}
	return 0;
}