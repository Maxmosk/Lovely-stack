.PHONY: all clean run dump


#C programming language compiler
CC=gcc
#Compiler flags
CFLAGS=  -Wall -Wextra -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wcast-align 
CFLAGS+= -Wstrict-prototypes -Wstrict-overflow=5 -Wwrite-strings -Waggregate-return 
CFLAGS+= -Wcast-qual -Wswitch-default -Wswitch-enum -Wconversion -Wunreachable-code 
CFLAGS+= -Wformat=2 -Werror -Winit-self -Wuninitialized -Wpointer-arith -save-temps 
CFLAGS+= -Wold-style-definition -Wstrict-prototypes -Wmissing-prototypes 
CFLAGS+= -Werror-implicit-function-declaration -Wlogical-op -Wduplicated-cond
CFLAGS+= -Wcast-qual -Wcast-align -Wformat-security 
CFLAGS+= -lasan -fsanitize=address,leak,undefined -fno-sanitize-recover -fstack-protector 
CFLAGS+= -s -pedantic -std=c99 -o


all: testprog

testprog: main.o stack.o meowcpy.o
	$(CC) $(CFLAGS) testprog main.o stack.o meowcpy.o

main.o: main.c
	$(CC) -c $(CFLAGS) main.o main.c
stack.o: stack.c
	$(CC) -c $(CFLAGS) stack.o stack.c
meowcpy.o: meowcpy.c
	$(CC) -c $(CFLAGS) meowcpy.o meowcpy.c


clean:
	rm -rf *.o *.i *.dump testprog


run:
	./testprog


dump:
	objdump -M intel -d testprog > testprog.dump

