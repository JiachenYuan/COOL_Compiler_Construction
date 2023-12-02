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
  %3 = alloca i32, align 4
  store i32 1, ptr %3, align 4
  store i32 1, ptr %2, align 4
  store i32 2, ptr %1, align 4
  br label %while.0

while.0:                                          ; preds = %loop_body.0, %entry
  %4 = load i32, ptr %1, align 4
  %5 = icmp sle i32 %4, 4
  br i1 %5, label %loop_body.0, label %loop_end.0

loop_body.0:                                      ; preds = %while.0
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %2, align 4
  %8 = add i32 %6, %7
  store i32 %8, ptr %0, align 4
  %9 = load i32, ptr %2, align 4
  store i32 %9, ptr %3, align 4
  %10 = load i32, ptr %0, align 4
  store i32 %10, ptr %2, align 4
  %11 = load i32, ptr %1, align 4
  %12 = add i32 %11, 1
  store i32 %12, ptr %1, align 4
  br label %while.0

loop_end.0:                                       ; preds = %while.0
  %13 = load i32, ptr %2, align 4
  ret i32 %13

abort:                                            ; No predecessors!
  call void @abort()
  unreachable
}

define i32 @main() {
entry:
  %0 = call i32 @Main_main()
  %1 = call i32 (ptr, ...) @printf(ptr @.str, i32 %0)
  ret i32 0
}
