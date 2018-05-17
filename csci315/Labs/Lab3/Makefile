CC = gcc
CFLAGS = -std=gnu99 -Wall -g #-DDEBUG

all: char-threads mytime summation summation3 summation4

char-threads: char-threads.o
	$(CC) $(CFLAGS) char-threads.o -o char-threads -pthread

mytime: mytime.c
	$(CC) $(CFLAGS) mytime.c -o mytime

summation: summation.c
	$(CC) $(CFLAGS) summation.c -o summation -lm -pthread

summation3: summation3.c
	$(CC) $(CFLAGS) summation3.c -o summation3 -lm -pthread

summation4: summation4.c
	$(CC) $(CFLAGS) summation4.c -o summation4 -lm -pthread
