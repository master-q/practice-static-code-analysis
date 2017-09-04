#include <stdlib.h>

struct account {
    int balance;
};

int main()
    //@ requires true;
    //@ ensures true;
{
    struct account *myAccount = 0;

    myAccount->balance = 5; // Error: NULL dereference

    return 0;
}
