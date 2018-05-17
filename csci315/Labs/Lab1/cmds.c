#include <stdio.h>
#include <stdlib.h>

int main( int argc, char *argv[] ) {
	if ( argc != 5 ) {
		printf( "ERROR: Please enter exactly 4 arguments" );
		return 1; // ERROR!
	}

	char charParam = *argv[1];
	int intParam = atoi( argv[2] );
	float floatParam = atof( argv[3] );
	char *stringParam = argv[4];

	printf( "\ncharacter: %c\n", charParam );
	printf( "int: %d\n", intParam );
	printf( "float: %f\n", floatParam );
	printf( "string: %s\n", stringParam );

	return 0;
}