#include<stdio.h>

int NchooseK(int n, int k);

int main() {

  int result;

  int n = 1;
  int k = 1;
    // Do the following inside a loop
    // ...
    while((n != 0) || (k != 0)){
    scanf("%d", &n);
    // ...
    if (n == 0){
      break;
    }
    scanf("%d", &k);
    result = NchooseK(n, k);
    printf("%d\n", result);
    }
    //  ...
}



int NchooseK(int n, int k) {
    // recursive implementation
    //  ...
    //  ...

  if(n==0 && k==0){
    return 1;
  }

  if((n==k || k==0)){
    return 1;
  }

  return NchooseK(n-1, k-1) + NchooseK(n-1, k);
}
