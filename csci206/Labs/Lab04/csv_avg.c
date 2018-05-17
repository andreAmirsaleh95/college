/* Andre Amirsaleh
 * Partner: Nazmul Hossain
 * date/time of your lab section
 * lab 04 - csv_avg.c
 * compile with: gcc
 * notes: none
 */
 
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>
#include "fileio.h"
 
// The CSV data is stored as a 2-D array of floats
float data[MAXROWS][MAXCOLS];
 
// The column names are stored in a 2-D array of chars 
// (aka a 1-D array of MAXLEN strings)
char names[MAXCOLS][MAXLEN];
 
float average(int numrows, int col, float data[MAXROWS][MAXCOLS]) {
	float sum = 0.0;
	int row;
	
	for (row = 0; row < numrows; row++) {
		sum += data[row][col];
	}
	
    return sum / numrows;
}
 
int main(int argc, char* argv[])
{
    if (argc < 2){
        // missing required argument
        printf("Usage %s <filename>\n", 
                argv[0]);
        exit(-1);
    }
 
    int cols = 0;
    int rows = 0;
 
    // open the file to use the standard IO library.
    FILE *fd = fopen(argv[1], "r");
 
    // read the column names
    if ( (cols = read_csv_row(fd, names)) < 0){
        printf("Failed to read names from CSV file.\n");    
        exit(-2);
    }else{
#ifdef DEBUG
        // #define DEBUG to see debug output 
        // or compile with gcc -DDEBUG
        int i;        
        for (i=0; i<MAXCOLS; i++){
            printf("Col[%03d]: %s\n", i, names[i]);
        }
#endif        
    }
    
    // the remaining lines are the rows, read them 
    // into the data array.
    if ( (rows = read_csv_cols(fd, data)) <= 0){
        printf("Error: could not read file!\n");
        exit(-3);
    }
    fclose(fd);
 
    // compute the average for each column.
    int i;
    for (i=0; i<cols; i++){
        printf("Average for column %50s is %12.6f\n", 
                names[i],
                average(rows, i, data));
    }
    return 0;
}
