#include "meowcpy.h"


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

