#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main( int argc, char *argv[] ) {
	if ( argc != 2 ) {
		printf( "ERROR: Please enter exactly 1 argument\n" );
		return 1;
	}

	char *stringParam = argv[1];
	int currCharIndex = strlen( stringParam ) - 1;
	char currChar = stringParam[currCharIndex];
	while ( currCharIndex > -1 ) {
		printf( "%c", currChar );
		currCharIndex -= 1;
		currChar = stringParam[currCharIndex];
	}
	
	printf( "\n" );
	return 0;
}