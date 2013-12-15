CXX=g++
CXXFLAGS=-W -Wall
LDFLAGS=-lsfml-network -lsfml-graphics -lsfml-window -lsfml-system
EXEC=Hydra

all: $(EXEC)

Hydra: bin/Game.o bin/Main.o
	$(CXX) -o $@ $^ $(LDFLAGS)

bin/Game.o: src/Game.cpp
	$(CXX) $(CXXFLAGS) -iquote. -c -o $@ $< 

bin/Main.o: src/Main.cpp
	$(CXX) $(CXXFLAGS) -iquote. -c -o $@ $< 

.PHONY: clean mrproper

clean:
	rm -rf bin/*.o
	
mrproper: clean
	rm -rf $(EXEC)
