#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MAX 1000 /* The maximum number of characters in a line of input */

int main()
{
  char text[MAX], c;
  char palindrome[MAX];
  int lowercase, uppercase, digits, other;
  int length;

  puts("Type some text (then ENTER):");

  /* Save typed characters in text[]: */

  fgets(text, MAX, stdin);
  length = strlen(text) - 1;
  
  /* Analyse contents of text[]: */
 char reverse[strlen(text)];
 int reverseindex = 0;
 printf("Your input in reverse is:\n"); 
 for(int i = length - 1; i >= 0; i--){
 char temp = text[i];
 reverse[reverseindex] = temp;
 reverseindex++;
 }
reverse[length] = '\0';
text[length] = '\0';
printf("%s\n", reverse);

//char strcpy(char reverse, char newreverse);
//printf("%s\n", newreverse);

int result = strcmp(text, reverse);
if (result == 0){ 
printf("Found a palindrome!\n");
}
/*if(result != 0){
for(int i = length-1; i >=0; i++){

}
printf("%s\n", newreverse);
printf("%s\n", newtext);

}*/
}
