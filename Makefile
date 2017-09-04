SRCS = \
	buffer_overflow.c \
	memory_leak.c \
	null_dereference.c \
	null_dereference2.c \
	undefined_value.c
TARGETS = \
	$(patsubst %.c,gcc/%.log,$(SRCS)) \
	$(patsubst %.c,uno/%.log,$(SRCS))

all: date.stamp

date.stamp: $(TARGETS)
	date > date.stamp

# GCC
gcc/%.log: %.c
	mkdir -p gcc
	gcc -Wall $< > $@ 2>&1

# Uno
uno/%.log: %.c
	mkdir -p uno
	uno $< > $@ 2>&1

clean:
	rm -rf date.stamp *.out gcc uno

.PHONY: all clean
