class A {};

class B inherits A {};

class Main {
    a: A;
    b: B;

    main(): Bool { 
    {


        (if true then
			a
		else
			b
		fi);

        (
            if false then
                1
            else 
                true
            fi
        );

        true;
    }
    
    };
};