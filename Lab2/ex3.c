#include <stdio.h>

int main()
{

int a, b, c, d, e, f;

printf("Enter six integers:\n");

scanf("%i %i %i %i %i %i", &a, &b, &c, &d, &e, &f);

printf("1234567890bb1234567890\n");
printf("%*d  %*d\n", 10, a, 10, b);
printf("%*d  %*d\n", 10, c, 10, d);
printf("%*d  %*d\n", 10, e, 10, f);
}
