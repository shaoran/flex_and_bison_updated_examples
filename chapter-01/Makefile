FLEX=flex
CC=gcc
BINS=fb1-1 fb1-2 fb1-3 fb1-4

all: $(BINS)

fb1-1: fb1-1.c
fb1-2: fb1-2.c
fb1-3: fb1-3.c
fb1-4: fb1-4.c

$(BINS):
	$(CC) -o $@ $< -lfl

%.c: %.l
	$(FLEX) -o $@ $<

.PHONY: clean

clean:
	rm -rf *.c $(BINS)
