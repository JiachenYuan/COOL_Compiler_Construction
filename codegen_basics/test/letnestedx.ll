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
  %2 = alloca i1, align 1
  store i1 true, ptr %2, align 1
  store i32 1, ptr %1, align 4
  %3 = load i1, ptr %2, align 1
  br i1 %3, label %true.0, label %false.0

true.0:                                           ; preds = %entry
  store i32 1, ptr %0, align 4
  br label %end.0

false.0:                                          ; preds = %entry
  store i32 0, ptr %0, align 4
  br label %end.0

end.0:                                            ; preds = %false.0, %true.0
  %4 = load i32, ptr %0, align 4
  ret i32 %4

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
