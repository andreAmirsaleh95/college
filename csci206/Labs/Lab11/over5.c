#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main( int argc, char** argv ) {

	char acctNumberStr[10];
	char acctNumberStrCpy[2];

	printf( "Enter your account number: " );
	scanf( "%9s", acctNumberStr );
	printf( "Original account number: %s\n", acctNumberStr );

	strcpy( acctNumberStrCpy, acctNumberStr );
	printf( "Account number copy: %s\n", acctNumberStrCpy );
}