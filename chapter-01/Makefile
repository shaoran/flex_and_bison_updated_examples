CC=gcc
BINS=fb1-1 fb1-2 fb1-3

all: $(BINS)


fb1-1: fb1-1.c
	$(CC) -o $@ $< -lfl

fb1-2: fb1-2.c
	$(CC) -o $@ $< -lfl

fb1-3: fb1-3.c
	$(CC) -o $@ $< -lfl

%.c: %.l
	flex -o $@ $<

.PHONY: clean

clean:
	rm -rf *.c $(BINS)
