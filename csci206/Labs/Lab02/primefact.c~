/* Andre Amirsaleh
 * Tuesday/12:00 (1/26/16)
 * lab 02 - primefact.c
 * compile with: gcc
 * notes:
real	0m0.068s
user	0m0.066s
sys	0m0.000s

 */

#include <stdio.h>
 
int main(void) {
	int n = 2147483645;
	int i = 2;
 
	while ( i <= n ) {
		if ( n % i == 0 ) {
			printf( "%d\n", i );
			n /= i;
			i -= 1;
		}
		i += 1;
	}

	return 0;
}
