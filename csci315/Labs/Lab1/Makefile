CC = gcc
CFLAGS = -std=gnu99 -Wall -g #-DDEBUG

all: catcount.o cmdreverse.o cmds.o fork.o fork-data.o fork-file.o fork-wait.o myprog.o

catcount.o: catcount.c
	gcc $(CFLAGS) catcount.c -o catcount.o

cmdreverse.o: cmdreverse.c
	gcc $(CFLAGS) cmdreverse.c -o cmdreverse.o

cmds.o: cmds.c
	gcc $(CFLAGS) cmds.c -o cmds.o

fork.o: fork.c
	gcc $(CFLAGS) fork.c -o fork.o

fork-data.o: fork-data.c
	gcc $(CFLAGS) fork.c -o fork-data.o

fork-file.o: fork-file.c
	gcc $(CFLAGS) fork-file.c -o fork-file.o

fork-wait.o: fork-wait.c
	gcc $(CFLAGS) fork-wait.c -o fork-wait.o

myprog.o: myprog.c
	gcc $(CFLAGS) myprog.c -o myprog.o
