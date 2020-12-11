#include <stdio.h>

int main(){

int a1, a2, a3, a4, a5, a6, a7, a8, a9;
int b1, b2, b3, b4, b5, b6, b7, b8, b9;
int c1, c2, c3, c4, c5, c6, c7, c8, c9;

printf("Please enter 9 values for matrix A:\n");

scanf("%d%d%d%d%d%d%d%d%d", &a1, &a2, &a3, &a4, &a5, &a6, &a7, &a8, &a9);

printf("Please enter 9 values for matrix B:\n");

scanf("%d%d%d%d%d%d%d%d%d", &b1, &b2, &b3, &b4, &b5, &b6, &b7, &b8, &b9);

c1 = a1 + b1;
c2 = a2 + b2;
c3 = a3 + b3;
c4 = a4 + b4;
c5 = a5 + b5;
c6 = a6 + b6;
c7 = a7 + b7;
c8 = a8 + b8;
c9 = a9 + b9;

printf("C = B + A =\n");
printf("%10d%10d%10d\n", c1, c2, c3);
printf("%10d%10d%10d\n", c4, c5, c6);
printf("%10d%10d%10d\n", c7, c8, c9);

}
