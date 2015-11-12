CC = clang++ -ggdb3 -Wall -Wextra -std=c++14 $(OPTIMIZE)

SRC = time_tool.cc

.SECONDARY : $(SRC)

%.cc : ../../tools/%.cc
	sed -e 's|src/|../src/|;'  < $<  > $@

% : %.cc
	$(CC) -o $@ $< ../src/libcctz.a

all: time_tool

clean:
	rm -f *.o time_tool *~ *cc
