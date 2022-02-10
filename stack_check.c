#include "stack.h"


#ifndef NDEBUG_DUMP
/** @fn stack_check_print_data
 *  @brief Function to print all elements of stack to dump
 *  @param[in] stk Pointer to stack with elements
 *  @param[out] dump Pointer to file for printing
 *  @return Code from enum STACK_CHECK_CODES
*/
static uint8_t stack_check_print_data (stack *stk, FILE *dump)
{
    CHECK_POINTER_RET(stk, ERROR);
    CHECK_POINTER_RET(stk->data, ERROR);
    CHECK_POINTER_RET(dump, ERROR);
    
    
    uint8_t *val_this = stk->data;
    
    for (size_t i = 0; i < stk->top; i++)
    {
        stack_print_elem (dump, val_this);
        val_this += stk->elem_size;
        fputc (' ', dump);
    }
    
    
    return OK;
}
#endif

/** @fn stack_check_status
 *  @brief Function to check status of stack and write to dump
 *  @param[in] stk Pointer to stack with status
 *  @param[out] dump Pointer to file for printing
 *  @return Code from enum STACK_CHECK_CODES
*/
static uint8_t stack_check_status (stack *stk, FILE *dump)
{
    CHECK_POINTER_RET(stk, ERROR);
    #ifndef NDEBUG_DUMP
        CHECK_POINTER_RET(dump, ERROR);
    #endif
    
    
    bool status_ok = true;
    
    #ifndef NDEBUG_DUMP
        fprintf (dump, "Status checking:\n");
        
        fprintf (dump, "\tConstructed: %d\n", stk->status.constructed);
        fprintf (dump, "\tDestructed: %d\n", stk->status.destructed);
        fprintf (dump, "\tUnderflow: %d\n", stk->status.underflow);
        fprintf (dump, "\tMemory error: %d\n", stk->status.memory_error);
        fprintf (dump, "\tUnknowen error: %d\n", stk->status.unknowen_error);
        
        #ifndef NDEBUG_CANARY
            fprintf (dump, "\tLeft canary header: %d\n", stk->status.left_canary_header);
		    fprintf (dump, "\tRight canary header: %d\n", stk->status.right_canary_header);
		    fprintf (dump, "\tLeft canary data: %d\n", stk->status.left_canary_data);
		    fprintf (dump, "\tRight canary data: %d\n", stk->status.right_canary_data);
	    #endif
	    
	    #ifndef NDEBUG_HASH
	        fprintf (dump, "\tHeader hash: %d\n", stk->status.header_hash);
		    fprintf (dump, "\tData hash: %d\n", stk->status.data_hash);
        #endif
    #endif
    
    status_ok = status_ok && stk->status.constructed;
    status_ok = status_ok && ~stk->status.destructed;
    status_ok = status_ok && ~stk->status.underflow;
    status_ok = status_ok && ~stk->status.memory_error;
    status_ok = status_ok && ~stk->status.unknowen_error;
    
    #ifndef NDEBUG_CANARY
        status_ok = status_ok && ~stk->status.left_canary_header;
        status_ok = status_ok && ~stk->status.right_canary_header;
        status_ok = status_ok && ~stk->status.left_canary_data;
        status_ok = status_ok && ~stk->status.right_canary_data;
    #endif
    
    #ifndef NDEBUG_HASH
        status_ok = status_ok && ~stk->status.header_hash;
        status_ok = status_ok && ~stk->status.data_hash;
    #endif
    
    
    if (status_ok)
    {
        return OK;
    }
    else
    {
        return ERROR;
    }
}


uint8_t stack_check (stack *stk)
{
    CHECK_POINTER_RET(stk, ERROR);
    CHECK_POINTER_RET(stk->data, ERROR);
    #ifndef NDEBUG_DUMP
        CHECK_POINTER_RET(stk->dump, ERROR);
    #endif
    
    
    bool stack_ok = true;
    
    
    size_t calc_size = stack_size_calc (stk);
    
    #ifndef NDEBUG_HASH
    uint32_t calc_header_hash = stack_header_hash_calc (stk);
    uint32_t calc_data_hash = stack_data_hash_calc (stk);
    #endif
    
    
    #ifndef NDEBUG_DUMP
        FILE *dump = fopen (stk->dump, "a+");
        CHECK_POINTER_RET(dump, ERROR);
        
        fprintf (dump, "Stack checking started!\n");
        
        fprintf (dump, "General information:\n");
        fprintf (dump, "\tHeader address: %p\n", (void *) stk);
        fprintf (dump, "\tData: %p\n", (void *) stk->data);
        fprintf (dump, "\tElement size: %zu\n", stk->elem_size);
        fprintf (dump, "\tCapacity: %zu\n", stk->capacity);
        fprintf (dump, "\tSize: %zu\n", stk->size);
        fprintf (dump, "\tSize calculated: %zu\n", calc_size);
        fprintf (dump, "\tTop: %zu\n", stk->top);
        
        #ifndef NDEBUG_HASH
            fprintf (dump, "Hash defence:\n");
		    fprintf (dump, "\tHeader hash: %x\n", stk->header_hash);
		    fprintf (dump, "\tData hash: %x\n", stk->data_hash);
		    fprintf (dump, "\tHeader hash calculated: %x\n", calc_header_hash);
		    fprintf (dump, "\tData hash calculated: %x\n", calc_data_hash);
	    #endif

	    #ifndef NDEBUG_CANARY
	        fprintf (dump, "Canary defence:\n");
	        fprintf (dump, "\tLeft header canary: %lx\n", stk->left_canary);
	        fprintf (dump, "\tRight header canary: %lx\n", stk->right_canary);
	        
	        fprintf (dump, "\tLeft data canary: %lx\n",
	                    *((canary *) (stk->data - sizeof (canary))));
	        fprintf (dump, "\tRight data canary: %lx\n",
	                    *((canary *) (stk->data + stk->elem_size*stk->capacity)));
	        fprintf (dump, "\tDefault canary: %lx\n", CANARY_DEF);
	    #endif
	    
	    
	    fprintf (dump, "Data:\n");
	    fputc ('\t', dump);
	    stack_check_print_data (stk, dump);
	    fputc ('\n', dump);
    #endif
    
    
    stack_ok = stack_ok && (calc_size == stk->size);
    if (calc_size != stk->size)
    {
        stk->status.unknowen_error = ERROR;
    }
    
    
    #ifndef NDEBUG_CANARY
        stack_ok = stack_ok && (CANARY_DEF == *((canary *) (stk->data - sizeof (canary))));
        if (CANARY_DEF != *((canary *) (stk->data - sizeof (canary))))
        {
            stk->status.left_canary_data = ERROR;
        }
        
        stack_ok = stack_ok && (CANARY_DEF
                            == *((canary *) (stk->data + stk->elem_size*stk->capacity)));
        if (CANARY_DEF != *((canary *) (stk->data + stk->elem_size*stk->capacity)))
        {
            stk->status.right_canary_data = ERROR;
        }
        
        stack_ok = stack_ok && (stk->left_canary == CANARY_DEF);
        if (stk->left_canary != CANARY_DEF)
        {
            stk->status.left_canary_header = ERROR;
        }
        
        stack_ok = stack_ok && (stk->right_canary == CANARY_DEF);
        if (stk->right_canary != CANARY_DEF)
        {
            stk->status.right_canary_header = ERROR;
        }
    #endif
    
    
    #ifndef NDEBUG_HASH
        stack_ok = stack_ok && (stk->header_hash == calc_header_hash);
        if (stk->header_hash != calc_header_hash)
        {
            stk->status.header_hash = ERROR;
        }
        
        stack_ok = stack_ok && (stk->data_hash == calc_data_hash);
        if (stk->header_hash != calc_header_hash)
        {
            stk->status.data_hash = ERROR;
        }
    #endif
    
    uint8_t status_of_status = stack_check_status (stk, dump);
    stack_ok = stack_ok && (status_of_status == OK);
    
    
    #ifndef NDEBUG_DUMP
        fclose (dump);
    #endif
    
    
    if (stack_ok)
    {
        return OK;
    }
    else
    {
        return ERROR;
    }
}

