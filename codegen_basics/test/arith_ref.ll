declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main.main() {

entry:
	%tmp.0 = sub i32 0, 1
	%tmp.1 = add i32 %tmp.0, 1
	%tmp.2 = mul i32 2, 4
	%tmp.3 = icmp eq i32 5, 0
	br i1 %tmp.3, label %abort, label %ok.0

ok.0:
	%tmp.4 = sdiv i32 %tmp.2, 5
	%tmp.5 = sub i32 %tmp.1, %tmp.4
	ret i32 %tmp.5

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

