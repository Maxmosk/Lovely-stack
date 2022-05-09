.PHONY: all clean run dump

include CMakefile
CFLAGS=$(CFLAGS_WARNINGS) $(CFLAGS_FLAGS) $(CFLAGS_SYNTAX)


all: testprog

testprog: main.o stack.o meowcpy.o stack_check.o
	$(CC) $(CFLAGS) $(CFLAGS_LINK) -o testprog main.o stack.o meowcpy.o stack_check.o

main.o: main.c
	$(CC) -c $(CFLAGS) -o main.o main.c
stack.o: stack.c
	$(CC) -c $(CFLAGS) -o stack.o stack.c
stack_check.o: stack_check.c
	$(CC) -c $(CFLAGS) -o stack_check.o stack_check.c
meowcpy.o: meowcpy.c
	$(CC) -c $(CFLAGS) -o meowcpy.o meowcpy.c


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

