#include <stdio.h>
 
#define MAX 10
 
/*
real	0m29.221s
user	0m19.001s
sys	0m0.156s
*/

int is_prime(int n);
 
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

    return 0;
}
