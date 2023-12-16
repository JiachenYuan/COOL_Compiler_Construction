; ModuleID = '<stdin>'
source_filename = "test_store_hoist.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 10, ptr %2, align 4
  store i32 192, ptr %6, align 4
  store i32 1, ptr %7, align 4
  %11 = load i32, ptr %2, align 4
  store i32 %11, ptr %8, align 4
  %12 = load i32, ptr %2, align 4
  %13 = load ptr, ptr %3, align 8
  %14 = load i32, ptr %6, align 4
  %15 = load ptr, ptr %4, align 8
  %16 = load i32, ptr %6, align 4
  %17 = load ptr, ptr %5, align 8
  %18 = load i32, ptr %10, align 4
  %19 = add nsw i32 %18, 1
  %20 = load i32, ptr %10, align 4
  %21 = icmp slt i32 %20, 10
  %22 = load i32, ptr %2, align 4
  %23 = icmp slt i32 0, %22
  br label %24

24:                                               ; preds = %28, %0
  store i32 %12, ptr %13, align 4
  store i32 %14, ptr %15, align 4
  store i32 1, ptr %10, align 4
  store i32 %16, ptr %17, align 4
  br label %25

25:                                               ; preds = %26, %24
  store i32 %19, ptr %10, align 4
  br label %26

26:                                               ; preds = %25
  br i1 %21, label %25, label %27, !llvm.loop !6

27:                                               ; preds = %26
  br label %28

28:                                               ; preds = %27
  br i1 %23, label %24, label %29, !llvm.loop !8

29:                                               ; preds = %28
  %30 = load i32, ptr %7, align 4
  ret i32 %30
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
