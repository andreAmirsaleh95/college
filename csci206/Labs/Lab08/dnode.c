#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "dnode.h"

struct dnode *dnode_create(char *s) {
	struct dnode *new_dnode = malloc(sizeof(struct dnode));
	new_dnode->str = malloc(strlen(s) + 1);
	strcpy(new_dnode->str, s);
	new_dnode->length = strlen(new_dnode->str);
	new_dnode->next = NULL;
	new_dnode->prev = NULL;
	return new_dnode;
}

void dnode_destroy(struct dnode *n) {
	free(n->str);
	free(n);
}

/**
 * Compares the string in the dnode n to str.
 * Returns <0 if node->str < str, 0 if node->str == str, and >0 if node->str > str
 */
int dnode_cmp(struct dnode *n, char *str) {
	if ( strcmp( n->str, str ) < 0 ) {
		return -1;
	} else if ( strcmp( n->str, str ) == 0 ) {
		return 0;
	} else if ( strcmp( n->str, str ) > 0 ) {
		return 1;
	}
}