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
CFLAGS+= -lasan #-fsanitize=address,leak,undefined -fstack-protector 
CFLAGS+= -s -masm=intel -pedantic -std=c99 -o


all: testprog

testprog: main.o stack.o meowcpy.o stack_check.o
	$(CC) $(CFLAGS) testprog main.o stack.o meowcpy.o stack_check.o

main.o: main.c
	$(CC) -c $(CFLAGS) main.o main.c
stack.o: stack.c
	$(CC) -c $(CFLAGS) stack.o stack.c
stack_check.o: stack_check.c
	$(CC) -c $(CFLAGS) stack_check.o stack_check.c
meowcpy.o: meowcpy.c
	$(CC) -c $(CFLAGS) meowcpy.o meowcpy.c


clean:
	rm -rf *.o *.i *.dump *.s testprog log.txt


run:
	./testprog
	@echo 
	@echo 
	@echo Dump file:
	@echo ====================================================================================
	@echo 
	@cat log.txt
	@echo 
	@echo ====================================================================================


dump:
	objdump -M intel -d testprog > testprog.dump

