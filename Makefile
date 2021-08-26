TARGET = calc
CFLAGS = -c -g -DDEBUG 
OBJS = y.tab.o lex.yy.o main.o
CC = /usr/bin/gcc
SCANNER = calc.l
GRAMMER = calc.y

$(TARGET) : $(OBJS)
	$(CC) -o $@ $(OBJS)

.c.o:
	$(CC) $(CFLAGS) $*.c

lex.yy.c : $(SCANNER) 
	flex $(SCANNER)

y.tab.c : $(GRAMMER) 
	bison --yacc -dv $(GRAMMER)

main.o : main.c

clean:
	rm -rf *.o $(TARGET) y.output y.tab.c y.tab.h lex.yy.c *~
