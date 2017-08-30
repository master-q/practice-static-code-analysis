#include <stdio.h>

int main()
    //@ requires true;
    //@ ensures true;
{
    int my_array[10];

    my_array[20] = 1; // Error: Buffer overflow

    return 0;
}
