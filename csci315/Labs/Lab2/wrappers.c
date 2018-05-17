#include <unistd.h>
#include "wrappers.h"
#include <stdlib.h>
#include <stdio.h>

int Pipe( int pipefd[2] ) {
	int p = pipe( pipefd );
	if ( -1 == p ) {
		perror( "Call to pipe() failed (retirned -1)." );
		exit(-1);
	} else {
		return p;
	}
}

int Fork() {
	int f = fork();
	if ( -1 == f ) {
		perror( "Call to fork() failed (returned -1)." );
		exit( -1 );
	} else {
		return f;
	}
}

int Read( int fd, void *buf, size_t count ) {
	int r = read( fd, buf, count );
	if ( -1 == r ) {
		perror( "Call to read() failed (returned -1)." );
		exit( -1 );
	} else {
		return r;
	}
}

int Write( int fd, const void *buf, size_t count ) {
	int w = write( fd, buf, count );
	if ( -1 == w ) {
		perror( "Call to write() failed (returned -1)." );
		exit( -1 );
	} else {
		return w;
	}
}