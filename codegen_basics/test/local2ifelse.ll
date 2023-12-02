; ModuleID = 'module'
source_filename = "module"

@.str = internal constant [25 x i8] c"Main.main() returned %d\0A\00"

declare i32 @strcmp(ptr, ptr)

declare i32 @printf(ptr, ...)

declare void @abort()

declare ptr @malloc(i32)

define i32 @Main_main() {
entry:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  store i32 14, ptr %2, align 4
  store i32 0, ptr %1, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %true.0, label %false.0

true.0:                                           ; preds = %entry
  %5 = load i32, ptr %2, align 4
  %6 = mul i32 %5, 2
  store i32 %6, ptr %1, align 4
  store i32 %6, ptr %0, align 4
  br label %end.0

false.0:                                          ; preds = %entry
  %7 = load i32, ptr %2, align 4
  br i1 false, label %abort, label %ok.0

end.0:                                            ; preds = %ok.0, %true.0
  %8 = load i32, ptr %0, align 4
  %9 = load i32, ptr %1, align 4
  br i1 false, label %abort, label %ok.1

ok.0:                                             ; preds = %false.0
  %10 = sdiv i32 %7, 2
  store i32 %10, ptr %1, align 4
  store i32 %10, ptr %0, align 4
  br label %end.0

abort:                                            ; preds = %end.0, %false.0
  call void @abort()
  unreachable

ok.1:                                             ; preds = %end.0
  %11 = sdiv i32 %9, 2
  ret i32 %11
}

define i32 @main() {
entry:
  %0 = call i32 @Main_main()
  %1 = call i32 (ptr, ...) @printf(ptr @.str, i32 %0)
  ret i32 0
}
