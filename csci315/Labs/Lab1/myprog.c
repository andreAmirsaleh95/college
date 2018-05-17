#include <stdio.h>
#include <stdlib.h>

int main( int argc, char *argv[] ) {
	pid_t child1 = fork();
	int i;
	if ( child1 == 0 ) {
		for ( i = 0; 1 == 1; i++ ) {
			printf("child1: %d\n", i);
		}
		return 0;
	}
	pid_t child2 = fork();
	if ( child2 == 0 ) {
		for ( i = 0; 1 == 1; i++ ) {
			printf( "child2: %d\n", i );
		}
		return 0;
	}
	for ( i = 0; 1 == 1; i++ ) {
		printf("parent: %d\n", i);
	}
	return 0;
}