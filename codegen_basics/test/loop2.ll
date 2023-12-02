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

while.0:                                          ; preds = %loop_end.03, %entry
  %1 = load i32, ptr %0, align 4
  %2 = icmp slt i32 %1, 10
  br i1 %2, label %loop_body.0, label %loop_end.0

loop_body.0:                                      ; preds = %while.0
  br label %while.01

loop_end.0:                                       ; preds = %while.0
  %3 = load i32, ptr %0, align 4
  ret i32 %3

while.01:                                         ; preds = %loop_body.02, %loop_body.0
  %4 = load i32, ptr %0, align 4
  %5 = icmp slt i32 %4, 11
  br i1 %5, label %loop_body.02, label %loop_end.03

loop_body.02:                                     ; preds = %while.01
  %6 = load i32, ptr %0, align 4
  %7 = add i32 %6, 1
  store i32 %7, ptr %0, align 4
  br label %while.01

loop_end.03:                                      ; preds = %while.01
  br label %while.0

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
