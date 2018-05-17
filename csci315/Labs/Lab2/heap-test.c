#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main( int argc, char *argv[] ) {
	int pid1;
	int pid2;
	int status1;
	int status2;
	int *ptr1;

	ptr1 = ( int * ) malloc( sizeof( int ) );
	if ( ptr1 == 0 ) {
		printf( "ERROR: Out of memory\n" );
		return 1;
	}

	*ptr1 = 2;
	printf( "Before fork, *ptr1 = %d\n", *ptr1 );
	
	if ( ( pid1 = fork() ) ) {
		// PARENT
		// Should execute third (after child1)
		printf( "PARENT (before wait): *ptr1 = %d\n", *ptr1 );
		wait( &status1 );
		printf( "PARENT (after wait): *ptr1 = %d\n", *ptr1 );
	} else {
		// CHILD1
		// Should execute second
		if ( ( pid2 = fork() ) ) {
			// CHILD1
			printf( "CHILD1 (before wait): *ptr1 = %d\n", *ptr1 );
			wait( &status2 );
			printf( "CHILD1 (after wait): *ptr1 = %d\n", *ptr1 );
		} else {
			// CHILD2
			// Should execute first
			printf( "CHILD2: *ptr1 = %d\n", *ptr1 );
			printf( "child2 is changing the value to *ptr1 += 1...\n" );
			*ptr1 += 1;
			printf( "CHILD2 (updated value): *ptr1 = %d\n", *ptr1 );
		}
	}

	free( ptr1 );
	return 0;
}