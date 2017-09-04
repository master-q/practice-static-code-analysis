#include <stdio.h>

int main()
    //@ requires true;
    //@ ensures true;
{
    int *p = 0;

    printf("%d\n", *p); // Error: NULL dereference

    return 0;
}
