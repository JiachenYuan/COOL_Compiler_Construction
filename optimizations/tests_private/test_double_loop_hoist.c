int main() {
    int a = 1;
    for (int i=0; i<10; i++) {
        a = 1;
        int b = a + a;
        int c = 10;
        for (int j=0; j<10; j++) {
            b = a + a;
            c = b + a;
        }
    }
}