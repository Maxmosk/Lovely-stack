#ifndef STACK_H_INCLUDED
#define STACK_H_INCLUDED


#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "meowcpy.h"
#include "helper.h"


/** @def STACK_CTOR
 *  @brief The macro to use stack_ctor more comfortable
 *  @param[out] ptr Pointer on stack header for constructing
 *  @param[in] cap Capacity of stack after constructing
 *  @param[in] type Type of element of data in stack
 *  @note Type is data type as 'int', 'float', 'char *', etc
*/
#define STACK_CTOR(ptr, cap, type)				\
    memset(ptr, 0, sizeof(stack));             \
	stack_ctor ((ptr), (cap), sizeof (type));

/** @def CANARY_DEF
 *  @brief The macro with default value of canary of stack
 *  @note Used HEX-speak, that you can read as GIGA EL32 FOR DED32
*/
#define CANARY_DEF 0x919AE132F07DED32

/** @def GROWTH_FACTOR
 *  @brief The macro with default value of growth factor of stack
*/
#define GROWTH_FACTOR 2

/** @def DUMP_FILE
 *  @brief The macro with name of dump file of stack
*/
#define DUMP_FILE "log.txt"


/** @typedef canary
 *  @brief The type of canary in stack header and data
*/
#ifndef NDEBUG_CANARY
	typedef uint64_t canary;
#endif

/** @typedef stack_status
 *  @brief The type of status of stack
*/
typedef struct
{
	unsigned constructed:1;
	unsigned destructed:1;
	unsigned underflow:1;
	unsigned memory_error:1;
	unsigned unknowen_error:1;

	#ifndef NDEBUG_CANARY
		unsigned left_canary_header:1;
		unsigned right_canary_header:1;
		unsigned left_canary_data:1;
		unsigned right_canary_data:1;
	#endif

	#ifndef NDEBUG_HASH
		unsigned header_hash:1;
		unsigned data_hash:1;
	#endif
} stack_status;

/** @typedef stack
 *  @brief The type of stack header
*/
typedef struct
{
	#ifndef NDEBUG_CANARY
		canary left_canary;
	#endif

	uint8_t *data;
	size_t elem_size;
	stack_status status;
	size_t capacity;
	size_t size;
	size_t top;

	#ifndef NDEBUG_HASH
		uint32_t data_hash;
		uint32_t header_hash;
	#endif

	#ifndef NDEBUG_CANARY
		canary right_canary;
	#endif
} stack;


enum STACK_CHECK_CODES
{
    OK      = 0,
    ERROR   = 1
};


/** @fn stack_ctor
 *  @brief The function to construct stack
 *  @param[out] stk Pointer on stack header for constructing
 *  @param[in] capacity Capacity of stack after constructing
 *  @param[in] elem_size Size of one element of data in stack
*/
void stack_ctor (stack *stk, size_t capacity, size_t elem_size);

/** @fn stack_push
 *  @brief The function to push new element to stack
 *  @param[out] stk Pointer on stack to push element to its data
 *  @param[in] ret_mem Pointer on element to push it
*/
void stack_push (stack *stk, uint8_t *value);

/** @fn stack_pop
 *  @brief The function to pop element from stack
 *  @param[in] stk Pointer on stack to pop element from it
 *  @param[out] ret_mem Pointer on memory to return element
*/
void stack_pop (stack *stk, uint8_t *ret_mem);

/** @fn stack_resize
 *  @brief Function to resize array of data of stack
 *  @param[out] stk Pointer on stack to resize it
 *  @param[in] growth_ratio The number by which the stack
 * 							capacity will be multiplied
 *  @note If 'realloc' return null-pointer then it writes memory
 * 											error in stack status
*/
void stack_resize (stack *stk, size_t growth_ratio);

/** @fn stack_size_calc
 *  @brief The function to calculate size of stack data for this capacity
 *  @param[in] stk Stack to calculate his size
 *  @return size of data array for this stack
 *  @note For calculation will be used value of capacity from stack header
 *  @warning Size of canaries will be added in this function if it needs
*/
size_t stack_size_calc (stack *stk);

/** @fn stack_dtor
 *  @brief The function to destroy stack
 *  @param[out] stk Pointer on stack to destroy it
 *  @note This function to free data array and writes
 * 					information about this in status
*/
void stack_dtor (stack *stk);

uint8_t stack_check (stack *stk);

uint8_t stack_check_status (stack *stk);

#ifndef NDEBUG_CANARY
/** @fn stack_set_canary_header
 *  @brief The function to set values of canaries in stack header
 *  @param[out] stk Pointer to stack for setting of canaries
 *  @param[in] value Value of canary after setting
*/
void stack_set_canary_header (stack *stk, canary value);

/** @fn stack_set_canary_data
 *  @brief The function to set values of canaries in stack data array
 *  @param[out] stk Pointer to stack for setting of canaries
 *  @param[in] value Value of canary after setting
*/
void stack_set_canary_data (stack *stk, canary value);

/** @fn stack_check_canary_header
 *  @brief The function to check canary-variables in header
 *  @param[in] stk Stack to check it's canary-vars in header
 *  @note Writes status of canary in status of stack
*/
void stack_check_canary_header (stack *stk);

/** @fn stack_check_canary_data
 *  @brief The function to check canary-variables in data array
 *  @param[in] stk Stack to check it's canary-vars in data
 *  @note Writes status of canary in status of stack
*/
void stack_check_canary_data (stack *stk);
#endif


#ifndef NDEBUG_HASH
/** @fn stack_set_hash
 *  @brief The function to set values of hashes in stach
 *  @param stk Pointer on stack for setting hashes
*/
void stack_set_hash (stack *stk);

/** @fn stack_header_hash_calc
 *  @brief The function to calculate hash of stack header
 *  @param[in] stk Pointer on stack for calculation
 *  @return Value of 'hash_FAQ6' for stack header
 *  @note This function resets value of stack header hash to zero
 *  @warning If stk is null-pointer then it returns 0
*/
uint32_t stack_header_hash_calc (stack *stk);

/** @fn stack_data_hash_calc
 *  @brief The function to calculate hash of stack data
 *  @param[in] stk Pointer on stack for calculation
 *  @return Value of 'hash_FAQ6' for data array
 *  @warning If stk is null-pointer then it returns 0
*/
uint32_t stack_data_hash_calc (const stack *stk);

/** @fn hash_FAQ6
 *  @brief The function to calculate FAQ6-hash of memory
 *  @param[in] mem_start Pointer of first byte of memory
 *  @param[in] n Quantity of bytes to calculate function
 *  @return Value of function by FAQ6-algorithm
 *  @warning If mem_start is null-pointer then it returns 0
*/
uint32_t hash_FAQ6 (const uint8_t *mem_start, size_t n);
#endif


#endif

