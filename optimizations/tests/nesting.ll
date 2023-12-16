; ModuleID = '<stdin>'
source_filename = "nesting.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %3, align 4
  %5 = load i32, ptr %2, align 4
  %6 = icmp slt i32 0, %5
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = add nsw i32 3, %8
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, %10
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = icmp slt i32 %16, %17
  %19 = load i32, ptr %4, align 4
  %20 = mul nsw i32 %19, 3
  %21 = load i32, ptr %3, align 4
  %22 = mul nsw i32 %21, 4
  br label %23

23:                                               ; preds = %33, %1
  br i1 %6, label %24, label %34

24:                                               ; preds = %23
  store i32 %7, ptr %4, align 4
  %25 = call i32 @rand() #2
  %26 = srem i32 %25, 7
  %27 = sub nsw i32 %26, %9
  store i32 %27, ptr %3, align 4
  store i32 %12, ptr %2, align 4
  br i1 %14, label %28, label %29

28:                                               ; preds = %24
  store i32 %15, ptr %3, align 4
  br label %33

29:                                               ; preds = %24
  br label %30

30:                                               ; preds = %31, %29
  br i1 %18, label %31, label %32

31:                                               ; preds = %30
  store i32 %20, ptr %4, align 4
  store i32 %22, ptr %3, align 4
  br label %30, !llvm.loop !6

32:                                               ; preds = %30
  br label %33

33:                                               ; preds = %32, %28
  br label %23, !llvm.loop !8

34:                                               ; preds = %23
  %35 = load i32, ptr %3, align 4
  ret i32 %35
}

; Function Attrs: nounwind
declare i32 @rand() #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

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
