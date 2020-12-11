#include <stdio.h>

int main()
{
int r;
printf("Enter a number from 1 to 20:\n");
scanf("%d", &r);

if ((r > 0) && (r < 21)){
	if (r == 1){
	printf("1st\n");
	}
	if (r == 2){
	printf("2nd\n");
	}
	if (r == 3){
	printf ("3rd\n");
	}
	if ((r > 3) && (r < 21)){
	printf("%dth\n", r);
	}
}
if ((r < 1) || (r > 20)){
printf("Number is not in the range from 1 to 20\n");
}
}
