/*  Example: C program to find area of a circle */

#include <stdio.h>
#define PI 3.14159
#define CM 6.4516
#define PPI 6.28318
#define CCM 2.54

int main()
{
  float r, a, b;

  printf("Enter radius (in cm):\n");
  scanf("%f", &r);

  a = (PI * r * r) / CM;
  b = (PPI * r) / CCM;

  printf("Circle's area is %3.2f (sq in).\n", a);
  printf("Its circumference is %3.2f (in).\n", b);
}
