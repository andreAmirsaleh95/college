#ifndef _ALLOCATOR_H_
#define _ALLOCATOR_H_

// GLOBALS:
int POLICY; // best-fit (0), first-fit (1), or worst-fit (2)
void *initial_mem; // Initial chunk of memory
struct dlist *free_list; // Keeps track of FREE memory
struct dlist *allocated_list; // Keeps track of ALLOCATED memory

// METHODS:
// int allocator_init( size_t size, int policy );
// void *allocate( size_t size );
// int deallocate( void *ptr );

/**
 * Initializes globals
 *
 * @param size - Number of bytes to allocate / deallocate
 * @param policy - Allocation policy -- best-fit (0), first-fit (1), or worst-fit (2)
 */
int allocator_init( size_t size, int policy );

/**
 * Allocates (AKA mallocs) a chunk of RAM
 *
 *  
 */
void *allocate( size_t size );

/**
 * Allocates via best-fit
 *
 */
void *_allocate_bf( size_t size );

/**
 * Allocates via first-fit
 *
 */
void *_allocate_ff( size_t size );

/**
 * Allocates via worst-fit
 *
 */
void *_allocate_wf( size_t size );

/**
 * Deallocates (AKA frees) a chunk of RAM
 *
 * @param ptr - 
 */
int deallocate( int location );

void print_free_list();

void print_allocated_list();

#endif