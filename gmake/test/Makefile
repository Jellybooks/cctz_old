CC = g++ -ggdb3 -Wall -Wextra -std=c++14 -pthread $(OPTIMIZE)

TEST =				\
	cnv_test		\
	fmt_test		\

TEST_SRC = $(TEST:%=%.cc)
TEST_OBJ = $(TEST:%.=%.o)

.SECONDARY : $(TEST_SRC)

%.cc : ../../test/%.cc
	sed -e 's|src/|../src/|;'  < $<  > $@

% : %.cc
	$(CC) -o $@ $< ../src/libcctz.a   gmock/libgmock_main.a gmock/libgmock.a gtest/libgtest_main.a gtest/libgtest.a   -lpthread

all: gtest gmock $(TEST)
	./cnv_test
	./fmt_test

gtest:
	mkdir gtest
	cp -r /usr/src/gtest/* gtest/
	cd gtest && CXX=clang++ CMAKE_CXX_FLAGS="-ggdb3 -Wall -Wextra -std=c++14" cmake .
	cd gtest && make

gmock:
	mkdir gmock
	cp -r /usr/src/gmock/* gmock/
	cd gmock && CXX=clang++ CMAKE_CXX_FLAGS="-ggdb3 -Wall -Wextra -std=c++14" cmake .
	cd gmock && make

clean:
	rm -f *.o $(TEST) *~ *cc
	rm -rf gtest gmock
