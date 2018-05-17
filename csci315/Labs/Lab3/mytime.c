#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <sys/time.h>

int main(int argc, char *argv[]){
	struct timeval time;
	if (0 != gettimeofday(&time, NULL)) {
		perror("Call to gettimeofday failed");
		exit(-1);
	}
	const time_t t = time.tv_sec;
	printf("%s\n", ctime(&t));
	return 0;
}