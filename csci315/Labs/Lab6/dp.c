#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <time.h>

#define NUM_PHILS 5
#define SCALE_FACTOR 1000000

/**
 * Sleep for a random amount of time
 *
 * @param t longest possible time (in seconds) to sleep for
 */
int napping(int t) {
	int unique; // use for unique seed value on every call
	// probably a dumb way of doing it..
	// but it works because threads have independent sections of memory
	unsigned int seed = &unique;
	int r = (int)(SCALE_FACTOR * ((double) rand_r(&seed) / RAND_MAX));
	usleep(r * t); // sleep for random period of time;
}

void * Philosopher(void * id) {
	while (1) {
		int int_id = (long long) id;
		printf("Philosopher %d is thinking.\n", int_id);
		napping(2);
		printf("philosopher %d is hungry.\n", int_id);
		printf("Philosopher %d is starting to eat.\n", int_id);
		napping(1);
		printf("Philosopher %d is done eating.\n", int_id);
	}
}

int main(int argc, char *argv[]) {
	pthread_t phil_threads[NUM_PHILS];
	int phil_num;
	long long param = 0;
	for (phil_num = 0; phil_num < NUM_PHILS; phil_num++) {
		pthread_create(&phil_threads[phil_num], NULL, Philosopher, (void *) param);
		param++;
	}
	while (1) {}
	return 0;
}