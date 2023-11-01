class A {

};

class B inherits A {
    b: String;
    a: Bool;
    c: B;

    test1(arg1: A, arg2: Int) : SELF_TYPE {
        self
    };
};


class Main inherits B {

    test2(arg1: A, args: Int) : Int {
        100
    };

    main(): String { {

        let test_obj: B <- new B in {
            -- form 1 dispatch
            test_obj.test1(c, 3);
            -- form 2 dispatch
            test2(self, 999);
        };
        "Hello";
    }
        
    };
};