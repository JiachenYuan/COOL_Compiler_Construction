#include <stdio.h>

int main() {
    int array[5] = {1, 2, 3, 4, 5};
    int sum = 0;
    
    for (int i = 0; i < 5; ++i) {
        int element = array[i];
        sum += element;
    }

    printf("Sum: %d\n", sum);

    return 0;
}
