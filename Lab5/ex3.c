#include <stdio.h>
#include <string.h>

char animals[20][15];
char lyrics[20][60];
int number;

void nurseryrhyme(int current) {

  if(current==0){
      printf("%s", "There was an old lady who swallowed a ");
      printf("%s%s\n", animals[current], ";");

  } else if(current > 0) {
      printf("%*s", current, "");
      printf("She swallowed the ");
      printf("%s", animals[current-1]);
      printf("%s", " to catch the ");
      printf("%s%s\n", animals[current], ";");
  }

  if(current < number-1){
    nurseryrhyme(current+1);
  }

  printf("%*s", current, "");
  printf("%*s", current,  "I don't know why she swallowed a ");
  printf("%s", animals[current]);
  printf("%s%s\n", " - ", lyrics[current]);

}

int main() {
  int i=0;
  while (1) {
    fgets(animals[i], 15, stdin);
    if (strcmp(animals[i], "END\n") == 0){
      break;
    }
    int lenuno = strlen(animals[i]);
    animals[i][lenuno-1] = '\0';
    fgets(lyrics[i], 60, stdin);
    int lendos = strlen(lyrics[i]);
    lyrics[i][lendos-1] = '\0';
    i++;
  }
  number = i;
  nurseryrhyme(0);
}
