#include <stdlib.h>
#include "dlist.h"

/**
 * Allocates new dlist dynamically.
 * @return pointer to the list
 */
struct dlist *dlist_create() {
	struct dlist *new_dlist = malloc(sizeof(struct dlist));
	new_dlist->front = NULL;
	new_dlist->back = NULL;
	new_dlist->counter = 0;
	return new_dlist;
}
 
/** 
 * Inserts new node in dlist before the first node.
 * @param l pointer to the list (non-NULL)
 * @param str pointer to a C string to store in new list node
 * returns a pointer to the newly added node
 */
struct dnode* dlist_add_front(struct dlist *l, char *str) {
	struct dnode *new_dnode = dnode_create(str);
	if (l->front == NULL) {
		l->front = new_dnode;
		l->back = new_dnode;
	} else {
		l->front->prev = new_dnode;
		new_dnode->next = l->front;
		l->front = new_dnode;
	}
	l->counter++;
	return new_dnode;
}

/** 
 * Inserts new node in dlist after the last node.
 * @param l pointer to the list (non-NULL)
 * @param str pointer to a C string to store in new list node
 * returns a pointer to the newly added node
 */
struct dnode* dlist_add_back( struct dlist *l, char *str ) {
	struct dnode *new_dnode = dnode_create( str );
	if ( l->back == NULL ) {
		l->back = new_dnode;
		l->front = new_dnode;
	} else {
		l->back->next = new_dnode;
		new_dnode->prev = l->back;
		l->back = new_dnode;
	}
	l->counter++;
	return new_dnode;
}
 
/**
 * deallocate a list and all dnodes
 */
void dlist_destroy( struct dlist *l ) {
	struct dnode *curr = l->front;
	struct dnode *next;
	while ( curr != NULL ) {
		next = curr->next;
		dnode_destroy( curr );
		curr = next;
	}
	l->front = NULL;
	l->back = NULL;
	l->counter = 0;
	free( l );
}

/**
 * Returns the number of elements in the list (nodes).
 * @param l pointer to the list (non-NULL)
 */
uint32_t dlist_length( struct dlist *l ) {
	return l->counter;
}



/**
 * Returns the first node where the string matches str (use dnode_cmp)
 */
struct dnode* dlist_find( struct dlist* l, char * str ) {
	struct dnode *curr = l->front;
	while ( curr != NULL ) {
		if ( dnode_cmp( curr, str ) == 0 ) {
			return curr;
		} else {
			curr = curr->next;
		}
	}
	return NULL;
}

/**
 * Inserts a new node with <str> before the node n
 */
struct dnode* dlist_insert_before(struct dlist* l, struct dnode* n, char * str) {
	struct dnode* new_dnode = dnode_create( str );
	if ( n->prev == NULL ) {
		l->front = new_dnode;
	} else {
		n->prev->next = new_dnode;
	}
	new_dnode->prev = n->prev;
	new_dnode->next = n;
	n->prev = new_dnode;
	l->counter++;
	return new_dnode;
}

/**
 * Inserts a new node with <str> after the node n
 */
struct dnode* dlist_insert_after(struct dlist* l, struct dnode *n, char *str) {
	struct dnode* new_dnode = dnode_create( str );
	if ( n->next == NULL ) {
		l->back = new_dnode;
	} else {
		n->next->prev = new_dnode;
	}
	new_dnode->next = n->next;
	new_dnode->prev = n;
	n->next = new_dnode;
	l->counter++;
	return new_dnode;
}

/**
 * Removes a node from the list (but does not destroy the node)
 */
struct dnode* dlist_remove( struct dlist* l, struct dnode* n ) {
	if ( n->prev == NULL && n->next == NULL ) {
		l->front = NULL;
		l->back = NULL;
	} else if ( n->prev == NULL ) {
		l->front = n->next;
		n->next->prev = NULL;
	} else if ( n->next == NULL ) {
		l->back = n->prev;
		n->prev->next = NULL;
	} else {
		n->prev->next = n->next;
		n->next->prev = n->prev;
	}
	n->prev = NULL;
	n->next = NULL;
	l->counter--;
	return n;
}