; ModuleID = '<stdin>'
source_filename = "test_double_loop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 1, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %7 = load i32, ptr %3, align 4
  %8 = icmp slt i32 %7, 10
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %9, %10
  %12 = load i32, ptr %6, align 4
  %13 = icmp slt i32 %12, 10
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr %2, align 4
  %16 = add nsw i32 %14, %15
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %2, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %20, 1
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, 1
  br label %24

24:                                               ; preds = %30, %0
  br i1 %8, label %25, label %31

25:                                               ; preds = %24
  store i32 1, ptr %2, align 4
  store i32 %11, ptr %4, align 4
  store i32 10, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %26

26:                                               ; preds = %28, %25
  br i1 %13, label %27, label %29

27:                                               ; preds = %26
  store i32 %16, ptr %4, align 4
  store i32 %19, ptr %5, align 4
  br label %28

28:                                               ; preds = %27
  store i32 %21, ptr %6, align 4
  br label %26, !llvm.loop !6

29:                                               ; preds = %26
  br label %30

30:                                               ; preds = %29
  store i32 %23, ptr %3, align 4
  br label %24, !llvm.loop !8

31:                                               ; preds = %24
  %32 = load i32, ptr %1, align 4
  ret i32 %32
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 15.0.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
