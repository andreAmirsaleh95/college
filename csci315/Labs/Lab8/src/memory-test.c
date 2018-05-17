#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "allocator.h"
#include "dlist.h"

int main( int argc, char *argv[] ) {

	// CHOOSE POLICY:
    int policy;
    for ( policy = 0; policy < 3; policy++ ) {
    	switch ( policy ) {
    		case 0: printf( "BEST FIT...\n" ); break;
    		case 1: printf( "\n\n\nFIRST FIT...\n" ); break;
    		case 2: printf( "\n\n\nWORST FIT...\n" ); break;
    	}

    	// INITIALIZE ALLOCATOR:
    	allocator_init( 256, policy );
    	printf( "Initialized allocator.\n" );


    	// ALLOCATE SOME BYTES:
    	allocate( 8 );
    	printf( "Allocated some bytes.\n" );

    	// PRINT LISTS:
    	printf( "Printing free list...\n" );
    	print_free_list();
    	printf( "\nPrinting allocated list...\n" );
    	print_allocated_list();

    	// DEALLOCATE SOME BYTES:
    	deallocate( 0 );
    	printf( "Deallocated some bytes.\n" );
    }
}
