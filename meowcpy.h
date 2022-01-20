#ifndef MEOWCPY_H_INCLUDED
#define MEOWCPY_H_INCLUDED


#include <stddef.h>
#include <stdint.h>
#include "helper.h"


/** @fn meowcpy
 *  @brief The function to copy memory very fast
 *  @param[out] to_mem Pointer on memory for copying to it
 *  @param[in] from_mem Pointer on memory for copying data from it
 *  @param[in] n Quantity of bytes to copy
*/
void meowcpy (uint8_t *to_mem, uint8_t *from_mem, size_t n);


#endif

