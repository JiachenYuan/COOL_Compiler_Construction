declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main.main() {

entry:
	%tmp.0 = alloca i32
	%tmp.1 = alloca i32
	%tmp.2 = alloca i32
	store i32 0, i32* %tmp.0
	store i32 14, i32* %tmp.0
	store i32 0, i32* %tmp.1
	%tmp.3 = load i32, i32* %tmp.0
	%tmp.4 = icmp slt i32 %tmp.3, 8
	br i1 %tmp.4, label %true.0, label %false.0

true.0:
	%tmp.5 = load i32, i32* %tmp.0
	%tmp.6 = mul i32 %tmp.5, 2
	store i32 %tmp.6, i32* %tmp.1
	store i32 %tmp.6, i32* %tmp.2
	br label %end.0

false.0:
	%tmp.7 = load i32, i32* %tmp.0
	%tmp.8 = icmp eq i32 2, 0
	br i1 %tmp.8, label %abort, label %ok.0

ok.0:
	%tmp.9 = sdiv i32 %tmp.7, 2
	store i32 %tmp.9, i32* %tmp.1
	store i32 %tmp.9, i32* %tmp.2
	br label %end.0

end.0:
	%tmp.10 = load i32, i32* %tmp.2
	%tmp.11 = load i32, i32* %tmp.1
	%tmp.12 = icmp eq i32 2, 0
	br i1 %tmp.12, label %abort, label %ok.1

ok.1:
	%tmp.13 = sdiv i32 %tmp.11, 2
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

