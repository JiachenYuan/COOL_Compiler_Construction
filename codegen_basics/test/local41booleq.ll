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
  br i1 true, label %true.0, label %false.0

true.0:                                           ; preds = %entry
  br i1 true, label %true.01, label %false.02

false.0:                                          ; preds = %entry
  store i32 4, ptr %0, align 4
  br label %end.0

end.0:                                            ; preds = %false.0, %end.03
  %3 = load i32, ptr %0, align 4
  ret i32 %3

true.01:                                          ; preds = %true.0
  br i1 true, label %true.04, label %false.05

false.02:                                         ; preds = %true.0
  store i32 3, ptr %1, align 4
  br label %end.03

end.03:                                           ; preds = %false.02, %end.06
  %4 = load i32, ptr %1, align 4
  store i32 %4, ptr %0, align 4
  br label %end.0

true.04:                                          ; preds = %true.01
  store i32 1, ptr %2, align 4
  br label %end.06

false.05:                                         ; preds = %true.01
  store i32 2, ptr %2, align 4
  br label %end.06

end.06:                                           ; preds = %false.05, %true.04
  %5 = load i32, ptr %2, align 4
  store i32 %5, ptr %1, align 4
  br label %end.03

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
