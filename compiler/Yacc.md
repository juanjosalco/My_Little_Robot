# Yacc
Yacc,  is a parser generator that takes a set of context-free grammar rules as input and produces C code for a parser that recognizes the structure of the input based on those rules. It uses a bottom-up parsing technique called LALR(1) parsing to construct a parse tree for the input text. The generated parser can be used to validate the syntax of the input and perform subsequent actions based on the recognized structure.

## Context-Free Grammar
The code defines several tokens and rules for processing instructions. The main entry point for the parser is the S rule, which expects a ROBOT followed by an INSTRUCTION.

An INSTRUCTION can either be a DO statement or a DO statement preceded by a CONNECTOR. A DO statement can be further divided into a KIND_WORD followed by an ACTION, or just an ACTION.

An ACTION can represent a ROTATION, a MOVEMENT followed by a DIR, or simply a MOVEMENT. Each ACTION triggers a corresponding output and appends the generated instruction to the "output.asm" file.

A ROTATION can take different forms depending on the input. It can consist of a ROTATION_VERB followed by a DEG_QUANTITY and a CLK, or a ROTATION_VERB followed by a DEG_QUANTITY and DEGREES, or a ROTATION_VERB followed by a DIR.

A CLK represents the direction of rotation, such as "TO THE RIGHT", "TO THE LEFT", "CLOCKWISE", "COUNTERCLOCKWISE", "RIGHT", or "LEFT". The code includes logic to convert certain angles (90 and 270 degrees) to their complementary angles.

A MOVEMENT consists of a MOVEMENT_VERB followed by a DISTANCE and UNITS. The DISTANCE value is stored and used for output generation.

A DIR represents the direction of movement, such as "TO THE" followed by an ORIENTATION_1. The ORIENTATION_1 can be "RIGHT", "LEFT", "FRONT", "BACK", or "BACKWARDS". Similar to rotations, the code outputs corresponding instructions for each direction.

A CONNECTOR is used to connect multiple instructions together. It can consist of a COMMA followed by a NEXO and an INSTRUCTION, or a COMMA followed by an INSTRUCTION, or a COMMA followed by a FINAL_CONNECTOR and a DO. A FINAL_CONNECTOR is not defined in the given code snippet.

## Input and Output

- Input: The input language code is provided in the `input.txt` file.
- Output: The Yacc code generates an output file named `output.asm` located in the `../cpu/src/` directory. This file contains instructions or messages based on the parsed input code.

## Parsing Process

The Yacc code follows a standard parsing process to analyze the input code. Here's an overview of the steps involved:

1. The `main()` function serves as the entry point of the program. It opens the input file, sets up file pointers, and prepares the output file.
2. The `yyparse()` function is called to initiate the parsing process.
3. The Yacc parser calls the Lex code (lexer) using the `yylex()` function to obtain tokens for each input symbol.
4. The lexer processes the input, identifies patterns, and generates tokens based on the lexical rules defined in `robot.l`.
5. The Yacc parser processes the tokens according to the grammar rules and associated actions defined in `robot.y`.
6. During the parsing process, the Yacc actions manipulate the output file by opening it, writing specific content (instructions or messages), and closing it.
7. If a parsing error occurs, the `yyerror()` function is called to handle the error. It writes an error message to the output file and displays the error on the console.
8. Once the parsing is complete, the output file is closed, and the program terminates.

## Error Handling

- If an error occurs during the parsing process, the `yyerror()` function is called. It writes an error message to the output file and displays the error on the console.
- The error message provides information about the nature of the error and helps identify the issue in the input code.

Some inputs that are rejected by the grammar are if you use unexpected words, for example:
```text
robot please rotate 90 degrees to the right and then jump 5 steps forward
```
In this example `jump` is not a valid word so it will raise an error of an unexpected token.

Another example is if you use a word that is not in the correct order, for example:
```text
robot please rotate 90 degrees to the right and then to the left move 5 units forward
```
In this example `to the left` is not in the correct order, so it will raise syntax error and parsing error.


