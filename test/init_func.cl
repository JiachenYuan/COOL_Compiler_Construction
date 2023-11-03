class A {
    a: Int <- 9;
};

class B {
    z: Int <- 10;
};

class Main inherits B {
    a: Int <- 1 + 3 + 5;
    b: Bool <- true;
    c: A;

    main(): Bool {
        true
    };
};