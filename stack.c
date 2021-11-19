#include "stack.h"

#define CANARY_DEF 0

void stack_ctor (stack *stk, size_t capacity, size_t elem_size)
{
	CHECK_POINTER(stk);


	stk->elem_size = elem_size;
	stk->capacity = capacity;
	stk->size = stack_size_calc (stk);
	//stk->status = 0;

	stk->status.constructed = 1;
	stk->top = 0;


	stk->data = malloc (stk->size);
	assert (stk->data != NULL);
	if (stk->data == NULL)
	{
		stk->status.memory_error = 1;
	}

	#ifndef NDEBUG_CANARY
		stk->data += sizeof (canary);
		stack_set_canary_header (stk, CANARY_DEF);
		stack_set_canary_data (stk, CANARY_DEF);
	#endif
}

void stack_push (stack *stk, uint8_t *value)
{
	CHECK_POINTER(stk);
	CHECK_POINTER(value);


	if (stk->top == stk->capacity)
	{
		stack_resize (stk, 2);
	}


	meowcpy (stk->data + stk->elem_size * stk->top, value, stk->elem_size);

	stk->top++;
}

void stack_pop (stack *stk, uint8_t *ret_mem)
{
	CHECK_POINTER(stk);
	CHECK_POINTER(ret_mem);


	if (stk->top == 0)
	{
		stk->status.underflow = 1;
		return;
	}


	stk->top--;

	meowcpy (ret_mem, stk->data + stk->elem_size*stk->top, stk->elem_size);
}

void stack_resize (stack *stk, size_t growth_ratio)
{
	CHECK_POINTER(stk);


	stk->capacity = growth_ratio * stk->capacity;
	stk->size = stack_size_calc (stk);

	#ifndef NDEBUG_CANARY
		stk->data = stk->data - sizeof (canary);
	#endif


	stk->data = realloc (stk->data, stk->size);

	assert (stk->data != NULL);
	if (stk->data == NULL)
	{
		stk->size = stk->capacity = stk->top = 0;
		stk->status.memory_error = 1;
	}

	#ifndef NDEBUG_CANARY
		stk->data = stk->data + sizeof (canary);
		stack_set_canary_data (stk, CANARY_DEF);
	#endif
}

size_t stack_size_calc (stack *stk)
{
	assert (stk != NULL);
	if (stk == NULL)
	{
		return -1;
	}


	size_t res = stk->capacity * stk->elem_size;

	#ifndef NDEBUG_CANARY
		res += sizeof (canary) * 2;
	#endif
	

	return res;
}

void meowcpy (uint8_t *to_mem, uint8_t *from_mem, size_t n)
{
	CHECK_POINTER(to_mem);
	CHECK_POINTER(from_mem);
	
	
	uint64_t buffer = 0;
	
	while (n >= sizeof (uint64_t))
	{
		buffer = *((uint64_t *) from_mem);
		
		*((uint64_t *) to_mem) = buffer;
		
		to_mem += sizeof (uint64_t);
		from_mem += sizeof (uint64_t);
		
		n -= sizeof (uint64_t);
	}
	
	
	while (n >= sizeof (uint32_t))
	{
		buffer = *((uint32_t *) from_mem);
		*((uint32_t *) to_mem) = (uint32_t) buffer;
		
		to_mem += sizeof (uint32_t);
		from_mem += sizeof (uint32_t);
		
		n -= sizeof (uint32_t);
	}
	
	
	while (n >= sizeof (uint16_t))
	{
		buffer = *((uint16_t *) from_mem);
		*((uint16_t *) to_mem) = (uint16_t) buffer;
		
		to_mem += sizeof (uint16_t);
		from_mem += sizeof (uint16_t);
		
		n -= sizeof (uint16_t);
	}
	
	
	while (n >= sizeof (uint8_t))
	{
		buffer = *((uint8_t *) from_mem);
		*((uint8_t *) to_mem) = (uint8_t) buffer;
		
		to_mem += sizeof (uint8_t);
		from_mem += sizeof (uint8_t);
		
		n -= sizeof (uint8_t);
	}
}

void stack_dtor (stack *stk)
{
	CHECK_POINTER(stk);
	

	stk->status.destructed = 1;
	
	#ifndef NDEBUG_CANARY
		stk->data -= sizeof (canary);
	#endif
	
	free (stk->data);
	stk->data = NULL;
}


#ifndef NDEBUG_CANARY
void stack_set_canary_header (stack *stk, canary value)
{
	CHECK_POINTER(stk);


	stk->left_canary = value;
	stk->right_canary = value;
}

void stack_set_canary_data (stack *stk, canary value)
{
	CHECK_POINTER(stk);
	CHECK_POINTER(stk->data);


	*((canary *) (stk->data - sizeof (canary))) = value;
	*((canary *) (stk->data + stk->elem_size*stk->capacity)) = value;
}

void stack_check_canary_header (stack *stk)
{
	CHECK_POINTER(stk);
	

	int left_alive = !(stk->left_canary - CANARY_DEF);
	int right_alive = !(stk->right_canary - CANARY_DEF);


	if (right_alive)
	{
		stk->status.right_canary_header = 0;
	}
	else
	{
		stk->status.right_canary_header = 0;
	}

	if (left_alive)
	{
		stk->status.left_canary_header = 0;
	}
	else
	{
		stk->status.left_canary_header = 0;
	}
}

void stack_check_canary_data (stack *stk)
{
	CHECK_POINTER(stk);


	int left_alive = (*((canary *) (stk->data - sizeof (canary)))
														== CANARY_DEF);
	int right_alive = (*((canary *) (stk->data + stk->elem_size*stk->capacity))
														== CANARY_DEF);

	if (right_alive)
	{
		stk->status.right_canary_data = 0;
	}
	else
	{
		stk->status.right_canary_data = 0;
	}

	if (left_alive)
	{
		stk->status.left_canary_data = 0;
	}
	else
	{
		stk->status.left_canary_data = 0;
	}
}
#endif


#ifndef NDEBUG_HASH
uint32_t stack_header_hash_calc (stack *stk)
{
	CHECK_POINTER_RET(stk);


	uint32_t backup = stk->header_hash;
	stk->header_hash = 0;

	uint32_t hash = hash_FAQ6 ((uint8_t *) stk, sizeof (stack));

	stk->header_hash = backup;


	return hash;
}

uint32_t stack_data_hash_calc (const stack *stk)
{
	CHECK_POINTER_RET(stk);
	CHECK_POINTER_RET(stk->data);

	uint8_t *data = stk->data;
	#ifndef NDEBUG_CANARY
		data -= sizeof (canary);
	#endif


	return hash_FAQ6 (data, stk->size);
}

uint32_t hash_FAQ6 (const uint8_t *mem_start, size_t n)
{
	CHECK_POINTER_RET(mem_start);


	uint32_t hash = 0;

	for (size_t i = 0; i < n; i++)
	{
		hash += (uint8_t) mem_start[i];
		hash += (hash << 10);
        hash ^= (hash >> 6);
	}

	hash += (hash << 3);
	hash ^= (hash >> 11);
	hash += (hash << 15);


	return hash;
}
#endif
