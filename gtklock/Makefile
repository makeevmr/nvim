CC ?= cc
CFLAGS ?= -O2 -Wall -Wextra
GTK_FLAGS := $(shell pkg-config --cflags --libs gtk+-3.0 gmodule-2.0)

.PHONY: all clean

all: session-info.so

session-info.so: session-info.c gtklock-module.h
	$(CC) $(CFLAGS) -fPIC -shared -o $@ session-info.c $(GTK_FLAGS)

clean:
	rm -f session-info.so
