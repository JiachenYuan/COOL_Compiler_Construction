// test_dead_code_elimination.c
#include <stdio.h>

int main() {
    const int condition = 0; // This will never change

    if (condition) {
        printf("This should never print\n");
    } else {
        printf("This should always print\n");
    }

    return 0;
}
