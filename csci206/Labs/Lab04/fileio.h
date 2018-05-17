#ifndef __fileio_h_
#define MAXROWS 1024
#define MAXCOLS 32
#define MAXLEN 64
#define __fileio_h_
 
int read_file_bytes (char* filename, int bytes, char* buffer);
int read_csv_row    (FILE* fd, char row_strings[MAXCOLS][MAXLEN]);
int read_csv_cols   (FILE* fd, float data[MAXROWS][MAXCOLS]);
 
#endif
