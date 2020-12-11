#include <stdio.h>

int main()
{
int w, h;

while(w > 0){
printf("Please enter width and height:\n");
scanf("%d", &w);
if(w==0){
printf("End\n");
break;
}
scanf("%d", &h);

if(w >= 3){
if(h >= 3){
printf("%s", "+");
for(int i = 0; i < w-2; i++){
printf("%s", "-");
}
printf("%s", "+\n");

for(int i = 0; i < h-2; i++){
printf("%s", "|");
for(int j = 0; j < w-2; j++){ 
printf("%s", "~");
}
printf("%s", "|\n");
}
printf("%s", "+");
for(int i = 0; i < w-2; i++){
printf("%s", "-");
}
printf("%s", "+\n");
}
}

if(w >= 3){
if(h == 2){
printf("%s", "+");
for(int i = 0; i < w-2; i++){
printf("%s", "-");
}
printf("%s", "+\n");
printf("%s", "+");
for(int i = 0; i < w-2; i++){ 
printf("%s", "-");
}
printf("%s", "+\n");
}
if(h == 1){
printf("%s", "+");
for(int i = 0; i < w-2; i++){
printf("%s", "-");
}
printf("%s", "+\n");
}
}

if(w == 2){
for(int i = 0; i < h; i++){
printf("%s", "++\n");
}
}
if(w == 1){
if(h >= 3){
printf("%s", "+\n");
for(int i = 0; i < h-2; i++){
printf("%s", "|\n");
}
printf("%s", "+\n");
}
if(h == 1){
printf("%s", "+\n");
}
}

}}
