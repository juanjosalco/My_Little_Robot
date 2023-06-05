%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
extern int yylval;
int yylex();
void yyerror(const char *s);
%}

%token ROBOT KIND_WORD ROTATION_VERB DEG_QUANTITY DEGREES MOVEMENT_VERB DISTANCE UNITS COMMA NEXO FINAL_CONNECTOR TO THE RIGHT LEFT FRONT BACK CLOCKWISE COUNTERCLOCKWISE BACKWARDS

%%

S: ROBOT INSTRUCTION { printf("\n"); }
 ;

INSTRUCTION: DO CONNECTOR
 | DO
 ;

DO: KIND_WORD ACTION
 | ACTION
 ;

ACTION: ROTATION
 | MOVEMENT DIR { printf("MOV %d\n", $1); }
 | MOVEMENT { printf("MOV %d\n", $1); }
 ;

ROTATION: ROTATION_VERB DEG_QUANTITY CLK { printf("TURN %d\n", $3); }
 | ROTATION_VERB DEG_QUANTITY DEGREES { printf("TURN %d\n", $2); }
 | ROTATION_VERB DIR { printf("TURN 270\n"); }
 ;

CLK: DEGREES TO THE RIGHT { 
    if ($1 == 90) {
        $$ = 270;
    } else if ($1 == 270) {
        $$ = 90;
    } else {
        $$ = $1;
    }
 }
 | DEGREES TO THE LEFT { 
    $$ = $1;
  }
 | DEGREES CLOCKWISE { 
    if ($1 == 90) {
        $$ = 270;
    } else if ($1 == 270) {
        $$ = 90;
    } else {
        $$ = $1;
    }
  }
 | DEGREES COUNTERCLOCKWISE { $$ = $1; }
 | DEGREES RIGHT { 
    if ($1 == 90) {
        $$ = 270;
    } else if ($1 == 270) {
        $$ = 90;
    } else {
        $$ = $1;
    }
  }
 | DEGREES LEFT { $$ = $1; }
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
 | BACKWARDS { printf("TURN 180\n"); }
 ;

CONNECTOR: COMMA NEXO INSTRUCTION
 | COMMA INSTRUCTION
 | COMMA FINAL_CONNECTOR DO
 | DO
 ;
%%

int main(void) {
    yyparse();
    return 0;
}

void yyerror(const char *str) {
    fprintf(stderr,"error: %s\n",str);
}
