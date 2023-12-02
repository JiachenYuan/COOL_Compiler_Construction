declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main.main() {

entry:
	%tmp.0 = alloca i32
	%tmp.1 = alloca i32
	%tmp.2 = alloca i32
	%tmp.3 = alloca i32
	store i32 1, i32* %tmp.0
	store i32 1, i32* %tmp.1
	store i32 2, i32* %tmp.2
	br label %loop.0

loop.0:
	%tmp.4 = load i32, i32* %tmp.2
	%tmp.5 = icmp eq i32 %tmp.4, 2
	br i1 %tmp.5, label %true.0, label %false.0

true.0:
	%tmp.6 = load i32, i32* %tmp.0
	%tmp.7 = load i32, i32* %tmp.1
	%tmp.8 = add i32 %tmp.6, %tmp.7
	store i32 %tmp.8, i32* %tmp.3
	%tmp.9 = load i32, i32* %tmp.1
	store i32 %tmp.9, i32* %tmp.0
	%tmp.10 = load i32, i32* %tmp.3
	store i32 %tmp.10, i32* %tmp.1
	%tmp.11 = load i32, i32* %tmp.2
	%tmp.12 = add i32 %tmp.11, 1
	store i32 %tmp.12, i32* %tmp.2
	br label %loop.0

false.0:
	%tmp.13 = load i32, i32* %tmp.1
	ret i32 %tmp.13

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

