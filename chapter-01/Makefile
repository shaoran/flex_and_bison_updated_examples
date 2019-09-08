CC=gcc
BINS=fb1-1

all: $(BINS)

fb1-1: fb1-1.c
	$(CC) -o $@ $< -lfl

%.c: %.l
	flex -o $@ $<

.PHONY: clean

clean:
	rm *.c $(BINS)
