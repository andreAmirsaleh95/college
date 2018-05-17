#include <stdlib.h>
#include <stdio.h>
#include "circular-list.h"

int main(int argc, char *argv[]) {
	int SIZE = 10;
	struct circular_list *my_list = malloc(sizeof(*my_list));
	circular_list_create(my_list, SIZE);
	
	// add 10 doubles to the list:
	int i;
	for (i = 0; i < SIZE; i++) {
		circular_list_insert(my_list, (double) i);
	}
	// Remove all 10 items, and print them:
	double *item = malloc(sizeof(*item));
	for (i = 0; i < SIZE; i++) {
		circular_list_remove(my_list, item);
		printf("%lf\n", *item);
	}

	free(my_list);
	free(item);
	return 0;
}