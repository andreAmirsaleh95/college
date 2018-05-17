/* Andre Amirsaleh
 * Partner: Nazmul Hossain
 * Tuesday, 2/9/16, 1:00PM
 * lab 04 - head3.c
 * compile with:
 * notes: none
 */
 
 
// for O_RDONLY, etc.
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
#define MAXBYTES 1024

int read_file_lines(char* filename, char buffer[][MAXBYTES+1]) {
	FILE* myFile = fopen(filename, "r");
	int i;
	for (i = 0; i < 10; i++) {
		fgets(buffer[i], MAXBYTES, myFile);
	}
	return 0;
}

int main(int argc, char* argv[])
{
    int readlines = 10;         // default to 10 bytes
    char buffer[readlines][MAXBYTES+1];    // buffer to hold file data
 
    if (argc < 2){
        // missing required argument
        printf("Usage %s <filename> [<bytes>]\n", 
                argv[0]);
        exit(-1);
    }
    if (argc > 2){
        // process optional bytes argument
        readlines = atoi(argv[2]);
        if (readlines > MAXBYTES){            
            printf("bytes is too large, max supported value is %d!\n",
                    MAXBYTES);
            exit(-2);
        }
    }
    if (read_file_lines(argv[1], buffer) >= 0){
		int i;
		for (i = 0; i < readlines; i++) {
        	printf("%s\n", buffer[i]);
		}
    } else {
        printf("Error: could not read file!\n");
        exit(-3);
    }
    return 0;
}
