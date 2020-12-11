#include <stdio.h>

int main()
{

double a;
double b;
double c;
double d;
double e;
double f;
double g;
double h;
double i;
double j;

double sum;
double min;
double max;
double product;

printf("Enter 10 floating-point numbers:\n");

scanf("%lf", &a);
sum = a;
min = a;
max = a;
product = a;

scanf("%lf", &b);
sum += b;
if(b < a){
min = b;
}
if(b > a){
max = b;
}
product = product * b;


scanf("%lf", &c);
sum += c; 
if(c < min){
min = c;
}
if(c > max){
max = c;
}
product = product * c;

scanf("%lf", &d);
sum += d; 
if(d < min){
min = d;
}
if(d > max){
max = d;
}
product = product * d;

scanf("%lf", &e);
sum += e; 
if(e < min){
min = e;
}
if(e > max){
max = e;
}
product = product * e;

scanf("%lf", &f);
sum += f; 
if(f < min){
min = f;
}
if(f > max){
max = f;
}
product = product * f;

scanf("%lf", &g);
sum += g; 
if(g < min){
min = g;
}
if(g > max){
max = g;
}
product = product * g;

scanf("%lf", &h);
sum += h; 
if(h < min){
min = h;
}
if(h > max){
max = h;
}
product = product * h;

scanf("%lf", &i);
sum += i; 
if(i < min){
min = i;
}
if(i > max){
max = i;
}
product = product * i;

scanf("%lf", &j);
sum += j; 
if(j < min){
min = j;
}
if(j > max){
max = j;
}
product = product * j;

printf("Sum is %.5f \n", sum);
printf ("Min is %.5f\n", min);
printf("Max is %.5f\n", max);
printf("Product is %.5f \n", a*b*c*d*e*f*g*h*i*j);

}
