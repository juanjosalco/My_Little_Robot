all: 
	cd compiler; make; ./robot.exe
	cd cpu/src ; g++ -std=c++17 main.cpp -o main.exe ; ./main.exe

compile:
	cd compiler; make; ./robot.exe

cpu:
	cd cpu/src ; g++ -std=c++17 main.cpp -o main.exe ; ./main.exe

clean:
	cd compiler; make clean
	cd cpu/src ; rm -rf main.exe
