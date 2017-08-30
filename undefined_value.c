#include <stdio.h>

int main()
    //@ requires true;
    //@ ensures true;
{
    int my_array[10];

    printf("%d\n", my_array[0]); // Error: Undefined value

    return 0;
}
