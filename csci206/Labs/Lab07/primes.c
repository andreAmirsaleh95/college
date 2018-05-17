#include <stdio.h>
 
#define MAX 10020
 
/*
real	0m29.221s
user	0m19.001s
sys	0m0.156s
*/

int is_prime(int n)
{
   // return 1 if n is prime, 0 otherwise
	int i;
	for ( i = 2; i <= n - 1; i++ ) {
		if ( n % i == 0 ) {
			return 0;
		}
	}
	return 1;
}

int main (void)
{
    int i, n = 0;
 
    for (i = 2; n < MAX; i++){
        if (is_prime(i)){
            if ((n % 10) == 0){
                printf("\n");
            }
            printf("%7d", i);
            n++;
        }
    }
    printf("\n");
}
