/*
 * CSCI 315 Operating Systems Design
 * Date: 2014-09-02
 * Copyright (c) 2014 Bucknell University
 *
 * Permission is hereby granted, free of charge, to any individual or
 * institution obtaining a copy of this software and associated
 * documentation files (the "Software"), to use, copy, modify, and
 * distribute without restriction, provided that this copyright and
 * permission notice is maintained, intact, in all copies and supporting
 * documentation.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL BUCKNELL UNIVERSITY BE LIABLE FOR ANY CLAIM, DAMAGES
 * OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
 * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>

int i = 7;
double x = 3.14;

int main(int argc, char* argv[]) {

	int pid;
	int j = 6;
	double y = 2.18;

	char buf_parent[6];
	char buf_child[6]; 
	int status; // exit status to be filled by wait

	// create and open a file called data.txt
	// use open (file descriptors)
	FILE *fp;
	fp = fopen("data.txt", "w+");

	// write into data.txt the following string:
	// "this is a test for processes created with fork\nthis is another line"
	fprintf( fp, "this is a test for processes created with fork\nthis is another line" );
	fclose(fp);
	fopen("data.txt", "r");

	if ((pid = Fork()) == 0) {
		// child process
		
		// read 5 characters from file into buf_child
		//fgets( buf_child, 5, fp );

		// print the characters in buf_child to terminal
		//printf( "buf_child: %s\n", buf_child );

		printf("pid= %d -- initially, child sees x= %lf, y=%lf\n", pid, x, y);
		x = 0;
		y = 0;
		printf("pid= %d -- child sees x= %lf, y=%lf\n", pid, x, y);
		printf("child is terminating\n");

		// close the file
		fclose(fp);
		exit(0);

	} else {

		// parent process

		// read 5 characters from file into buf_parent
		fgets( buf_parent, 5, fp );
		
		// print the characters in buf_child to terminal
		printf( "first buf_parent: %s\n", buf_parent );

		printf("pid= %d -- parent waits for child to terminate\n", pid);
		printf("pid= %d -- before wait parent sees x= %lf, y=%lf\n", pid, x, y);

		wait(&status); // note we are not catching the return value of wait!
		printf("parent got termination status= %d from child\n", status);
		printf("pid= %d -- after wait sees x= %lf, y=%lf\n", pid, x, y);

		// read another 5 characters from file into buf_parent
		fgets( buf_parent, 5, fp );

		// print the characters in buf_parent to terminal
		printf( "second buf_parent: %s\n", buf_parent );

		// close the file
		printf("parent is terminating\n");
		fclose(fp);
		exit(0);
	}
}

pid_t Fork(void) {
	pid_t pid = fork();
	if ( -1 == pid ) {
		perror( "ERROR: call to fork() failed" );
		exit(-1);
	}
	return pid;
}