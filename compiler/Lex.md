# Lex

## Introduction
Lex is a lexical analyzer generator that takes a set of regular expressions as input and generates C code for a scanner that tokenizes the input text according to the specified patterns. It uses a finite state machine to match the regular expressions and perform actions associated with each pattern. The generated scanner can be incorporated into a larger program or used as a standalone component.

## Description
This is a simple robot that can move around a 10x10 grid. It can be placed on the grid, moved and rotated. The grammar provided allows the user to input a series of instructions for the robot to follow. These instructions can include movement and rotation commands. The grammar also includes rules for handling connectors and final connectors, allowing the user to chain together multiple instructions in a single program and have a more natural interaction with the robot.

By using the grammar, the user can create programs that control the robot's movements and report its position on the grid. This can be useful for a variety of applications, such as simulating the movement of a physical robot or testing algorithms for robot navigation.

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

The grammar also allows the user to chain together multiple instructions in a single program and have a more natural interaction with the robot.

### Accepted Input Examples
**Input 1**
```text
robot please rotate 90 degrees to the right and then move 5 steps forward
```

**Output 1**
```text
TURN, 270
MOV, 5
```

**Input 2**
```text
Robot please turn 90 degrees to the right, then move 5 units to the right, then move 10 steps, next move 15 units to the back, then move 5 steps backwards, finally turn 180 degrees
```

**Output 2**
```text
TURN, 270
TURN, 270
MOV, 5
MOV, 10
TURN, 180
MOV, 15
TURN, 180
MOV, 5
TURN, 180
```
