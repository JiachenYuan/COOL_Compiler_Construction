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
  store i32 8, ptr %0, align 4
  br label %while.0

while.0:                                          ; preds = %loop_body.0, %entry
  %1 = load i32, ptr %0, align 4
  %2 = icmp slt i32 %1, 10
  br i1 %2, label %loop_body.0, label %loop_end.0

loop_body.0:                                      ; preds = %while.0
  %3 = load i32, ptr %0, align 4
  %4 = add i32 %3, 1
  store i32 %4, ptr %0, align 4
  br label %while.0

loop_end.0:                                       ; preds = %while.0
  %5 = load i32, ptr %0, align 4
  ret i32 %5

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
