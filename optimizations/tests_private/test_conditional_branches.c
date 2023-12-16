// test_conditional_branches.c
#include <stdio.h>

int main() {
    int a = 5;
    int b;

    if (a == 5) {
        b = 10; // SCCP should resolve this at compile time
    } else {
        b = 20;
    }

    printf("%d\n", b); // SCCP should allow this to be replaced with printf("10\n");
    return 0;
}
