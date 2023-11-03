class A {
    a: Int;
    b: Bool;
};


class Main {
    main(): Bool {{
        case new A of
            m : Main => false;
            object : Object => true;
        esac      ; 

    }};
};