/* Andre Amirsaleh
 * Tuesday/12:00 (2/9/16)
 * lab 04 - calc.c
 * notes: none
 */

#include<stdlib.h>
#include<string.h>
#include<stdio.h>

int main(int argc, char* argv[]) {
	int i = 0;

	if (strcmp(argv[1], "add") == 0) {
		float sum = 0;
		for (i = 2; i < argc; ++i) {
			sum += atof(argv[i]);
		}
		printf("%f\n", sum);

	} else if (strcmp("mult", argv[1]) == 0) {
		float product = atof(argv[2]);
		for (i = 3; i < argc; ++i) {
			product *= atof(argv[i]);
		}
		printf("%f\n", product);

	} else if (strcmp("div", argv[1]) == 0) {
		float quotient = atof(argv[2]);
		for (i = 3; i < argc; ++i) {
			quotient /= atof(argv[i]);
		}
		printf("%f\n", quotient);

	} else if (strcmp("len", argv[1]) == 0) {
		int sum = 0;
		for (i = 2; i < argc; ++i) {
			sum += strlen(argv[i]);
		}
		printf("%d\n", sum);
	} else {
		printf("Unsupported function, try: add, mult, div, or len\n");
	}
	return 0;
}
