class A {

};

class B inherits A {
    b: String;
    a: Bool;
    c: B;

    test1(arg1: A, arg2: Int) : String {
        b
    };
};


class Main inherits B {

    main(): String {
        let test_obj: B <- new B in {
            test_obj@B.test1(c, 3);
        }        
        
    };
};