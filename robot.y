%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
extern int yylval;
int deg;
int yylex();
void yyerror(const char *s);
%}

%token ROBOT KIND_WORD ROTATION_VERB DEG_QUANTITY DEGREES MOVEMENT_VERB DISTANCE UNITS COMMA NEXO FINAL_CONNECTOR TO THE RIGHT LEFT FRONT BACK CLOCKWISE COUNTERCLOCKWISE

%%

S: ROBOT INSTRUCTION CONNECTOR EOS { printf("\n"); }
 | ROBOT INSTRUCTION CONNECTOR { printf("\n"); }
 | ROBOT INSTRUCTION EOS { printf("\n"); }
 | ROBOT INSTRUCTION { printf("\n"); }
 ;

INSTRUCTION: KIND_WORD ACTION
 | ACTION
 ;

ACTION: ROTATION
 | MOVEMENT DIR { printf("MOV %d\n", $1); }
 | MOVEMENT { printf("MOV %d\n", $1); }
 ;

ROTATION: ROTATION_VERB DEG_QUANTITY DEGREES CLK { deg = $2; printf("TURN %d\n", $4); }
 | ROTATION_VERB DEG_QUANTITY DEGREES { printf("TURN %d\n", $2); }
 | ROTATION_VERB DIR { printf("TURN 270\n"); }
 ;

CLK: TO THE RIGHT { 
    if (deg == 90) {
        $$ = 270;
    } else if (deg == 270) {
        $$ = 90;
    } else {
        $$ = deg;
    }
 }
 | TO THE LEFT { 
    $$ = deg;
  }
 | CLOCKWISE { 
    if (deg == 90) {
        $$ = 270;
    } else if (deg == 270) {
        $$ = 90;
    } else {
        $$ = deg;
    }
  }
 | COUNTERCLOCKWISE { $$ = deg; }
 | RIGHT { 
    if (deg == 90) {
        $$ = 270;
    } else if (deg == 270) {
        $$ = 90;
    } else {
        $$ = deg;
    }
  }
 | LEFT { $$ = deg; }
 ;

MOVEMENT: MOVEMENT_VERB DISTANCE UNITS { $$ = $2; }
 ;

DIR: ORIENTATION_1
 | TO THE ORIENTATION_1
 ;

ORIENTATION_1: RIGHT { printf("TURN 270\n"); }
 | LEFT { printf("TURN 90\n"); }
 | FRONT
 | BACK { printf("TURN 180\n"); }
 ;

CONNECTOR: COMMA NEXO INSTRUCTION
 ;

EOS: COMMA FINAL_CONNECTOR INSTRUCTION
 | FINAL_CONNECTOR INSTRUCTION
 | INSTRUCTION
 ;
%%

int main(void) {
    yyparse();
    return 0;
}

void yyerror(const char *str) {
    fprintf(stderr,"error: %s\n",str);
}
