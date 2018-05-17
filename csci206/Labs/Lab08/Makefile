CC=gcc
CFLAGS=-Wall
all: snode-test dnode-test song_list dlist_test

snode.o: snode.c snode.h
	$(CC) -c snode.c

snode-test.o: snode-test.c snode.h
	$(CC) -c snode-test.c

snode-test: snode.o snode-test.o
	$(CC) snode.o snode-test.o -o snode-test

dnode.o: dnode.c dnode.h
	$(CC) -c dnode.c

dnode-test.o: dnode-test.c dnode.h
	$(CC) -c dnode-test.c

dnode-test: dnode.o dnode-test.o
	$(CC) dnode.o dnode-test.o -o dnode-test

dlist.o: dlist.c dnode.o dlist.h
	$(CC) -c dlist.c dnode.o

song_list: dlist.o song_list.c
	$(CC) song_list.c dlist.o dnode.o -o song_list

dlist_test: dlist.o dlist_test.c
	$(CC) dlist_test.c dlist.o dnode.o -o dlist_test
