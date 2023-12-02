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
  store i32 10, ptr %1, align 4
  store i32 10, ptr %1, align 4
  store i32 10, ptr %0, align 4
  %2 = load i32, ptr %0, align 4
  %3 = sub i32 %2, 2
  store i32 %3, ptr %0, align 4
  ret i32 %3

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
