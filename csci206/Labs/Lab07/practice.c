#include <stdio.h>
#include <stdlib.h>

int counte(char *string_pointer) {
	int num_es = 0;
	while (*string_pointer != '\0') {
		if (*string_pointer == 'e') {
			num_es++;
		}
		string_pointer++;
	}
	return num_es;
}

int main(int argc, char* argv) {
	char my_string[100];
	printf("Enter a string: ");
	scanf("%s", my_string);
	int numEs = counte(my_string);
	printf("There are %d e's\n", numEs);
}