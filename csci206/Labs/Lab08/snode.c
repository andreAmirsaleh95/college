#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "snode.h"

struct snode *snode_create(char *s, int length) {
	struct snode *my_snode = malloc(sizeof(struct snode));
	strcpy(my_snode->str, s);
	my_snode->length = length;
	my_snode->next = NULL;
	return my_snode;
}

