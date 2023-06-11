all: 
	cd compiler; make; ./robot.exe
	cd cpu/src ; g++ -std=c++17 main.cpp -o main.exe ; ./main.exe

compile:
	cd compiler; make; ./robot.exe

run:
	cd cpu/src ; g++ -std=c++17 main.cpp -o main.exe ; ./main.exe

clean:
	cd compiler; make clean
	cd cpu/src ; rm -rf main.exe

test:
	cd testing; python3 test.py

run-test:
	cd cpu/src ; g++ -std=c++17 main.cpp -o main.exe ; ./main.exe arg
