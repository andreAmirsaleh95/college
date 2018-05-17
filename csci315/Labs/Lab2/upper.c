#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include "wrappers.h"
#define BUFFER_SIZE 25
#define READ_END 0
#define WRITE_END 1

int main( void ) {
	char write_msg[BUFFER_SIZE] = "Greetings";
	char write_msg2[BUFFER_SIZE];
	char read_msg[BUFFER_SIZE];
	char read_msg2[BUFFER_SIZE];
	char c;
	int r;
	int fd1[2];
	int fd2[2];
	int pToC;
	int cToP;
	pid_t pid;

	/* create the pipe */
	pToC = Pipe( fd1 );
	cToP = Pipe( fd2 );

	/* fork a child process */
	pid = Fork();

	if ( pid > 0 ) { /* parent process */
		/* close the unused end of the pipe */
		close( fd1[READ_END] );
		close( fd2[WRITE_END] );

		/* write to the pipe */
		// Write( fd1[WRITE_END], write_msg, strlen( write_msg ) + 1 );
		int i;
		for ( i = 0; i <= strlen( write_msg ); i++ ) {
			Write( fd1[WRITE_END], &write_msg[i], 1 );
		}
		close( fd1[WRITE_END] );

		/* read from the second pipe */
		int k;
		for ( k = 0; k < BUFFER_SIZE; k++ ) {
			r = Read( fd2[READ_END], &read_msg2[k], 1 );
			if ( r > 0 ) {
				printf( "Parent recieved: %c\n", read_msg2[k] );
			}
			else {
				break;
			}
		}
		close( fd2[READ_END] );
	} else { /* child process */
		/* close the unused end of the pipe */
		close( fd1[WRITE_END] );
		close( fd2[READ_END] );

		/* read from the pipe */
		// Read( fd1[READ_END], read_msg, BUFFER_SIZE );
		int j;
		for ( j = 0; j < BUFFER_SIZE; j++ ) {
			r = Read( fd1[READ_END], &read_msg[j], 1 );
			printf( "child recieved: %c\n", read_msg[j] );
			c = toupper( read_msg[j] );
			Write( fd2[WRITE_END], &c, 1 );
			if ( 0 == r ) {
				break;
			}
		}
		close( fd1[READ_END] );
		close( fd2[WRITE_END] );
	}
	return 0;
}