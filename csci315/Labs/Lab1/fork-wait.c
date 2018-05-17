#include <sys/types.h> // need this for fork
#include <unistd.h> // need this for printf and fflush
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>

int main( int argc, char *argv[] ) {
	int pid; int num;
	if ( ( pid = fork() ) == -1 ) {
		perror( "something went wrong in fork" );
		exit( -1 );
	} else if ( pid == 0 ) {
		// CHILD CODE:
		printf( "child: pid = %d\n", pid );
		printf( "child: getpid() = %d\n", getpid() );
		printf( "child: getppid() = %d\n", getppid() );
		for ( num=0; num < 20; num++ ) {
			printf( "child: %d\n", num ); fflush( stdout );
			sleep( 1 );
		}
	} else {
		// PARENT CODE:
		int status;
		waitpid( pid, &status, 0 );
		//wait( NULL ); // "automatically passes in child process" - TA
		printf( "parent: pid = %d\n", pid );
		printf( "parent: getpid() = %d\n", getpid() );
		printf( "parent: getppid() = %d\n", getppid() );
		for ( num=0; num < 20; num+=3 ) {
			printf( "parent: %d\n", num ); fflush( stdout );
			sleep( 1 );
		}
	}
}