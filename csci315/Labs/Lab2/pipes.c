#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <string.h>
#include "wrappers.h"
#define BUFFER_SIZE 25
#define READ_END 0
#define WRITE_END 1

int main( void ) {
	char write_msg[BUFFER_SIZE] = "Greetings";
	char read_msg[BUFFER_SIZE];
	int fd[2];
	pid_t pid;

	/* create the pipe */
	Pipe( fd );

	/* fork a child process */
	pid = Fork();

	if ( pid > 0 ) { /* parent process */
		/* close the unused end of the pipe */
		close( fd[READ_END] );
		/* write to the pipe */
		// Write( fd[WRITE_END], write_msg, strlen( write_msg ) + 1 );
		int i;
		for ( i = 0; i <= strlen( write_msg ); i++ ) {
			Write( fd[WRITE_END], &write_msg[i], 1 );
		}
		/* close the write end of the pipe */
		close( fd[WRITE_END] );
	} else { /* child process */
		/* close the unused end of the pipe */
		close( fd[WRITE_END] );
		/* read from the pipe */
		// Read( fd[READ_END], read_msg, BUFFER_SIZE );
		int j;
		for ( j = 0; j < BUFFER_SIZE; j++ ) {
			if ( 0 == Read( fd[READ_END], &read_msg[j], 1 ) ) {
				break;
			}
		}
		printf( "read %s\n", read_msg );
		/* close the write end of the pipe */
		close( fd[READ_END] );
	}
	return 0;
}