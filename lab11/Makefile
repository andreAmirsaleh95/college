
CC = gcc -I ./include
CFLAGS = -std=gnu99 -Wall -g #-DDEBUG

INC = ./include
SRC = ./src
OBJ = ./obj
DOC = ./doc
BIN = ./bin

vpath %.h ./include
vpath %.c ./src

EXECS = gshell

all: mkpaths $(EXECS)

mkpaths:
	mkdir -p $(OBJ)
	mkdir -p $(BIN)

$(OBJ)/wrappers.o: wrappers.c wrappers.h
	$(CC) $(CFLAGS) -c $(SRC)/wrappers.c -o $(OBJ)/wrappers.o

$(OBJ)/dnode.o: dnode.c dnode.h
	$(CC) $(CFLAGS) -c $(SRC)/dnode.c -o $(OBJ)/dnode.o

$(OBJ)/dlist.o: dlist.c dlist.h dnode.h
	$(CC) $(CFLAGS) -c $(SRC)/dlist.c -o $(OBJ)/dlist.o

gshell: gshell.c $(OBJ)/dnode.o $(OBJ)/dlist.o $(OBJ)/wrappers.o
	$(CC) $(CFLAGS) $(OBJ)/dnode.o $(OBJ)/dlist.o $(OBJ)/wrappers.o $(SRC)/gshell.c -o $(BIN)/gshell


.PHONY: clean
clean:
	/bin/rm -rf $(BIN)/* $(OBJ)/* core* *~ ./src/*~ ./bin ./obj

