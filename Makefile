SRCS = \
	buffer_overflow.c \
	memory_leak.c \
	null_dereference.c \
	null_dereference_simple.c \
	undefined_value.c
TARGETS = \
	$(patsubst %.c,gcc/%.log,$(SRCS)) \
	$(patsubst %.c,scan-build/%.log,$(SRCS)) \
	$(patsubst %.c,cppcheck/%.log,$(SRCS)) \
	$(patsubst %.c,splint/%.log,$(SRCS)) \
	$(patsubst %.c,uno/%.log,$(SRCS)) \
	$(patsubst %.c,verifast/%.log,$(SRCS))

all: date.stamp

date.stamp: $(TARGETS)
	date > date.stamp

# GCC
gcc/%.log: %.c
	mkdir -p gcc
	gcc -Wall $< > $@ 2>&1

# Infer
# xxx

# Clang Static Analyzer
scan-build/%.log: %.c
	mkdir -p scan-build
	scan-build-5.0 -o $@.out gcc -c $< > $@ 2>&1

# Cppcheck
cppcheck/%.log: %.c
	mkdir -p cppcheck
	cppcheck $< > $@ 2>&1

# Splint
splint/%.log: %.c
	mkdir -p splint
	-splint $< > $@ 2>&1

# Uno
uno/%.log: %.c
	mkdir -p uno
	uno $< > $@ 2>&1

# VeriFast
verifast/%.log: %.c
	mkdir -p verifast
	-verifast -c $< > $@ 2>&1

clean:
	rm -rf date.stamp *.out *.o gcc scan-build cppcheck splint uno verifast

.PHONY: all clean
