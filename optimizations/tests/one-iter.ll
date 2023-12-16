; ModuleID = '<stdin>'
source_filename = "one-iter.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %3, align 4
  %5 = load i32, ptr %3, align 4
  %6 = add nsw i32 %5, 1
  %7 = load i32, ptr %4, align 4
  %8 = add nsw i32 1, %7
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %13, 2
  br label %15

15:                                               ; preds = %22, %1
  store i32 %6, ptr %4, align 4
  %16 = call i32 @rand() #2
  %17 = srem i32 %16, 4
  %18 = sub nsw i32 %17, %8
  %19 = add nsw i32 %18, %9
  store i32 %19, ptr %3, align 4
  br i1 %11, label %20, label %21

20:                                               ; preds = %15
  store i32 %12, ptr %3, align 4
  br label %21

21:                                               ; preds = %20, %15
  br label %22

22:                                               ; preds = %21
  br i1 %14, label %15, label %23, !llvm.loop !6

23:                                               ; preds = %22
  %24 = load i32, ptr %3, align 4
  ret i32 %24
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
