#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

int main(int argc, char* argv[]) {
	print_environment();
	const char *path1 = "/bin/cat";
	const char *path2 = "/usr/bin/wc";
	const char *arg = argv[1];
	int pid;
	int status1; // exit status to be filled by wait()
	int status2;
	if ( ( pid = fork() ) ) {
		// PARENT
		if ( wait( &status1 ) == -1 ) { // wait() failed
			perror( "ERROR: First wait failed" );
			exit(-1);
		} else { // wait() did not fail
			if ( ( pid = fork() ) ) {
				// PARENT
				if ( wait( &status2 ) == -1 ) {
					perror( "ERROR: First wait failed" );
					exit(-1);
				} else {
					return 0;
				}
			} else {
				// CHILD2
				execlp( path2, arg );
			}
		}
	} else {
		// CHILD1
		execlp( path1, arg );
	}
}

void print_environment( void ) {
	extern char **environ;
	int i = 0;
	while ( environ[i] != NULL ) {
		printf( "%s\n", environ[i] );
		i++;
	}

}