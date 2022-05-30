.PHONY: all clean run dump

include CMakefile
CFLAGS=$(CFLAGS_WARNINGS) $(CFLAGS_FLAGS) $(CFLAGS_SYNTAX) $(CFLAGS_DEBUG)

OBJFILES=main.o stack.o meowcpy.o stack_check.o
HEADFILES=helper.h meowcpy.h stack_config.h stack.h


all: testprog

testprog: $(OBJFILES)
	$(CC) $(CFLAGS) $(CFLAGS_LINK) -o testprog main.o stack.o meowcpy.o stack_check.o

%.o: %.c $(HEADFILES)
	$(CC) -c $(CFLAGS) -o $@ $<


clean:
	rm -rf *.o *.i *.dump *.s testprog log.txt


run: testprog
	./testprog
	@echo 
	@echo 
	@echo Dump file:
	@echo ====================================================================================
	@echo 
	@cat log.txt
	@echo 
	@echo ====================================================================================


dump: testprog
	objdump -M intel -d testprog > testprog.dump

