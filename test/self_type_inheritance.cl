class A {
    m_str : String;
    m_self_type : SELF_TYPE;

    test1(a: Int, b: Bool): SELF_TYPE {
        m_self_type
    };

};

class B inherits A {
   -- B should have a m_self_type member of type B* 
   -- B should have a member that returns B*
};

class Main {
    a: B;
    b: String;

    main(): String {
        b
    };
};