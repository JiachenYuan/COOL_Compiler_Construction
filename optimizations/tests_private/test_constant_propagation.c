// test_constant_propagation.c
#include <stdio.h>

int main() {
    const int a = 10;
    int b = a + 5;
    printf("%d\n", b); // SCCP should allow this to be replaced with printf("15\n");
    return 0;
}
