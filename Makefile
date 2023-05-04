# my first ever makefile

CXX = g++

CXXFLAGS = -std=c++17 -Wconversion -Wall -Werror -Wextra -pedantic

FILES = main.cpp vec3.h color.h ray.h

EXEC_FILE = tracerays

$(EXEC_FILE): $(FILES)
	$(CXX) $(CXXFLAGS) $^ -o $@

debug: CXXFLAGS += -g3 -DDEBUG -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
debug: $(FILES)
	$(CXX) $(CXXFLAGS) $^ -o $(EXEC_FILE)_debug
.PHONY: debug


clean:
	-rm -f *.o
	-rm -f $(EXEC_FILE)*
.PHONY: clean