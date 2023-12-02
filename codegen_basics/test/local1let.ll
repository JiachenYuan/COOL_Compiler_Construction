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
  store i32 0, ptr %1, align 4
  store i32 10, ptr %1, align 4
  store i32 0, ptr %0, align 4
  %2 = load i32, ptr %1, align 4
  %3 = load i32, ptr %1, align 4
  %4 = mul i32 %2, %3
  %5 = load i32, ptr %1, align 4
  %6 = add i32 %4, %5
  store i32 %6, ptr %0, align 4
  %7 = load i32, ptr %0, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %10 = sdiv i32 %7, %8
  ret i32 %10

abort:                                            ; preds = %entry
  call void @abort()
  unreachable
}

define i32 @main() {
entry:
  %0 = call i32 @Main_main()
  %1 = call i32 (ptr, ...) @printf(ptr @.str, i32 %0)
  ret i32 0
}
