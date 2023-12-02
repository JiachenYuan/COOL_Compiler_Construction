declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main.main() {

entry:
	%tmp.0 = alloca i32
	%tmp.1 = alloca i1
	%tmp.2 = alloca i32
	br i1 true, label %true.0, label %false.0

true.0:
	%tmp.3 = xor i1 false, true
	store i1 %tmp.3, i1* %tmp.1
	%tmp.4 = load i1, i1* %tmp.1
	br i1 %tmp.4, label %true.1, label %false.1

true.1:
	store i32 9, i32* %tmp.2
	br label %end.1

false.1:
	store i32 99, i32* %tmp.2
	br label %end.1

end.1:
	%tmp.5 = load i32, i32* %tmp.2
	store i32 %tmp.5, i32* %tmp.0
	br label %end.0

false.0:
	store i32 50, i32* %tmp.0
	br label %end.0

end.0:
	%tmp.6 = load i32, i32* %tmp.0
	ret i32 %tmp.6

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

