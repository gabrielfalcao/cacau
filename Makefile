CC=clang # or gcc

FRAMEWORKS:= -framework Cocoa
LIBRARIES:= -lobjc

SOURCE=main.m

CFLAGS=-Wall -Werror -g -v $(SOURCE)
LDFLAGS=$(LIBRARIES) $(FRAMEWORKS)
OUT=-o main

all:
	$(CC) $(CFLAGS) $(LDFLAGS) $(OUT)
	./main
