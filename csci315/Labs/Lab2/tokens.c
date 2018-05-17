#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include "wrappers.h"
#define BUFFER_SIZE 80
#define READ_END 0
#define WRITE_END 1

int main( void ) {
	char write_msg[BUFFER_SIZE];
	char read_msg[BUFFER_SIZE];
	char read_msg2[BUFFER_SIZE];
	char accumulator[BUFFER_SIZE] = "";
	int fd1[2];
	int fd2[2];
	char *token;
	int buff;

	pid_t pid;

	/* create the pipe */
	Pipe( fd1 );
	Pipe( fd2 );

	/* fork a child process */
	pid = Fork();

	if ( pid > 0 ) { /* parent process */
		close( fd1[READ_END] );
		close( fd2[WRITE_END] );

		// user input:
		printf( "Enter a string with a bunch of spaces between words: " );
		fgets( write_msg, BUFFER_SIZE, stdin );

		// send stuff to child:
		buff = strlen( write_msg ) + 1;
		Write( fd1[WRITE_END], &buff, sizeof( int ) );
		Write( fd1[WRITE_END], write_msg, BUFFER_SIZE );

		// read from child:
		Read( fd2[READ_END], &buff, sizeof( int ) );
		Read( fd2[READ_END], read_msg2, buff );
		printf( "Parent received: %s\n", read_msg2 );
		close( fd1[WRITE_END] );
		close( fd2[READ_END] );
	} else { /* child process */
		/* close the unused end of the pipe */
		close( fd1[WRITE_END] );
		close( fd2[READ_END] );

		/* read from the pipe */
		Read( fd1[READ_END], &buff, sizeof( int ) );
		Read( fd1[READ_END], read_msg, buff );
		token = strtok( read_msg, " " );
		while ( token != NULL ) {
			strcat( accumulator, token );
			strcat( accumulator, " " );
			token = strtok( NULL, " " );
		}
		buff = strlen( accumulator );
		Write( fd2[WRITE_END], &buff, sizeof( int ) );
		Write( fd2[WRITE_END], accumulator, buff );
		close( fd1[READ_END] );
		close( fd2[WRITE_END] );
		exit( 0 );
	}
	main();
	return 0;
}