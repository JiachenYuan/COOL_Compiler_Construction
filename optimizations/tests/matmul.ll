; ModuleID = '<stdin>'
source_filename = "matmul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @matmul(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  %16 = load i32, ptr %7, align 4
  %17 = zext i32 %16 to i64
  %18 = load i32, ptr %8, align 4
  %19 = zext i32 %18 to i64
  %20 = load i32, ptr %8, align 4
  %21 = zext i32 %20 to i64
  %22 = load i32, ptr %9, align 4
  %23 = zext i32 %22 to i64
  %24 = load i32, ptr %7, align 4
  %25 = zext i32 %24 to i64
  %26 = load i32, ptr %9, align 4
  %27 = zext i32 %26 to i64
  store i32 0, ptr %13, align 4
  %28 = load i32, ptr %13, align 4
  %29 = load i32, ptr %7, align 4
  %30 = icmp slt i32 %28, %29
  %31 = load i32, ptr %14, align 4
  %32 = load i32, ptr %9, align 4
  %33 = icmp slt i32 %31, %32
  %34 = load ptr, ptr %12, align 8
  %35 = load i32, ptr %13, align 4
  %36 = sext i32 %35 to i64
  %37 = mul nsw i64 %36, %27
  %38 = getelementptr inbounds i32, ptr %34, i64 %37
  %39 = load i32, ptr %14, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr %38, i64 %40
  %42 = load i32, ptr %15, align 4
  %43 = load i32, ptr %8, align 4
  %44 = icmp slt i32 %42, %43
  %45 = load ptr, ptr %10, align 8
  %46 = load i32, ptr %13, align 4
  %47 = sext i32 %46 to i64
  %48 = mul nsw i64 %47, %19
  %49 = getelementptr inbounds i32, ptr %45, i64 %48
  %50 = load i32, ptr %15, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, ptr %49, i64 %51
  %53 = load ptr, ptr %11, align 8
  %54 = load i32, ptr %15, align 4
  %55 = sext i32 %54 to i64
  %56 = mul nsw i64 %55, %23
  %57 = getelementptr inbounds i32, ptr %53, i64 %56
  %58 = load i32, ptr %14, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %57, i64 %59
  %61 = load ptr, ptr %12, align 8
  %62 = load i32, ptr %13, align 4
  %63 = sext i32 %62 to i64
  %64 = mul nsw i64 %63, %27
  %65 = getelementptr inbounds i32, ptr %61, i64 %64
  %66 = load i32, ptr %14, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, ptr %65, i64 %67
  %69 = load i32, ptr %15, align 4
  %70 = add nsw i32 %69, 1
  %71 = load i32, ptr %14, align 4
  %72 = add nsw i32 %71, 1
  %73 = load i32, ptr %13, align 4
  %74 = add nsw i32 %73, 1
  br label %75

75:                                               ; preds = %90, %6
  br i1 %30, label %76, label %91

76:                                               ; preds = %75
  store i32 0, ptr %14, align 4
  br label %77

77:                                               ; preds = %88, %76
  br i1 %33, label %78, label %89

78:                                               ; preds = %77
  store i32 0, ptr %41, align 4
  store i32 0, ptr %15, align 4
  br label %79

79:                                               ; preds = %86, %78
  br i1 %44, label %80, label %87

80:                                               ; preds = %79
  %81 = load i32, ptr %52, align 4
  %82 = load i32, ptr %60, align 4
  %83 = mul nsw i32 %81, %82
  %84 = load i32, ptr %68, align 4
  %85 = add nsw i32 %84, %83
  store i32 %85, ptr %68, align 4
  br label %86

86:                                               ; preds = %80
  store i32 %70, ptr %15, align 4
  br label %79, !llvm.loop !6

87:                                               ; preds = %79
  br label %88

88:                                               ; preds = %87
  store i32 %72, ptr %14, align 4
  br label %77, !llvm.loop !8

89:                                               ; preds = %77
  br label %90

90:                                               ; preds = %89
  store i32 %74, ptr %13, align 4
  br label %75, !llvm.loop !9

91:                                               ; preds = %75
  ret void
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
!9 = distinct !{!9, !7}
