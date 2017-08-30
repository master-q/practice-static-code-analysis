SRCS = \
	buffer_overflow.c \
	memory_leak.c \
	null_dereference.c \
	undefined_value.c
TARGETS = \
	$(patsubst %.c,gcc/%.log,$(SRCS))

all: $(TARGETS)

# GCC
gcc/%.log: %.c
	mkdir -p gcc
	gcc -Wall $< > $@ 2>&1

clean:
	rm -rf *.out gcc/

.PHONY: all clean
