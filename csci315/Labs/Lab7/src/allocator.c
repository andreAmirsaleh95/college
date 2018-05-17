/* Author: Andre Amirsaleh
 * Course: CSCI 315L (1:00PM section)
 * Assignment: Lab7
 * Prof: Felipe
 */

#include <stdlib.h>
#include <stdio.h>
#include "allocator.h"
#include "dnode.h"
#include "dlist.h"

#define BEST_FIT 0
#define FIRST_FIT 1
#define WORST_FIT 2

/**
 * Initializes globals
 *
 * @param size - Number of bytes to allocate / deallocate
 * @param policy - Allocation policy -- best-fit (0), first-fit (1), or worst-fit (2)
 */
int allocator_init( size_t size, int policy ) {
	// CATCH INVALID POLICY:
	if ( ! ( policy == BEST_FIT || policy == FIRST_FIT || policy == WORST_FIT ) ) {
		printf( "ERROR: Invalid allocation policy.\n" );
		return -1;
	}
	POLICY = policy;

	// INITIALIZE free_list:
	free_list = dlist_create();
	if ( NULL == free_list ) { // catches calloc error
		printf( "ERROR: Inital call to malloc failed (AKA malloc returned -1).\n" );
		return -1;
	}
	dlist_iter_begin( free_list );

	// INITIALIZE allocated_list:
	allocated_list = dlist_create();
	if ( NULL == allocated_list ) { // catches calloc error
		printf( "ERROR: Inital call to malloc failed (AKA malloc returned -1).\n" );
		return -1;
	}
	dlist_add_front( free_list, size, 0 );
	
	return 0;
}

/**
 * Allocates a chunk of RAM
 *
 *  
 */
void *allocate( size_t size ) {
	// CALL APPROPRIATE (PRIVATE) METHOD TO CHANGE free_list:
	struct dnode * free_node; // the node in free_list from which to take mem space
	if ( POLICY == BEST_FIT ) { // BEST-FIT
		free_node = _allocate_bf( size );
	} else if ( POLICY == FIRST_FIT ) { // FIRST-FIT
		free_node = _allocate_ff( size );
	} else if ( POLICY == WORST_FIT ) { // WORST-FIT
		free_node = _allocate_wf( size );
	} else {
		printf( "ERROR: Invalid POLICY variable\n" );
		return NULL;
	}

	// CHANGE free_list AND allocated_list:
	if ( free_node->size < size ) {
		printf( "ERROR: No space in this node\n" );
		return NULL;
	} else {
		dlist_add_back( allocated_list, size, free_node->location );
		free_node->size -= size;
		free_node->location += size;
		
	}

	return allocated_list->back;
}

/**
 * Allocates via best-fit
 *
 */
void *_allocate_bf( size_t size ) {

	struct dnode *curr_free_node = dlist_iter_begin( free_list );
	struct dnode *best_free_node = curr_free_node;

	// FIND BEST NODE:
	while ( dlist_iter_has_next( free_list ) ) {
		if ( curr_free_node->size >= size && curr_free_node->size < best_free_node->size ) {
			best_free_node = curr_free_node;
		}
		curr_free_node = dlist_iter_next( free_list );
	}

	// RETURN FREE NODE:
	if ( best_free_node->size > size ) {
		return best_free_node;
	}

	return NULL;
}

/**
 * Allocates via first-fit
 *
 */
void *_allocate_ff( size_t size ) {
	struct dnode *curr_free_node = dlist_iter_begin( free_list );
	int first_iteration = 1;

	// FIND FIRST NODE:
	while ( dlist_iter_has_next( free_list ) || 1 == first_iteration ) {
		first_iteration = 0;

		// RETURN FREE NODE:
		if ( curr_free_node->size >= size ) {
			return curr_free_node;
		} else {
			curr_free_node = dlist_iter_next( free_list );
		}
	}

	return NULL;
}

/**
 * Allocates via worst-fit
 *
 */
void *_allocate_wf( size_t size ) {

	struct dnode *curr_free_node = dlist_iter_begin( free_list ); 
	struct dnode *largest_free_node = curr_free_node;

	// FIND WORST NODE:
	while ( dlist_iter_has_next( free_list ) ) {
		if ( curr_free_node->size > largest_free_node->size ) {
			largest_free_node = curr_free_node;
		}
		curr_free_node = dlist_iter_next( free_list );
	}

	// RETURN FREE NODE:
	if ( largest_free_node->size - size >= 0 ) {
		return largest_free_node;
	}
	return NULL;
}

/**
 * Deallocates (AKA frees) a chunk of RAM
 * 
 */
int deallocate( int location ) {

	struct dnode *curr_free_node = dlist_iter_begin( free_list ); 

	while ( dlist_iter_has_next( free_list ) ) {
		if ( curr_free_node->location == location ) {

			return 0;
		}
	}

	return -1;
}

void print_free_list() {
	struct dnode *curr_node = dlist_iter_begin( free_list );
	int i = 0;
	while ( curr_node != NULL ) {
		printf( "node #%d : size = %d, location = %d\n", i, curr_node->size, curr_node->location );
		i++;
		curr_node = curr_node->next;
	}
}

void print_allocated_list() {
	struct dnode *curr_node = dlist_iter_begin( allocated_list );
	int i = 0;
	while ( curr_node != NULL ) {
		printf( "node #%d : size = %d, location = %d\n", i, curr_node->size, curr_node->location );
		i++;
		curr_node = curr_node->next;
	}
}
