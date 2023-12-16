; ModuleID = '<stdin>'
source_filename = "random.c"
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
  %9 = add nsw i32 1, %8
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, %10
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = load i32, ptr %4, align 4
  br label %16

16:                                               ; preds = %22, %1
  br i1 %6, label %17, label %23

17:                                               ; preds = %16
  store i32 %7, ptr %4, align 4
  %18 = call i32 @rand() #2
  %19 = srem i32 %18, 4
  %20 = sub nsw i32 %19, %9
  store i32 %20, ptr %3, align 4
  store i32 %12, ptr %2, align 4
  br i1 %14, label %21, label %22

21:                                               ; preds = %17
  store i32 %15, ptr %3, align 4
  br label %22

22:                                               ; preds = %21, %17
  br label %16, !llvm.loop !6

23:                                               ; preds = %16
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
