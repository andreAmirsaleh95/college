/* Andre Amirsaleh
 * Tuesday/12:00 (1/26/16)
 * lab 02 - primefact.c
 * compile with: gcc
 * notes:
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>
 
int main(){

	char string[256];
	int i;

	// this loop will read one line of input at a time
	// if EOF is reached, the loop will exit.
	while ( fgets( string, 256, stdin ) != NULL ) {

		/* convert the string here */
		

		// print the result
		printf("%s", string);
    }
 
    return 0;
}
