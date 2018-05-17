#include <stdio.h>
#include <time.h>

struct tm;

int add_second(struct tm*);

int main(void) {
	time_t t = time(NULL);
	struct tm *tm = localtime(&t);

	printf ("it is now: %s\n", asctime(tm));

	int i;
	for (i = 0; i < 2345; i++) {
		add_second(tm);
	}
	printf ("it is now: %s\n", asctime(tm));
	
	return 0;
}