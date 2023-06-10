all:
	yacc -d robot.y
	lex robot.l
	gcc y.tab.c lex.yy.c -ly -ll -o robot.exe

clean:
	rm -rf robot.exe
	rm -rf lex.yy.c
	rm -rf y.tab.c
	rm -rf y.tab.h
	rm -rf y.tab.h.gch
	rm -rf output.asm