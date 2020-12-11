#include <stdio.h>

int A[10][10];
int B[10][10];
int C[10][10];
//int m, inputA, inputB;

int main() {
int m, inputA, inputB;
//printf("%s\n", "Please enter a number between 1 and 10:");
scanf("%d", &m); 
//input matrix a
//printf("%s\n", "Please enter the values for matrix A:");
for(int i = 0; i < m; i++){
  for(int j = 0; j < m; j++){
    scanf("%d", &inputA);
    A[i][j] = inputA;
  }
}

//input matrix b
//printf("%s\n", "Please enter the values for matrix B:");
for(int i = 0; i < m; i++){
  for(int j = 0; j < m; j++){
    scanf("%d", &inputB);
    B[i][j] = inputB;
  }
}

//multiplication
for(int i = 0; i < m; i++){
  for(int j = 0; j < m; j++){
//    C[i][j] = 0;
    for(int k = 0; k < m; k++){
      C[i][j] += A[i][k] * B[k][j];
    }
  }
}

for(int i = 0; i < m; i++){
  for(int j = 0; j < m; j++){
    printf("%6d", C[i][j]);
  }
  printf("\n");
}

}
