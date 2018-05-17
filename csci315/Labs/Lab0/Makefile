CC = gcc
CFLAGS = -std=gnu99 -Wall -g #-DDEBUG

EXECS = dlisttest

all: $(EXECS)

dnode.o: dnode.c dnode.h
	gcc $(CFLAGS) -c dnode.c -o dnode.o

dlist.o: dlist.h dlist.c dnode.h
	gcc $(CFLAGS) -c dlist.c -o dlist.o

dlisttest: dnode.o dlist.o
	gcc $(CFLAGS) dlisttest.c dnode.o dlist.o -o dlisttest

.PHONY: clean
clean:
	/bin/rm -rf $(EXECS) dnode.o dlist.o

