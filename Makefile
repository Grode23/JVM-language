.PHONY: default

default: jvmSimp

jvmSimp: jvmSimp.tab.c
	gcc -o jvmSimp jvmSimp.tab.c -lfl

jvmSimpLex.c: jvmSimp.l
	flex -s -ojvmSimpLex.c jvmSimp.l

jvmSimp.tab.c: jvmSimp.y jvmSimpLex.c jvmSimp.h
	bison -v jvmSimp.y

cleanWin:
	cmd /c erase jvmSimplex.c jvmSimp.tab.h
	cmd /c erase jvmSimp.tab.c jvmSimp jvmSimp.exe jvmSimp.output

clean-unix:
	rm -f jvmSimplex.c jvmSimp.tab.h
	rm -f jvmSimp.tab.c jvmSimp jvmSimp.exe jvmSimp.output

clean-compilation-files:
	rm -f simple*.j simple*.class
