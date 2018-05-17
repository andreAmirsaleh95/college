#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "dnode.h"
 
// global variables (data segment)
 
struct dnode *n1, *n2, *n3, *p;
 
//------------ MY MAIN FUNCTION --------------------

int main(int argc, char *argv[]) {

	// create snodes
	n1 = dnode_create("hello");
	n2 = dnode_create("there");
	n3 = dnode_create("prof");

	printf("dnode-test running...\n");

	// manually "link" the nodes together.
	n1->next = n2;
	n2->next = n3;
	n3->next = NULL;

	// p points to node n1 initially
	p = n1;

	while (p != NULL) {
	// Complete this line to print the current node's string and   
	// the stored length (do not use strlen!)
	printf("str: %s - length: %d\n", p->str, p->length);
	// until you add this line, this program will have an infinite loop.
	p = p->next;
	}

	dnode_destroy(n1);
	dnode_destroy(n2);
	dnode_destroy(n3);

	return 0;
}