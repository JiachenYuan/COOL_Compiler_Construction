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
  %1 = alloca i1, align 1
  %2 = alloca i1, align 1
  %3 = alloca i1, align 1
  %4 = alloca i1, align 1
  %5 = alloca i32, align 4
  store i32 0, ptr %5, align 4
  store i32 15, ptr %5, align 4
  store i1 false, ptr %4, align 1
  store i1 false, ptr %3, align 1
  store i1 false, ptr %2, align 1
  %6 = load i32, ptr %5, align 4
  %7 = load i32, ptr %5, align 4
  br i1 false, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %8 = sdiv i32 %7, 2
  %9 = mul i32 %8, 2
  %10 = icmp eq i32 %6, %9
  store i1 %10, ptr %4, align 1
  %11 = load i1, ptr %4, align 1
  %12 = xor i1 true, %11
  store i1 %12, ptr %3, align 1
  %13 = load i1, ptr %4, align 1
  br i1 %13, label %true.0, label %false.0

abort:                                            ; preds = %entry
  call void @abort()
  unreachable

true.0:                                           ; preds = %ok.0
  store i1 false, ptr %1, align 1
  br label %end.0

false.0:                                          ; preds = %ok.0
  store i1 true, ptr %1, align 1
  br label %end.0

end.0:                                            ; preds = %false.0, %true.0
  %14 = load i1, ptr %1, align 1
  store i1 %14, ptr %2, align 1
  %15 = load i1, ptr %2, align 1
  br i1 %15, label %true.01, label %false.02

true.01:                                          ; preds = %end.0
  store i32 1, ptr %0, align 4
  br label %end.03

false.02:                                         ; preds = %end.0
  store i32 0, ptr %0, align 4
  br label %end.03

end.03:                                           ; preds = %false.02, %true.01
  %16 = load i32, ptr %0, align 4
  ret i32 %16
}

define i32 @main() {
entry:
  %0 = call i32 @Main_main()
  %1 = call i32 (ptr, ...) @printf(ptr @.str, i32 %0)
  ret i32 0
}
