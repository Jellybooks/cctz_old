CC = clang++ -ggdb3 -Wall -Wextra -std=c++14 -pthread $(OPTIMIZE)

SRC =				\
	cctz_cnv.cc 		\
	cctz_fmt.cc 		\
	cctz_if.cc 		\
	cctz_impl.cc 		\
	cctz_info.cc 		\
	cctz_libc.cc 		\
	cctz_posix.cc 		\

HEADER =			\
	cctz.h 			\
	cctz_if.h 		\
	cctz_impl.h 		\
	cctz_info.h 		\
	cctz_libc.h 		\
	cctz_posix.h 		\
	tzfile.h 		\

OBJ = $(SRC:%.cc=%.o)

LIB = libcctz.a

%.cc : ../../src/%.cc
	sed -e 's|src/||;'  < $<  > $@

%.h : ../../src/%.h
	sed -e 's|src/||;'  < $<  > $@

%.o : %.cc %.h
	$(CC) -c -fpic -o $@ $<

%.o : %.cc
	$(CC) -c -fpic -o $@ $<

$(LIB) : $(SRC) $(HEADER) $(OBJ) Makefile
	ar rcs $(LIB) $(OBJ)

clean:
	rm -f $(OBJ) $(LIB)
	rm -f *cc *h *~

install:
	sudo cp libcctz.a /usr/local/lib/
	sudo cp cctz.h /usr/local/include/
