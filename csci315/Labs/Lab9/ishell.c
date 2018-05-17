/* Author: Andre Amirsaleh
 * Assignment: Lab 9
 * Course: CSCI 315L (1:00PM section)
 * Professor: Luiz Felipe Perrone
 */

/* DESIGN NOTES
 *
 * The "copy" command works like it does in bash, but
 * you can't type in the full path as the destination
 * directory (you have to use "dots" and what not to
 * navigate out of the working directory) because execlp
 * execlp() sucks.
 *
 * You can execute bash functions (via execlp) as long
 * as it takes 1-3 tokens (AKA words / filenames). You
 * can calso execute two bash functions in one line
 * as long as the first function takes exactly 3 tokens.
 *
 * Extra Features: ishell works on function calls of
 * varying input tokens (i.e. ls -lsa as well as cp ishell.c ../..)
 *
 * ONE COMMAND: [command] [option1] [option2]
 * TWO COMMANDS: [command1] [required1] [required2]; [command2] [option1] [option2]
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>

#define MAX 256
#define MAX_TOKENS 6

pid_t Fork( void ) {
	pid_t return_val = fork();
	if ( 0 > return_val ) {
		perror( "Call to fork() failed." );
		exit( -1 );
	} else {
		return return_val;
	}
}

int main( int argc, char *argv[] ) {

	char input[MAX];
	int status;
	const char delim[2] = " ";
	char *token;
	char tokens[6][MAX];
	int token_num;
	bool continue_running = true;
	int pid;

	while ( continue_running ) {

		// GET INPUT LINE:
		printf( "ishell>" );
		fgets( input, sizeof( input ), stdin );

		// TOKENIZE INPUT:
		//printf( "Attempting to tokenize...\n" );
		token_num = 0;
		strtok( input, "\n" );
		token = strtok( input, delim );
		while( token != NULL ) {
			
			strncpy( tokens[token_num], token, strlen( token ) + 1 );
			// printf( "tokens[%d] = %s\n", token_num, tokens[token_num] );

			// PRINT WHICH TOKENS ARE NULL TERMINATED:
			// if ( tokens[token_num][strlen(tokens[token_num])] == '\0' ) {
			// 	printf("token_num = %d is NULL TERMINATED!!!!!\n", token_num);
			// }

			// GET NEXT TOKEN:
			token_num++;
			token = strtok( NULL, delim );
		}

		// EXECUTE ONE COMMAND:
		if ( 1 == token_num ) {
			// FORK:
			pid = Fork();
			if ( pid > 0 ) {  // parent
				wait( &status );
				if ( 0 == status ) {
					printf( "ishell: program terminated successfully\n" );
				} else {
					printf( "ishell: program terminated abnormally (status = %d)\n", status );
				}
			} else {
				execlp( tokens[0], tokens[0], (char *) NULL );
			}
		} else if ( 2 == token_num ) {
			// FORK:
			pid = Fork();
			if ( pid > 0 ) {  // parent
				wait( &status );
				if ( 0 == status ) {
					printf( "ishell: program terminated successfully\n" );
				} else {
					printf( "ishell: program terminated abnormally (status = %d)\n", status );
				}
			} else {
				execlp( tokens[0], tokens[0], tokens[1], (char *) NULL );
			}
		} else if ( 3 == token_num ) {
			// FORK:
			pid = Fork();
			if ( pid > 0 ) {  // parent
				wait( &status );
				if ( 0 == status ) {
					printf( "ishell: program terminated successfully\n" );
				} else {
					printf( "ishell: program terminated abnormally (status = %d)\n", status );
				}
			} else {
				execlp( tokens[0], tokens[0], tokens[1], tokens[2], (char *) NULL );
			}

		// EXECUTE TWO COMMANDS:
		} else if ( 3 < token_num ) {
			if ( tokens[2][strlen(tokens[2])-1] == ';' ) {
				strtok( tokens[2], ";" );
			} else {
				perror( "Need semicolon after third token" );
				continue;
			}

			// EXECUTE FIRST COMMAND:
			pid = Fork();
			if ( pid > 0 ) {  // parent
				wait( &status );
				if ( 0 == status ) {
					printf( "ishell: program terminated successfully\n" );
				} else {
					printf( "ishell: program terminated abnormally (status = %d)\n", status );
				}
			} else {
				execlp( tokens[0], tokens[0], tokens[1], tokens[2], (char *) NULL );
			}

			// EXECUTE SECOND COMMAND:
			if ( 4 == token_num ) {
				// FORK:
				pid = Fork();
				if ( pid > 0 ) {  // parent
					wait( &status );
					if ( 0 == status ) {
						printf( "ishell: program terminated successfully\n" );
					} else {
						printf( "ishell: program terminated abnormally (status = %d)\n", status );
					}
				} else {
					execlp( tokens[3], tokens[3], (char *) NULL );
				}
			} else if ( 5 == token_num ) {
				// FORK:
				pid = Fork();
				if ( pid > 0 ) {  // parent
					wait( &status );
					if ( 0 == status ) {
						printf( "ishell: program terminated successfully\n" );
					} else {
						printf( "ishell: program terminated abnormally (status = %d)\n", status );
					}
				} else {
					execlp( tokens[3], tokens[3], tokens[4], (char *) NULL );
				}
			} else if ( 6 == token_num ) {
				// FORK:
				pid = Fork();
				if ( pid > 0 ) {  // parent
					wait( &status );
					if ( 0 == status ) {
						printf( "ishell: program terminated successfully\n" );
					} else {
						printf( "ishell: program terminated abnormally (status = %d)\n", status );
					}
				} else {
					execlp( tokens[3], tokens[3], tokens[4], tokens[5], (char *) NULL );
				}
			} else if ( 6 < token_num ) {
				perror( "Too many tokens! (max = 6)" );
			}
		}
	}
}