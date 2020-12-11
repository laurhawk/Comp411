#include <stdio.h>
#include <string.h>

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

int result = strcmp(text, reverse);
if (result == 0){ 
printf("Found a palindrome!\n");
}


/*
  for (i = lowercase = uppercase = digits = other = 0; i < MAX; i++)
  {
    c = text[i];
    if (c >= 'a' && c <= 'z')
      lowercase++;
    else if (c >= 'A' && c <= 'Z')
      uppercase++;
    else if (c >= '0' && c <= '9')
      digits++;
    else
    {
      if (c == '\n')
        break;
      other++;
    }
  }
  
  puts("\nYou typed:");
  printf("A string with %d characters\n", length);
  printf("\t%d lower case letters\n", lowercase);
  printf("\t%d upper case letters\n", uppercase);
  printf("\t%d digits\n", digits);
  printf("\t%d others\n", other);
  */
  
}
