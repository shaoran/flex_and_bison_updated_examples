LEX=flex
YACC=bison
CC=gcc
ADDITIONAL_CFLAGS=-std=c99 -O2 -Wall -D_POSIX_C_SOURCE=200809L
BINS=fb1-1 fb1-2 fb1-3 fb1-4 fb1-5

all: $(BINS)

fb1-1: fb1-1.c
fb1-2: fb1-2.c
fb1-3: fb1-3.c
fb1-4: fb1-4.c
fb1-5: fb1-5.tab.c fb1-5.c
fb1-5.l_header_file=--header-file=fb1-5.h


fb1-5.tab.c: fb1-5.y
	$(YACC) -d -o $@ $<

$(BINS):
	$(CC) $(CFLAGS) $(ADDITIONAL_CFLAGS)  -o $@ $^ -lfl

%.c: %.l
	$(LEX) -o $@ $($(<)_header_file) $<

%.tab.c: %.y
	$(CC) -o $@ -d $<

.PHONY: clean

clean:
	rm -rf *.c *.h $(BINS)
