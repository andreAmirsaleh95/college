/* Andre Amirsaleh
 * Tuesday/12:00 (2/2/16)
 * lab 03 - c_mystery.c
 * notes: none
 */

 int main( void ) {

	// Code uner .data
	int unused = 3735928559;
	int x = 89;

	// Code under .text
	int t0 = 0 + 0;
	int t1 = 0 + 0;

	while ( t0 <= 10 ) {
		t1 += t0;
		t0 += 1;
	}
	
	x = t1;
}
