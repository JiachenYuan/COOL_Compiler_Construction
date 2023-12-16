; ModuleID = '<stdin>'
source_filename = "doloop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0, ptr noalias noundef %1, ptr noalias noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 1, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  store i32 %10, ptr %8, align 4
  %11 = load i32, ptr %7, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = load i32, ptr %8, align 4
  %14 = load ptr, ptr %5, align 8
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr %8, align 4
  %17 = sdiv i32 %16, -3
  %18 = load i32, ptr %9, align 4
  %19 = add nsw i32 1, %18
  %20 = sub nsw i32 %17, %19
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %22, %21
  %24 = load i32, ptr %9, align 4
  %25 = icmp sgt i32 %24, 0
  %26 = load i32, ptr %9, align 4
  %27 = load i32, ptr %8, align 4
  %28 = load ptr, ptr %6, align 8
  %29 = load i32, ptr %4, align 4
  %30 = icmp slt i32 0, %29
  br label %31

31:                                               ; preds = %36, %3
  br i1 %12, label %32, label %33

32:                                               ; preds = %31
  store i32 %13, ptr %14, align 4
  br label %33

33:                                               ; preds = %32, %31
  store i32 %15, ptr %9, align 4
  store i32 %20, ptr %7, align 4
  store i32 %23, ptr %4, align 4
  br i1 %25, label %34, label %35

34:                                               ; preds = %33
  store i32 %26, ptr %7, align 4
  br label %35

35:                                               ; preds = %34, %33
  store i32 %27, ptr %28, align 4
  br label %36

36:                                               ; preds = %35
  br i1 %30, label %31, label %37, !llvm.loop !6

37:                                               ; preds = %36
  %38 = load i32, ptr %7, align 4
  ret i32 %38
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
