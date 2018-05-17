/*
 * Copyright (c) 2012 Bucknell University
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation;
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * Author: L. Felipe Perrone (perrone@bucknell.edu)
 */

#include "dlist.h"

struct dlist *
dlist_create() {
	struct dlist *calloc_result = calloc( 1, sizeof( struct dlist ) );
	if ( NULL == calloc_result ) {
		return NULL;
	}
	calloc_result->front = calloc_result->back = NULL;
	return calloc_result;
}

void 
dlist_destroy( struct dlist *l ) {
	struct dnode *p = l->front;

	do {
		l->front = l->front->next;
		free(p);
		p = l->front;
	} while (l->front != NULL);

	l->front = l->back = NULL;
	l->counter = 0;
}


void 
dlist_obliterate(struct dlist *l) {
	dlist_destroy(l);
	free(l);
}

void 
dlist_add_front(struct dlist *l, size_t s, int location ) {
	struct dnode *n = dnode_create();
	n->size = s;

	if (0 == l->counter) {
		l->front = l->back = n;	
		l->counter = 1;
	} else {
		n->next = l->front;
		l->front->prev = n;
		l->front = n;
		(l->counter)++;
	}

#ifdef DEBUG
	printf("counter= %d\n", l->counter );
	printf("front= %d\n", l->front->location);
	printf("back= %d\n\n", l->back->location);
#endif /* DEBUG */
}

void 
dlist_add_back(struct dlist *l, size_t s, int location) {
	struct dnode *n = dnode_create();
	n->size = s;
	n->location = location;

	if (0 == l->counter) {
		l->front = l->back = n;	
		l->counter = 1;
	} else {
		n->prev = l->back;
		l->back->next = n;
		l->back = n;
		(l->counter)++;
	}

#ifdef DEBUG
	printf("counter= %d, %s\n", l->counter, (char *) ptr);
	printf("front= %d\n", l->front->location);
	printf("back= %d\n\n", l->back->location);
#endif /* DEBUG */
}

void *
dlist_remove_front(struct dlist *l) {
	struct dnode *n = l->front;

	if (1 == l->counter) {
		l->front = l->back = NULL;
	} else {
		l->front = l->front->next;
		l->front->prev = NULL;
	}

	(l->counter)--;
	return n;
}

void *
dlist_remove_back(struct dlist *l) {
	struct dnode *n = l->back;

	if (1 == l->counter) {
		l->front = l->back = NULL;
	} else {
		l->back = l->back->prev;
		l->back->next = NULL;
	}

	(l->counter)--;
	return n;
}

void *
dlist_find_remove( struct dlist *l, int location ) {
	struct dnode *n = l->front;
	void *ret_ptr = NULL;

	while ( ( n != NULL ) && ( n->location != location ) ) {
		n = n->next;
	}

	if ( n != NULL ) {
		if ( l->front == n ) {
			return dlist_remove_front( l );
		} else if ( l->back == n ) {
			return dlist_remove_back( l );
		} else {
			if ( 1 == l->counter ) {
				l->front = l->back = NULL;
			} else {
				n->prev->next = n->next;
				n->next->prev = n->prev;
			}
		(l->counter)--;
	}
	
	}
	
	return n;
}

uint32_t 
dlist_num_elems(struct dlist *l) {
	return l->counter;
}

void *
dlist_iter_begin(struct dlist *l) {
	if ( NULL == l->front ) {
		return -1;
	} else {
		l->iter = l->front;
	}
	return l->iter;
}

void *
dlist_iter_next(struct dlist *l) {
	void *ret_val = NULL;

	if ( l->iter != NULL ) {
		l->iter = l->iter->next;
		if ( l->iter != NULL ) {
			ret_val = l->iter;
		}
	}

	return ret_val;
}

void *
dlist_iter_next2( struct dlist *l ) {
	void *ret_val = NULL;

	if ( l->iter != NULL ) {
		l->iter = l->iter->next;
		if ( l->iter != NULL ) {
			ret_val = l->iter;
		}
	}

	return ret_val;
}

bool 
dlist_iter_has_next(struct dlist *l) {
	bool ret_val = false;

	if ( l->iter != NULL ) {
		ret_val = ( l->iter->next != NULL );
	}

#ifdef DEBUG
	if ( ret_val ) {
		printf( "dlist_has_next: current is %d\n", (int) l->iter->location );
		printf( "dlist_has_next: returning %d\n\n", ret_val );
	}
#endif /* DEBUG */

	return ret_val;
}


void *
dlist_iter_end( struct dlist *l ) {
	void *ret_val = NULL;

	l->iter = l->back;
	if ( l->iter != NULL ) {
		ret_val = l->iter;
	}

	return ret_val;
}

void *
dlist_iter_prev( struct dlist *l ) {
	void *ret_val = NULL;

	if ( l->iter != NULL ) {
		l->iter = l->iter->prev;
		if ( l->iter != NULL ) {
			ret_val = l->iter;
		}
	}

	return ret_val;
}

bool 
dlist_iter_has_prev( struct dlist *l ) {
	bool ret_val = false;

	if ( l->iter != NULL ) {
		ret_val = ( l->iter->prev != NULL );
	}

	return ret_val;
}

