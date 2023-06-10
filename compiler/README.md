# My_Little_Robot

## Description

This is a simple robot that can move around a 10x10 grid. It can be placed on the grid, moved and rotated. The grammar provided allows the user to input a series of instructions for the robot to follow. These instructions can include movement and rotation commands. The grammar also includes rules for handling connectors and final connectors, allowing the user to chain together multiple instructions in a single program and have a more natural interaction with the robot.

By using the grammar, the user can create programs that control the robot's movements and report its position on the grid. This can be useful for a variety of applications, such as simulating the movement of a physical robot or testing algorithms for robot navigation.

## Tools

This project was implemented using the following tools:

- C++: A general-purpose programming language that was used to write the code for the robot program. C++ is a popular language for developing high-performance applications and is widely used in the software industry.

- Flex: A lexical analyzer generator that was used to generate the scanner for the robot program. Flex is a tool that generates code for scanning input streams and is commonly used in the development of compilers and interpreters.

- Yacc (Bison): A parser generator that was used to generate the parser for the robot program. Yacc is a tool that generates code for parsing input streams and is commonly used in the development of compilers and interpreters.

These tools were chosen because they are widely used in the development of compilers and interpreters, and are well-suited for implementing the grammar-based approach used in this project. C++ was chosen as the programming language because of its performance and popularity in the software industry. Flex and Yacc were chosen because of their ease of use and ability to generate efficient code for scanning and parsing input streams.

## Context Free Grammar

Here are the accepted words for each token:
```text
⟨ROBOT⟩ → "robot" | "Robot" | "ROBOT"
⟨KIND_WORD⟩ → "please" | "kindly"
⟨ROTATION_VERB⟩ → "rotate" | "turn"
⟨DEG_QUANTITY⟩ → 90 | 180 | 270 | 360
⟨DEGREES⟩ → "degrees"
⟨MOVEMENT_VERB⟩ → "move" | "go"
⟨DISTANCE⟩ → [1-9][0-9]*
⟨UNITS⟩ → "steps" | "units"
⟨COMMA⟩ → ","
⟨NEXO⟩ → "next" | "then" | "afterwards" | "after" | "and"
⟨FINAL_CONNECTOR⟩ → "finally" | "lastly" | "last"
⟨TO⟩ → "to"
⟨THE⟩ → "the"
⟨RIGHT⟩ → "right"
⟨LEFT⟩ → "left"
⟨FRONT⟩ → "front" | "forward"
⟨BACK⟩ → "back"
⟨BACKWARDS⟩ → "backwards"
⟨CLOCKWISE⟩ → "clockwise"
⟨COUNTERCLOCKWISE⟩ → "counterclockwise"
```

Here is the context free grammar used to parse the input:
```text
⟨S⟩ → ⟨ROBOT⟩ ⟨INSTRUCTION⟩
⟨INSTRUCTION⟩ → ⟨DO⟩ ⟨CONNECTOR⟩ | ⟨DO⟩
⟨DO⟩ → ⟨KIND_WORD⟩ ⟨ACTION⟩ | ⟨ACTION⟩
⟨ACTION⟩ → ⟨ROTATION⟩ | ⟨MOVEMENT⟩ ⟨DIR⟩
⟨ROTATION⟩ → ⟨ROTATION_VERB⟩ ⟨DEG_QUANTITY⟩ ⟨CLK⟩ | ⟨ROTATION_VERB⟩ ⟨DEG_QUANTITY⟩ ⟨DEGREES⟩ | ⟨ROTATION_VERB⟩ ⟨DIR⟩
⟨CLK⟩ → ⟨DEGREES⟩ ⟨CLOCKWISE⟩ | ⟨DEGREES⟩ ⟨COUNTERCLOCKWISE⟩ | ⟨DEGREES⟩ ⟨RIGHT⟩ | ⟨DEGREES⟩ ⟨LEFT⟩
⟨MOVEMENT⟩ → ⟨MOVEMENT_VERB⟩ ⟨DISTANCE⟩ ⟨UNITS⟩
⟨DIR⟩ → ⟨ORIENTATION_1⟩ | ⟨TO⟩ ⟨THE⟩ ⟨ORIENTATION_1⟩
⟨ORIENTATION_1⟩ → ⟨RIGHT⟩ | ⟨LEFT⟩ | ⟨FRONT⟩ | ⟨BACK⟩ | ⟨BACKWARDS⟩
⟨CONNECTOR⟩ → ⟨COMMA⟩ ⟨NEXO⟩ ⟨INSTRUCTION⟩ | ⟨COMMA⟩ ⟨INSTRUCTION⟩ | ⟨COMMA⟩ ⟨FINAL_CONNECTOR⟩ ⟨DO⟩
```

The rotations are considered to be always counterclockwise, that's why the grammar is able to identify when the user wants to rotate clockwise and it transforms the rotation to its equivalent counterclockwise rotation, making the interaction with the robot more natural.

### Example Inputs
**Input 1**
```text
robot please rotate 90 degrees to the right and then move 5 steps forward
```

**Output 1**
```text
TURN 270
MOV 5
```

**Input 2**
```text
Robot please turn 90 degrees to the right, then move 5 units to the right, then move 10 steps, next move 15 units to the back, then move 5 steps backwards, finally turn 180 degrees
```

**Output 2**
```text
TURN 270
TURN 270
MOV 5
MOV 10
TURN 180
MOV 15
TURN 180
MOV 5
TURN 180
```

## Installation

To run the program, you can follow these steps:

1. Clone the repository to your local machine and navigate to the project directory:
```bash
git clone https://github.com/juanjosalco/My_Little_Robot.git
cd My_Little_Robot
```

2. Run the makefile to compile the lex and yacc files and generate the executable using make.

```bash
make
```

