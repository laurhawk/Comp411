#include <stdio.h>
#include <string.h>
#define MAX_BUF 1024

int main()
{

char buf[MAX_BUF];
int length;
int looplength;

length = 2;

while(length > 1){

fgets(buf, MAX_BUF, stdin);
looplength = strlen(buf);

if(buf[0] == '\n'){
break;
}

for(int i = 0; i < looplength - 1; i++){
  if(buf[i] == 'E' ||buf[i] == 'e'){
  buf[i] = '3';
  } 

  else if(buf[i] == 'I' || buf[i] == 'i'){
  buf[i] = '1';
  }

  else if(buf[i] == 'O' || buf[i] == 'o'){
  buf[i] = '0';
  }

  else if(buf[i] == 'S' ||buf[i] == 's'){
  buf[i] = '5';
  }
}

printf("%s", buf);

}

}
