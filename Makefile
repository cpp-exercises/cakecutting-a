#!make -f

CXX=clang++-9 
CXXFLAGS=-std=c++2a

HEADERS=PiecewiseConstantAgent.hpp PiecewiseUniformAgent.hpp CutAndChoose.hpp LastDiminisher.hpp
OBJECTS=PiecewiseConstantAgent.o PiecewiseUniformAgent.o CutAndChoose.o LastDiminisher.o

run: demo
	./$^

demo1: DemoCutAndChoose.o $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o demo

demo2: DemoLastDiminisher.o $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o demo

test: TestCounter.o Test.o o $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o test

%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) --compile $< -o $@

clean:
	rm -f *.o demo test
