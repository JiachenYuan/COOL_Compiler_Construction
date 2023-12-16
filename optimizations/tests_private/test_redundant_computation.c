// test_redundant_computation.c
#include <stdio.h>

int main() {
    int a = 15;
    int b = a * 2; // 30
    int c = b / 2; // 15, redundant, should be optimized out

    printf("%d\n", c); // SCCP should allow this to be replaced with printf("15\n");
    return 0;
}
