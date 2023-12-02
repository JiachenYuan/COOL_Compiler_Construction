class Main {
    main(): Object {
        let count: Int <- 3 in (
            while 0 < count loop (count <- count - 1) pool
        )
    };
};