declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main.main() {

entry:
	%tmp.0 = alloca i32
	%tmp.1 = alloca i32
	store i32 0, i32* %tmp.0
	%tmp.2 = mul i32 3, 3
	%tmp.3 = add i32 %tmp.2, 1
	store i32 %tmp.3, i32* %tmp.0
	store i32 0, i32* %tmp.1
	%tmp.4 = load i32, i32* %tmp.0
	%tmp.5 = load i32, i32* %tmp.0
	%tmp.6 = mul i32 %tmp.4, %tmp.5
	%tmp.7 = load i32, i32* %tmp.0
	%tmp.8 = icmp eq i32 %tmp.7, 0
	br i1 %tmp.8, label %abort, label %ok.0

ok.0:
	%tmp.9 = sdiv i32 %tmp.6, %tmp.7
	store i32 %tmp.9, i32* %tmp.1
	%tmp.10 = load i32, i32* %tmp.1
	%tmp.11 = load i32, i32* %tmp.1
	%tmp.12 = load i32, i32* %tmp.0
	%tmp.13 = sub i32 %tmp.11, %tmp.12
	%tmp.14 = icmp eq i32 %tmp.13, 0
	br i1 %tmp.14, label %abort, label %ok.1

ok.1:
	%tmp.15 = sdiv i32 %tmp.10, %tmp.13
	ret i32 %tmp.15

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

