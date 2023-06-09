%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"

extern int yylval;
int yylex();
void yyerror(const char *s);
FILE *output_file;
FILE *input_file;
extern FILE *yyin;
extern FILE *output_file;

#define MAX_SENTENCE_LENGTH 1000
%}

%token ROBOT KIND_WORD ROTATION_VERB DEG_QUANTITY DEGREES MOVEMENT_VERB DISTANCE UNITS COMMA NEXO FINAL_CONNECTOR TO THE RIGHT LEFT FRONT BACK CLOCKWISE COUNTERCLOCKWISE BACKWARDS

%%
S: ROBOT INSTRUCTION { 
		printf("\n"); 
	}
 ;

INSTRUCTION: DO CONNECTOR
 | DO
 ;

DO: KIND_WORD ACTION
 | ACTION
 ;

ACTION: ROTATION
 | MOVEMENT DIR {
 	printf("MOV %d\n", $1);
 	
 	// Abre el archivo .asm en modo adicion, "a" - add
 	output_file = fopen("output.asm", "a");
 	
 	// Agrega la linea al archivo
	fprintf(output_file, "MOV %d\n", $1);
	
	// Cierra el archivo
	fclose(output_file);
   }
 | MOVEMENT { 
 	printf("MOV %d\n", $1);
 	output_file = fopen("output.asm", "a");
	fprintf(output_file, "MOV %d\n", $1);
	fclose(output_file);
   }
 ;

ROTATION: ROTATION_VERB DEG_QUANTITY CLK { 
	printf("TURN, %d\n", $3); 
	output_file = fopen("output.asm", "a");
	fprintf(output_file, "TURN, %d\n", $3);
	fclose(output_file);
  }
 | ROTATION_VERB DEG_QUANTITY DEGREES { 
 	printf("TURN, %d\n", $2); 
   	output_file = fopen("output.asm", "a");
	fprintf(output_file, "TURN, %d\n", $2);
	fclose(output_file);
   }
 | ROTATION_VERB DIR { 
 	printf("TURN, 270\n"); 
   	output_file = fopen("output.asm", "a");
	fprintf(output_file, "TURN, 270\n");
	fclose(output_file);
   }
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

ORIENTATION_1: RIGHT { 
	printf("TURN, 270\n"); 
   	output_file = fopen("output.asm", "a");
	fprintf(output_file, "TURN, 270\n");
	fclose(output_file);
   }
 | LEFT { 
 	printf("TURN, 90\n"); 
   	output_file = fopen("output.asm", "a");
	fprintf(output_file, "TURN, 90\n");
	fclose(output_file);
   }
 | FRONT
 | BACK { 
 	printf("TURN, 180\n"); 
 	output_file = fopen("output.asm", "a");
	fprintf(output_file, "TURN, 180\n");
	fclose(output_file);
   }
 | BACKWARDS { 
 	printf("TURN, 180\n"); 
   	output_file = fopen("output.asm", "a");
	fprintf(output_file, "TURN, 180\n");
	fclose(output_file);
   }
 ;

CONNECTOR: COMMA NEXO INSTRUCTION
 | COMMA INSTRUCTION
 | COMMA FINAL_CONNECTOR DO
 | DO
 ;
%%

int main(void) {
    
    input_file = fopen("input.txt", "r");
    
    if (!input_file) {
        fprintf(stderr, "Error opening input file.\n");
        return 1;
    }
    
     yyin = input_file;
    // Abre el archivo .asm en modo escritura. "w" -write
    output_file = fopen("output.asm", "w"); 
    
    // Llama al parser (yyparse)
    if (yyparse() != 0) {
        fprintf(stderr, "Parsing failed.\n");
        return 1;
    }
    
    
    // Process the sentence here
    // printf("Sentence: %s\n", sentence);
    
    
    if (!output_file) {
        fprintf(stderr, "No se pudo abrir el archivo de salida.\n");
        return 1;
    }

    
    fclose(input_file);
    
    // Cierra el archivo después de haber finalizado
    fclose(output_file);
    
    return 0;
}

void yyerror(const char *str) {
    fprintf(stderr,"error: %s\n",str);
}
