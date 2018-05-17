#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <pthread.h>
#include <unistd.h>
#include <errno.h>

#define NUM_THREADS 3

void waste_time() {
	int result = 0;
	int i;
	for (i = 0; i <= 10000; i++) {
		result += i;
	}
}

void thread1() {
	int i;
	int x;
	for (i = 0; 1; i++) {
		x = i % 10;
		printf("%d\n", x);
	}
	waste_time();
}

void thread2() {
	int i;
	char c;
	for (i = 49; 1; i++) {
		if (i == 75) {
			i = 49;
		}
		c = i + '0';
		printf("%c\n", c);
	}
	waste_time();
}

void thread3() {
	while (1) {
		printf("#\n");
	}
	waste_time();
}

int main(int argc, char *argv[]) {
	pthread_t threads[NUM_THREADS];
	int rc;
	rc = pthread_create(&threads[0], NULL, thread1, NULL);
	if (rc) {
		perror("Call to pthread_create() failed\n");
		exit(-1);
	}
	rc = pthread_create(&threads[1], NULL, thread2, NULL);
	if (rc) {
		perror("Call to pthread_create() failed\n");
		exit(-1);
	}
	rc = pthread_create(&threads[2], NULL, thread3, NULL);
	if (rc) {
		perror("Call to pthread_create() failed\n");
		exit(-1);
	}
	thread3();
}