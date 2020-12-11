#include <stdio.h>

int NchooseK(int n, int k){
  if(n == 0 && k == 0){
  return 1;
  }

  if((n == k) || (k == 0)){
  return 1;
  }
  return NchooseK(n-1, k-1) + NchooseK(n-1, k);

}

int main()
{

int n, k;
while((n != 0) || (k != 0)){
printf("Enter two integers (for n and k) separated by space:\n");
scanf("%d%d", &n, &k);
int nk = NchooseK(n, k);
printf("%d\n", nk);
}
}
