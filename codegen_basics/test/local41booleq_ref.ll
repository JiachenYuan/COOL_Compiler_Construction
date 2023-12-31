declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main.main() {

entry:
	%tmp.0 = alloca i32
	%tmp.1 = alloca i32
	%tmp.2 = alloca i32
	%tmp.3 = icmp eq i32 3, 5
	%tmp.4 = xor i1 %tmp.3, true
	br i1 %tmp.4, label %true.0, label %false.0

true.0:
	%tmp.5 = icmp eq i1 true, false
	%tmp.6 = xor i1 %tmp.5, true
	br i1 %tmp.6, label %true.1, label %false.1

true.1:
	%tmp.7 = icmp eq i1 false, false
	br i1 %tmp.7, label %true.2, label %false.2

true.2:
	store i32 1, i32* %tmp.2
	br label %end.2

false.2:
	store i32 2, i32* %tmp.2
	br label %end.2

end.2:
	%tmp.8 = load i32, i32* %tmp.2
	store i32 %tmp.8, i32* %tmp.1
	br label %end.1

false.1:
	store i32 3, i32* %tmp.1
	br label %end.1

end.1:
	%tmp.9 = load i32, i32* %tmp.1
	store i32 %tmp.9, i32* %tmp.0
	br label %end.0

false.0:
	store i32 4, i32* %tmp.0
	br label %end.0

end.0:
	%tmp.10 = load i32, i32* %tmp.0
	ret i32 %tmp.10

abort:
	call void @abort(  )
	unreachable
}

@main.printout.str = internal constant [25 x i8] c"Main.main() returned %d\0A\00"
define i32 @main() {

entry:
	%vtpm.0 = call i32 @Main.main(  )
	%tpm = getelementptr [25 x i8], [25 x i8]* @main.printout.str, i32 0, i32 0
	%vtpm.1 = call i32(i8*, ... ) @printf( i8* %tpm, i32 %vtpm.0 )
	ret i32 0
}

