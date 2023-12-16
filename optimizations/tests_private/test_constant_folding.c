// test_constant_folding.c
#include <stdio.h>

int main() {
    const int a = 4;
    const int b = 6;
    int c = a + b; // 10, this should be folded at compile time

    printf("%d\n", c); // SCCP should allow this to be replaced with printf("10\n");
    return 0;
}
