#include <iostream>
#include <string>
#include <vector>
#include <fstream>

using namespace std;

// Initial Global Variables

vector<vector<char> > matrix(10, vector<char>(10));
string currentDirection = "moveRight";
int currentPositionX = 5;
int currentPositionY = 5;

// Sets the Direction of the Robot

void setDirection(int direction){
    if(direction == 90){
        if(currentDirection == "moveRight"){
            currentDirection = "moveUp";
        } else if(currentDirection == "moveUp"){
            currentDirection = "moveLeft";
        } else if(currentDirection == "moveLeft"){
            currentDirection = "moveDown";
        } else {
            currentDirection = "moveRight";
        }
    } else if (direction == 180){
        if(currentDirection == "moveRight"){
            currentDirection = "moveLeft";
        } else if(currentDirection == "moveUp"){
            currentDirection = "moveDown";
        } else if(currentDirection == "moveLeft"){
            currentDirection = "moveRight";
        } else {
            currentDirection = "moveUp";
        }
    } else if(direction == 270){
        if(currentDirection == "moveRight"){
            currentDirection = "moveDown";
        } else if(currentDirection == "moveUp"){
            currentDirection = "moveRight";
        } else if(currentDirection == "moveLeft"){
            currentDirection = "moveUp";
        } else {
            currentDirection = "moveLeft";
        }
    } else if(direction == 360){
        if(currentDirection == "moveRight"){
            currentDirection = "moveRight";
        } else if(currentDirection == "moveUp"){
            currentDirection = "moveUp";
        } else if(currentDirection == "moveLeft"){
            currentDirection = "moveLeft";
        } else {
            currentDirection = "moveDown";
        }
    }
    else{
        cout << "! INVALID TURN !" << endl;
        exit(-1);
    }
}

//Check the limits of the Matrix
void checkLimits(int value){
    if (currentDirection == "moveRight" && currentPositionX + value > 10){
        cout << "! INVALID MOVE !" << endl;
        exit(-1);
    }
    else if (currentDirection == "moveLeft" && currentPositionX - value < 0){
        cout << "! INVALID MOVE !" << endl;
        exit(-1);
    }
    else if (currentDirection == "moveDown" && currentPositionY + value > 10){
        cout << "! INVALID MOVE !" << endl;
        exit(-1);
    }
    else if (currentDirection == "moveUp" && currentPositionY - value < 0){
        cout << "! INVALID MOVE !" << endl;
        exit(-1);
    }
}

// Moves the Robot the X Steps Given

void moveRobot(int numOfSteps){
    if(currentDirection == "moveRight"){
        for(int i = 0; i < numOfSteps; i++){
            matrix[currentPositionY][currentPositionX + i] = '*';
        }
        currentPositionX += numOfSteps;
    } else if(currentDirection == "moveLeft"){
        for(int i = 0; i < numOfSteps; i++){
            matrix[currentPositionY][currentPositionX - i] = '*';
        }
        currentPositionX -= numOfSteps;
    } else if(currentDirection == "moveDown"){
        for(int i = 0; i < numOfSteps; i++){
            matrix[currentPositionY + i][currentPositionX] = '*';
        }
        currentPositionY += numOfSteps;
    } else{
        for(int i = 0; i < numOfSteps; i++){
            matrix[currentPositionY - i][currentPositionX] = '*';
        }
        currentPositionY -= numOfSteps;
    }
}

void instructionSelected(string inst, int val){
    if(inst == "MOV"){
        checkLimits(val);
        moveRobot(val);
    } else if(inst == "TURN"){
        setDirection(val);
    } else {
        exit(-1);
    }
}

// Reads the Input of a File

void readFile(){
    string nameOfFile = "output.asm";
    ifstream archivo(nameOfFile.c_str());

    string instruction = "";
    int value = 0;

    while(!archivo.eof()){
        archivo >> instruction >> value;
        instructionSelected(instruction, value);
    }
    archivo.close();
    cout << endl << "Robot has finished the instructions" << endl;
}


// Fills the Matrix with Initial Values

void fillMatrix(){
    for(int i = 0; i < 10; i++){
        for(int j = 0; j < 10; j++){
            matrix[i][j] = 'O';
        }
    }
}

// Shows the Current Matrix

void showMatrix(){
    for(int i = 0; i < 10; i++){
        for(int j = 0; j < 10; j++){
            cout << matrix[i][j] << " ";
        }
        cout << endl;
    }
}


int main(){
    // Initializes the Matrix
    fillMatrix();
    // Sets the initial position of the Robot
    matrix[currentPositionX][currentPositionY] = 'X';
    // Shows the Matrix initial state
    cout << "\n!--------------- Welcome to MyLittleRobot ---------------!\n\n";
    // Instructions to Test
    showMatrix();
    // Sets the end of the Robot
    readFile();
    cout << endl;
    matrix[currentPositionY][currentPositionX] = 'X';
    showMatrix();

    return 0;
}
