#ifndef HELPER_H_INCLUDED
#define HELPER_H_INCLUDED


#include <assert.h>


/** @def CHECK_POINTER
 *  @brief The macro to check pointer
 *  @param[in] ASS_POINTER Pointer to check it
 *  @warning Can be used only in 'void'-functions
*/
#define CHECK_POINTER(ASS_POINTER)				\
	assert ((ASS_POINTER) != NULL);				\
	if ((ASS_POINTER) == NULL)					\
	{											\
		return;									\
	}

/** @def CHECK_POINTER_RET
 *  @brief The macro to check pointer
 *  @param[in] POINTER_FISTING Pointer to check it
 *  @warning Can be used only in 'int'-functions
*/
#define CHECK_POINTER_RET(POINTER_FISTING, RET_VAL_ASS)		\
	assert ((POINTER_FISTING) != NULL);			            \
	if ((POINTER_FISTING) == NULL)				            \
	{											            \
		return (RET_VAL_ASS);								\
	}


#endif

