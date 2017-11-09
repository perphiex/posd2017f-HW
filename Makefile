CXX = g++
CPPFLAGS = -std=gnu++0x
SRC = .
INCLUDE = .
TEST = .
EXE_NAME = hw5
OBJS = term.o atom.o number.o variable.o struct.o list.o global.o scanner.o parser.o
UTESTS = utTerm.h utVariable.h utStruct.h utList.h utParser.h

all: $(EXE_NAME)

$(EXE_NAME): main.o $(OBJS)
ifeq ($(OS), Windows_NT)
	$(CXX) -o $(EXE_NAME) main.o $(OBJS) -lgtest
else
	$(CXX) -o $(EXE_NAME) main.o $(OBJS) -lgtest -lpthread
endif
	
main.o: main.cpp $(TEST)/$(UTESTS)
	$(CXX) $(CPPFLAGS) -c main.cpp

%.o: $(SRC)/%.cpp $(INCLUDE)/%.h
	$(CXX) -std=gnu++0x -c $<

clean:	
ifeq ($(OS), Windows_NT)
	del *.o *.exe
else
	rm -f *.o $(EXE_NAME)
endif

test: format
	clear
	make clean
	make
	./$(EXE_NAME)
	make clean

format:
	clang-format -i -style=file *.h *.cpp