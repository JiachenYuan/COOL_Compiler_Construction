declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main.main() {

entry:
	%tmp.0 = alloca i32
	%tmp.1 = alloca i1
	%tmp.2 = alloca i1
	%tmp.3 = alloca i1
	%tmp.4 = alloca i1
	%tmp.5 = alloca i32
	store i32 0, i32* %tmp.0
	store i32 15, i32* %tmp.0
	store i1 false, i1* %tmp.1
	store i1 false, i1* %tmp.2
	store i1 false, i1* %tmp.3
	%tmp.6 = load i32, i32* %tmp.0
	%tmp.7 = load i32, i32* %tmp.0
	%tmp.8 = icmp eq i32 2, 0
	br i1 %tmp.8, label %abort, label %ok.0

ok.0:
	%tmp.9 = sdiv i32 %tmp.7, 2
	%tmp.10 = mul i32 %tmp.9, 2
	%tmp.11 = icmp eq i32 %tmp.6, %tmp.10
	store i1 %tmp.11, i1* %tmp.1
	%tmp.12 = load i1, i1* %tmp.1
	%tmp.13 = xor i1 %tmp.12, true
	store i1 %tmp.13, i1* %tmp.2
	%tmp.14 = load i1, i1* %tmp.1
	br i1 %tmp.14, label %true.0, label %false.0

true.0:
	store i1 false, i1* %tmp.4
	br label %end.0

false.0:
	store i1 true, i1* %tmp.4
	br label %end.0

end.0:
	%tmp.15 = load i1, i1* %tmp.4
	store i1 %tmp.15, i1* %tmp.3
	%tmp.16 = load i1, i1* %tmp.3
	br i1 %tmp.16, label %true.1, label %false.1

true.1:
	store i32 1, i32* %tmp.5
	br label %end.1

false.1:
	store i32 0, i32* %tmp.5
	br label %end.1

end.1:
	%tmp.17 = load i32, i32* %tmp.5
	ret i32 %tmp.17

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

