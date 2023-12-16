; ModuleID = '<stdin>'
source_filename = "spectral-norm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @eval_A(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = add nsw i32 %5, %6
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %4, align 4
  %10 = add nsw i32 %8, %9
  %11 = add nsw i32 %10, 1
  %12 = mul nsw i32 %7, %11
  %13 = sdiv i32 %12, 2
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %13, %14
  %16 = add nsw i32 %15, 1
  %17 = sitofp i32 %16 to double
  %18 = fdiv double 1.000000e+00, %17
  ret double %18
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_A_times_u(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  %9 = load i32, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %9, %10
  %12 = load ptr, ptr %6, align 8
  %13 = load i32, ptr %7, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds double, ptr %12, i64 %14
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %4, align 4
  %18 = icmp slt i32 %16, %17
  %19 = load i32, ptr %7, align 4
  %20 = load i32, ptr %8, align 4
  %21 = load ptr, ptr %5, align 8
  %22 = load i32, ptr %8, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds double, ptr %21, i64 %23
  %25 = load ptr, ptr %6, align 8
  %26 = load i32, ptr %7, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds double, ptr %25, i64 %27
  %29 = load i32, ptr %8, align 4
  %30 = add nsw i32 %29, 1
  %31 = load i32, ptr %7, align 4
  %32 = add nsw i32 %31, 1
  br label %33

33:                                               ; preds = %43, %3
  br i1 %11, label %34, label %44

34:                                               ; preds = %33
  store double 0.000000e+00, ptr %15, align 8
  store i32 0, ptr %8, align 4
  br label %35

35:                                               ; preds = %41, %34
  br i1 %18, label %36, label %42

36:                                               ; preds = %35
  %37 = call double @eval_A(i32 noundef %19, i32 noundef %20)
  %38 = load double, ptr %24, align 8
  %39 = load double, ptr %28, align 8
  %40 = call double @llvm.fmuladd.f64(double %37, double %38, double %39)
  store double %40, ptr %28, align 8
  br label %41

41:                                               ; preds = %36
  store i32 %30, ptr %8, align 4
  br label %35, !llvm.loop !6

42:                                               ; preds = %35
  br label %43

43:                                               ; preds = %42
  store i32 %32, ptr %7, align 4
  br label %33, !llvm.loop !8

44:                                               ; preds = %33
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_At_times_u(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  %9 = load i32, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %9, %10
  %12 = load ptr, ptr %6, align 8
  %13 = load i32, ptr %7, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds double, ptr %12, i64 %14
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %4, align 4
  %18 = icmp slt i32 %16, %17
  %19 = load i32, ptr %8, align 4
  %20 = load i32, ptr %7, align 4
  %21 = load ptr, ptr %5, align 8
  %22 = load i32, ptr %8, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds double, ptr %21, i64 %23
  %25 = load ptr, ptr %6, align 8
  %26 = load i32, ptr %7, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds double, ptr %25, i64 %27
  %29 = load i32, ptr %8, align 4
  %30 = add nsw i32 %29, 1
  %31 = load i32, ptr %7, align 4
  %32 = add nsw i32 %31, 1
  br label %33

33:                                               ; preds = %43, %3
  br i1 %11, label %34, label %44

34:                                               ; preds = %33
  store double 0.000000e+00, ptr %15, align 8
  store i32 0, ptr %8, align 4
  br label %35

35:                                               ; preds = %41, %34
  br i1 %18, label %36, label %42

36:                                               ; preds = %35
  %37 = call double @eval_A(i32 noundef %19, i32 noundef %20)
  %38 = load double, ptr %24, align 8
  %39 = load double, ptr %28, align 8
  %40 = call double @llvm.fmuladd.f64(double %37, double %38, double %39)
  store double %40, ptr %28, align 8
  br label %41

41:                                               ; preds = %36
  store i32 %30, ptr %8, align 4
  br label %35, !llvm.loop !9

42:                                               ; preds = %35
  br label %43

43:                                               ; preds = %42
  store i32 %32, ptr %7, align 4
  br label %33, !llvm.loop !10

44:                                               ; preds = %33
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_AtA_times_u(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load i32, ptr %4, align 4
  %10 = zext i32 %9 to i64
  %11 = call ptr @llvm.stacksave()
  store ptr %11, ptr %7, align 8
  %12 = alloca double, i64 %10, align 16
  store i64 %10, ptr %8, align 8
  %13 = load i32, ptr %4, align 4
  %14 = load ptr, ptr %5, align 8
  call void @eval_A_times_u(i32 noundef %13, ptr noundef %14, ptr noundef %12)
  %15 = load i32, ptr %4, align 4
  %16 = load ptr, ptr %6, align 8
  call void @eval_At_times_u(i32 noundef %15, ptr noundef %12, ptr noundef %16)
  %17 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %17)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %13 = load i32, ptr %4, align 4
  %14 = icmp eq i32 %13, 2
  br i1 %14, label %15, label %20

15:                                               ; preds = %2
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds ptr, ptr %16, i64 1
  %18 = load ptr, ptr %17, align 8
  %19 = call i32 @atoi(ptr noundef %18) #6
  br label %21

20:                                               ; preds = %2
  br label %21

21:                                               ; preds = %20, %15
  %22 = phi i32 [ %19, %15 ], [ 2000, %20 ]
  store i32 %22, ptr %7, align 4
  %23 = load i32, ptr %7, align 4
  %24 = zext i32 %23 to i64
  %25 = call ptr @llvm.stacksave()
  store ptr %25, ptr %8, align 8
  %26 = alloca double, i64 %24, align 16
  store i64 %24, ptr %9, align 8
  %27 = load i32, ptr %7, align 4
  %28 = zext i32 %27 to i64
  %29 = alloca double, i64 %28, align 16
  store i64 %28, ptr %10, align 8
  store i32 0, ptr %6, align 4
  %30 = load i32, ptr %6, align 4
  %31 = load i32, ptr %7, align 4
  %32 = icmp slt i32 %30, %31
  %33 = load i32, ptr %6, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, ptr %26, i64 %34
  %36 = load i32, ptr %6, align 4
  %37 = add nsw i32 %36, 1
  br label %38

38:                                               ; preds = %40, %21
  br i1 %32, label %39, label %41

39:                                               ; preds = %38
  store double 1.000000e+00, ptr %35, align 8
  br label %40

40:                                               ; preds = %39
  store i32 %37, ptr %6, align 4
  br label %38, !llvm.loop !11

41:                                               ; preds = %38
  store i32 0, ptr %6, align 4
  %42 = load i32, ptr %6, align 4
  %43 = icmp slt i32 %42, 10
  %44 = load i32, ptr %7, align 4
  %45 = load i32, ptr %7, align 4
  %46 = load i32, ptr %6, align 4
  %47 = add nsw i32 %46, 1
  br label %48

48:                                               ; preds = %50, %41
  br i1 %43, label %49, label %51

49:                                               ; preds = %48
  call void @eval_AtA_times_u(i32 noundef %44, ptr noundef %26, ptr noundef %29)
  call void @eval_AtA_times_u(i32 noundef %45, ptr noundef %29, ptr noundef %26)
  br label %50

50:                                               ; preds = %49
  store i32 %47, ptr %6, align 4
  br label %48, !llvm.loop !12

51:                                               ; preds = %48
  store double 0.000000e+00, ptr %12, align 8
  store double 0.000000e+00, ptr %11, align 8
  store i32 0, ptr %6, align 4
  %52 = load i32, ptr %6, align 4
  %53 = load i32, ptr %7, align 4
  %54 = icmp slt i32 %52, %53
  %55 = load i32, ptr %6, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, ptr %26, i64 %56
  %58 = load i32, ptr %6, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, ptr %29, i64 %59
  %61 = load double, ptr %11, align 8
  %62 = load i32, ptr %6, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, ptr %29, i64 %63
  %65 = load i32, ptr %6, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds double, ptr %29, i64 %66
  %68 = load double, ptr %12, align 8
  %69 = load i32, ptr %6, align 4
  %70 = add nsw i32 %69, 1
  br label %71

71:                                               ; preds = %79, %51
  br i1 %54, label %72, label %80

72:                                               ; preds = %71
  %73 = load double, ptr %57, align 8
  %74 = load double, ptr %60, align 8
  %75 = call double @llvm.fmuladd.f64(double %73, double %74, double %61)
  store double %75, ptr %11, align 8
  %76 = load double, ptr %64, align 8
  %77 = load double, ptr %67, align 8
  %78 = call double @llvm.fmuladd.f64(double %76, double %77, double %68)
  store double %78, ptr %12, align 8
  br label %79

79:                                               ; preds = %72
  store i32 %70, ptr %6, align 4
  br label %71, !llvm.loop !13

80:                                               ; preds = %71
  %81 = load double, ptr %11, align 8
  %82 = load double, ptr %12, align 8
  %83 = fdiv double %81, %82
  %84 = call double @sqrt(double noundef %83) #7
  %85 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %84)
  store i32 0, ptr %3, align 4
  %86 = load ptr, ptr %8, align 8
  call void @llvm.stackrestore(ptr %86)
  %87 = load i32, ptr %3, align 4
  ret i32 %87
}

; Function Attrs: nounwind readonly willreturn
declare i32 @atoi(ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nounwind
declare double @sqrt(double noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
