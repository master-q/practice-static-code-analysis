#include <stdlib.h>

struct account {
    int balance;
};

int main()
    //@ requires true;
    //@ ensures true;
{
    struct account *myAccount = NULL;

    myAccount->balance = 5; // Error: NULL dereference

    return 0;
}
