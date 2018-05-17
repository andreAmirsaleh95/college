#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <time.h>

#define NUM_PHILS 5
#define SCALE_FACTOR 1000

pthread_mutex_t chopsticks[NUM_PHILS];

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
	double r = SCALE_FACTOR * ((double) rand_r(&seed) / RAND_MAX);
	usleep(r * t); // sleep for random period of time;
	return 0;
}

void * Philosopher(void * id) {
	int int_id = (long long) id;
	int left_chop_index = int_id;
	int right_chop_index = (int_id + 1) % NUM_PHILS;
	pthread_mutex_t *left_chop = &chopsticks[left_chop_index];
	pthread_mutex_t *right_chop = &chopsticks[right_chop_index];
	while (1) {
		printf("Philosopher %d is thinking.\n", int_id); fflush(stdout);
		napping(2);
		printf("philosopher %d is hungry.\n", int_id); fflush(stdout);
		// GRAB ADJACENT CHOPSTICKS:
		pthread_mutex_lock(left_chop);
		printf("Philosopher %d picking up (left) chopstick %d\n", int_id, left_chop_index); fflush(stdout);
		napping(2); // CAUSES DEADLOCK
		pthread_mutex_lock(right_chop);
		printf("Philosopher %d picking up (right) chopstick %d\n", int_id, right_chop_index); fflush(stdout);

		printf("Philosopher %d is starting to eat.\n", int_id); fflush(stdout);
		napping(1);
		printf("Philosopher %d is done eating.\n", int_id); fflush(stdout);
		// PUT CHOPSTICKS DOWN:
		pthread_mutex_unlock(left_chop);
		printf("Philosopher %d putting down (left) chopstick %d\n", int_id, left_chop_index); fflush(stdout);
		pthread_mutex_unlock(right_chop);
		printf("Philosopher %d putting down (right) chopstick %d\n", int_id, right_chop_index); fflush(stdout);
	}
}

int main(int argc, char *argv[]) {
	int phil_num;

	// INITIALIZE MUTEXES (AKA chopsticks):
	for (phil_num = 0; phil_num < NUM_PHILS; phil_num++) {
		pthread_mutex_init(&chopsticks[phil_num], NULL); // Felipe said no need to catch return vals (at least for now)
		pthread_mutex_unlock(&chopsticks[phil_num]);
	}

	// CREATE PHILOSOPHER THREADS:
	pthread_t phil_threads[NUM_PHILS];
	for (phil_num = 0; phil_num < NUM_PHILS; phil_num++) {
		pthread_create(&phil_threads[phil_num], NULL, Philosopher, (void *) phil_num);
	}

	sleep(10);
	while(1) {} // "this works too, but a more elegant solution would be to JOIN the Philosopher threads" -Felipe
	// Note: He later said to just go ahead and use the while loop instead of joining the threads.
	return 0;
}