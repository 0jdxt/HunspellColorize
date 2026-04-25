CC = gcc
CFLAGS = -O2 -Wall

CFLAGS += $(shell pkg-config --cflags hunspell)
LDLIBS += $(shell pkg-config --libs hunspell)

huncolor: huncolor.o
	$(CC) -o huncolor huncolor.o $(LDLIBS)

huncolor.o: huncolor.c
	$(CC) $(CFLAGS) -c huncolor.c

install: huncolor
	install huncolor $(HOME)/bin

clean:
	rm -f huncolor huncolor.o
