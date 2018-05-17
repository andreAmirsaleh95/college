CC = gcc
CFLAGS = -std=gnu99 -Wall -g #-DDEBUG

all: heap-test pipe-test pipes upper tokens

heap-test: heap-test.c
	$(CC) $(CFLAGS) heap-test.c -o heap-test

pipe-test: pipe-test.c
	$(CC) $(CFLAGS) pipe-test.c -o pipe-test

pipes: pipes.c wrappers.c
	$(CC) $(CFLAGS) pipes.c wrappers.c -o pipes

upper: upper.c wrappers.c
	$(CC) $(CFLAGS) upper.c wrappers.c -o upper

tokens: tokens.c wrappers.c
	$(CC) $(CFLAGS) tokens.c wrappers.c -o tokens
