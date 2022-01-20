#include <stdio.h>
#include "stack.h"


int main (void)
{
    stack mystk;
    STACK_CTOR(&mystk, 1, int);
    
    
    int n = 0;
    scanf ("%d", &n);
    
    int buf = 0;
    for (int i = 0; i < n; i++)
    {
        scanf ("%d", &buf);
        stack_push (&mystk, (uint8_t *) &buf);
    }
    
    
    for (int i = 0; i < n; i++)
    {
        buf = 0;
        stack_pop (&mystk, (uint8_t *) &buf);
        printf ("%d ", buf);
    }
    
    stack_check (&mystk);
    
    stack_dtor (&mystk);
    
    return 0;
}

