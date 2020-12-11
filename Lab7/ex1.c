#include <stdio.h>

int AA[100];  		// linearized version of A[10][10]
int BB[100];  		// linearized version of B[10][10]
int CC[100];  		// linearized version of C[10][10]
int m;       		// actual size of the above matrices is mxm, where m is at most 10

int main() {
	// code here
int inputA, inputB;
//printf("%s\n", "Please enter a number between 1 and 10:");
scanf("%d", &m);

//input matrix a
//printf("%s\n", "Please enter the values for matrix A:");
for(int i = 0; i < m*m; i++){
    scanf("%d", &inputA);
    AA[i] = inputA;
  }

//input matrix b
//printf("%s\n", "Please enter the values for matrix B:");
for(int i = 0; i < m*m; i++){
    scanf("%d", &inputB);
    BB[i] = inputB;
  }

//multiplication

for(int row = 0; row < m; row++){
  for(int col = 0; col < m; col++){
    for(int k = 0; k < m; k++){
   CC[row*m+col] += AA[row*m+k] * BB[col+k*m];
    }
  }
}

//printing
for(int i = 0; i < m; i++){
  for(int j = 0; j < m; j++){

  printf("%d ", CC[i*m+j]);
  // printf("\n");
  }
   printf( "\n");
}

}
