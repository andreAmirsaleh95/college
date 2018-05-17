CC = gcc
CFLAGS = -std=gnu99 -Wall -g #-DDEBUG

all: wrappers.o echoreq echod echoreq2

wrappers.o: wrappers.c
	$(CC) $(CFLAGS) wrappers.c -c

echoreq: echoreq.c wrappers.c
	$(CC) $(CFLAGS) echoreq.c wrappers.c -o echoreq

echod: echod.c wrappers.c
	$(CC) $(CFLAGS) echod.c wrappers.c -o echod

echoreq2: echoreq2.c wrappers.c
	$(CC) $(CFLAGS) echoreq2.c wrappers.c -o echoreq2
