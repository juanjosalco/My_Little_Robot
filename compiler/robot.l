%{
#include "y.tab.h"
extern int yylval;
%}

%%

"robot"|"Robot"|"ROBOT" { return ROBOT; }
"please"|"kindly" { return KIND_WORD; }
"rotate"|"turn" { return ROTATION_VERB; }
90|180|270|360 { yylval = atoi(yytext); return DEG_QUANTITY; }
"degrees" { return DEGREES; }
"move"|"go" { return MOVEMENT_VERB; }
[1-9][0-9]* { yylval = atoi(yytext); return DISTANCE; }
"steps"|"units"|"blocks" { return UNITS; }
"," { return COMMA; }
"next"|"then"|"afterwards"|"after"|"and" { return NEXO; }
"finally"|"lastly"|"last"|"finally"|"lastly"|"last" { return FINAL_CONNECTOR; }
"to" { return TO; }
"the" { return THE; }
"right" { return RIGHT; }
"left" { return LEFT; }
"back" { return BACK; }
"backwards" { return BACKWARDS; }
"front"|"forward" { return FRONT; }
"clockwise" { return CLOCKWISE; }
"counterclockwise" { return COUNTERCLOCKWISE; }

[ \t\n]+ /* ignore whitespace */

. {
    printf("invalid character: %s\n", yytext);
    FILE *output_file;
    output_file = fopen("../cpu/src/output.asm", "a");
    fprintf(output_file, "invalid character: %s\n", yytext);
    exit(1);
}

%%

int yywrap(void) {
    return 1;
}
