/*
 * Name: Andre Amirsaleh
 * Date: 3/1/16
 * Lab Instructor: Professor Razet
 * Lab Time: Tuesday, 1:00PM - 2:52PM
 */

#include <stdio.h> 

int counte(char *string_pointer);

int main(void) {
	char my_string[100];
	printf("Enter a string: ");
	scanf("%s", my_string);
	char *p = my_string;
	int num_es = counte(p);
	printf("Number of e's: ");
	printf("%d\n", num_es);
	printf("%s\n", my_string);
	return 0;
}