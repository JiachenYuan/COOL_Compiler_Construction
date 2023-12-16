; ModuleID = '<stdin>'
source_filename = "partialsums.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"%.9f\09%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"(2/3)^k\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"k^-0.5\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"1/k(k+1)\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"Flint Hills\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"Cookson Hills\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"Harmonic\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"Riemann Zeta\00", align 1
@.str.8 = private unnamed_addr constant [21 x i8] c"Alternating Harmonic\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"Gregory\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local <2 x double> @make_vec(double noundef %0, double noundef %1) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca <2 x double>, align 16
  %6 = alloca ptr, align 8
  store double %0, ptr %3, align 8
  store double %1, ptr %4, align 8
  store ptr %5, ptr %6, align 8
  %7 = load double, ptr %3, align 8
  %8 = load ptr, ptr %6, align 8
  store double %7, ptr %8, align 8
  %9 = load double, ptr %4, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = getelementptr inbounds double, ptr %10, i64 1
  store double %9, ptr %11, align 8
  %12 = load <2 x double>, ptr %5, align 16
  ret <2 x double> %12
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @sum_vec(<2 x double> noundef %0) #0 {
  %2 = alloca <2 x double>, align 16
  %3 = alloca ptr, align 8
  store <2 x double> %0, ptr %2, align 16
  store ptr %2, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = load double, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds double, ptr %6, i64 1
  %8 = load double, ptr %7, align 8
  %9 = fadd double %5, %8
  ret double %9
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca <2 x double>, align 16
  %11 = alloca <2 x double>, align 16
  %12 = alloca <2 x double>, align 16
  %13 = alloca <2 x double>, align 16
  %14 = alloca <2 x double>, align 16
  %15 = alloca <2 x double>, align 16
  %16 = alloca <2 x double>, align 16
  %17 = alloca <2 x double>, align 16
  %18 = alloca <2 x double>, align 16
  %19 = alloca <2 x double>, align 16
  %20 = alloca <2 x double>, align 16
  %21 = alloca <2 x double>, align 16
  %22 = alloca double, align 8
  %23 = alloca double, align 8
  %24 = alloca double, align 8
  %25 = alloca double, align 8
  %26 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store double 0.000000e+00, ptr %6, align 8
  store double 0.000000e+00, ptr %7, align 8
  store double 0.000000e+00, ptr %8, align 8
  store double 0.000000e+00, ptr %9, align 8
  store i32 2500000, ptr %26, align 4
  %27 = call <2 x double> @make_vec(double noundef 0.000000e+00, double noundef 0.000000e+00)
  store <2 x double> %27, ptr %15, align 16
  %28 = call <2 x double> @make_vec(double noundef 1.000000e+00, double noundef 1.000000e+00)
  store <2 x double> %28, ptr %16, align 16
  %29 = call <2 x double> @make_vec(double noundef 2.000000e+00, double noundef 2.000000e+00)
  store <2 x double> %29, ptr %17, align 16
  %30 = call <2 x double> @make_vec(double noundef -1.000000e+00, double noundef -1.000000e+00)
  store <2 x double> %30, ptr %19, align 16
  %31 = call <2 x double> @make_vec(double noundef 1.000000e+00, double noundef 2.000000e+00)
  store <2 x double> %31, ptr %18, align 16
  %32 = call <2 x double> @make_vec(double noundef 1.000000e+00, double noundef -1.000000e+00)
  store <2 x double> %32, ptr %21, align 16
  %33 = load <2 x double>, ptr %15, align 16
  store <2 x double> %33, ptr %14, align 16
  store <2 x double> %33, ptr %13, align 16
  store <2 x double> %33, ptr %12, align 16
  store <2 x double> %33, ptr %11, align 16
  store <2 x double> %33, ptr %10, align 16
  store double 1.000000e+00, ptr %22, align 8
  %34 = load double, ptr %22, align 8
  %35 = load i32, ptr %26, align 4
  %36 = sitofp i32 %35 to double
  %37 = fcmp ole double %34, %36
  %38 = load double, ptr %22, align 8
  %39 = fsub double %38, 1.000000e+00
  %40 = load double, ptr %6, align 8
  %41 = load double, ptr %22, align 8
  %42 = load double, ptr %7, align 8
  %43 = load double, ptr %22, align 8
  %44 = load double, ptr %22, align 8
  %45 = fmul double %43, %44
  %46 = load double, ptr %22, align 8
  %47 = fmul double %45, %46
  %48 = load double, ptr %22, align 8
  %49 = load double, ptr %22, align 8
  %50 = load double, ptr %23, align 8
  %51 = load double, ptr %24, align 8
  %52 = fmul double %50, %51
  %53 = load double, ptr %24, align 8
  %54 = fmul double %52, %53
  %55 = fdiv double 1.000000e+00, %54
  %56 = load double, ptr %8, align 8
  %57 = fadd double %56, %55
  %58 = load double, ptr %23, align 8
  %59 = load double, ptr %25, align 8
  %60 = fmul double %58, %59
  %61 = load double, ptr %25, align 8
  %62 = fmul double %60, %61
  %63 = fdiv double 1.000000e+00, %62
  %64 = load double, ptr %9, align 8
  %65 = fadd double %64, %63
  %66 = load double, ptr %22, align 8
  %67 = fadd double %66, 1.000000e+00
  br label %68

68:                                               ; preds = %77, %2
  br i1 %37, label %69, label %78

69:                                               ; preds = %68
  %70 = call double @pow(double noundef 0x3FE5555555555555, double noundef %39) #4
  %71 = fadd double %40, %70
  store double %71, ptr %6, align 8
  %72 = call double @sqrt(double noundef %41) #4
  %73 = fdiv double 1.000000e+00, %72
  %74 = fadd double %42, %73
  store double %74, ptr %7, align 8
  store double %47, ptr %23, align 8
  %75 = call double @sin(double noundef %48) #4
  store double %75, ptr %24, align 8
  %76 = call double @cos(double noundef %49) #4
  store double %76, ptr %25, align 8
  store double %57, ptr %8, align 8
  store double %65, ptr %9, align 8
  br label %77

77:                                               ; preds = %69
  store double %67, ptr %22, align 8
  br label %68, !llvm.loop !6

78:                                               ; preds = %68
  %79 = load <2 x double>, ptr %18, align 16
  store <2 x double> %79, ptr %20, align 16
  %80 = load double, ptr %20, align 16
  %81 = load i32, ptr %26, align 4
  %82 = sitofp i32 %81 to double
  %83 = fcmp ole double %80, %82
  %84 = load <2 x double>, ptr %16, align 16
  %85 = load <2 x double>, ptr %20, align 16
  %86 = load <2 x double>, ptr %20, align 16
  %87 = load <2 x double>, ptr %16, align 16
  %88 = fadd <2 x double> %86, %87
  %89 = fmul <2 x double> %85, %88
  %90 = fdiv <2 x double> %84, %89
  %91 = load <2 x double>, ptr %12, align 16
  %92 = fadd <2 x double> %91, %90
  %93 = load <2 x double>, ptr %16, align 16
  %94 = load <2 x double>, ptr %20, align 16
  %95 = fdiv <2 x double> %93, %94
  %96 = load <2 x double>, ptr %10, align 16
  %97 = fadd <2 x double> %96, %95
  %98 = load <2 x double>, ptr %16, align 16
  %99 = load <2 x double>, ptr %20, align 16
  %100 = load <2 x double>, ptr %20, align 16
  %101 = fmul <2 x double> %99, %100
  %102 = fdiv <2 x double> %98, %101
  %103 = load <2 x double>, ptr %11, align 16
  %104 = fadd <2 x double> %103, %102
  %105 = load <2 x double>, ptr %21, align 16
  %106 = load <2 x double>, ptr %20, align 16
  %107 = fdiv <2 x double> %105, %106
  %108 = load <2 x double>, ptr %13, align 16
  %109 = fadd <2 x double> %108, %107
  %110 = load <2 x double>, ptr %21, align 16
  %111 = load <2 x double>, ptr %17, align 16
  %112 = load <2 x double>, ptr %20, align 16
  %113 = load <2 x double>, ptr %16, align 16
  %114 = fneg <2 x double> %113
  %115 = load <2 x double>, ptr %14, align 16
  %116 = load <2 x double>, ptr %17, align 16
  %117 = load <2 x double>, ptr %20, align 16
  %118 = fadd <2 x double> %117, %116
  br label %119

119:                                              ; preds = %124, %78
  br i1 %83, label %120, label %125

120:                                              ; preds = %119
  store <2 x double> %92, ptr %12, align 16
  store <2 x double> %97, ptr %10, align 16
  store <2 x double> %104, ptr %11, align 16
  store <2 x double> %109, ptr %13, align 16
  %121 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %111, <2 x double> %112, <2 x double> %114)
  %122 = fdiv <2 x double> %110, %121
  %123 = fadd <2 x double> %115, %122
  store <2 x double> %123, ptr %14, align 16
  br label %124

124:                                              ; preds = %120
  store <2 x double> %118, ptr %20, align 16
  br label %119, !llvm.loop !8

125:                                              ; preds = %119
  %126 = load double, ptr %6, align 8
  %127 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %126, ptr noundef @.str.1)
  %128 = load double, ptr %7, align 8
  %129 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %128, ptr noundef @.str.2)
  %130 = load <2 x double>, ptr %12, align 16
  %131 = call double @sum_vec(<2 x double> noundef %130)
  %132 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %131, ptr noundef @.str.3)
  %133 = load double, ptr %8, align 8
  %134 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %133, ptr noundef @.str.4)
  %135 = load double, ptr %9, align 8
  %136 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %135, ptr noundef @.str.5)
  %137 = load <2 x double>, ptr %10, align 16
  %138 = call double @sum_vec(<2 x double> noundef %137)
  %139 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %138, ptr noundef @.str.6)
  %140 = load <2 x double>, ptr %11, align 16
  %141 = call double @sum_vec(<2 x double> noundef %140)
  %142 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %141, ptr noundef @.str.7)
  %143 = load <2 x double>, ptr %13, align 16
  %144 = call double @sum_vec(<2 x double> noundef %143)
  %145 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %144, ptr noundef @.str.8)
  %146 = load <2 x double>, ptr %14, align 16
  %147 = call double @sum_vec(<2 x double> noundef %146)
  %148 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %147, ptr noundef @.str.9)
  ret i32 0
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #1

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: nounwind
declare double @sin(double noundef) #1

; Function Attrs: nounwind
declare double @cos(double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <2 x double> @llvm.fmuladd.v2f64(<2 x double>, <2 x double>, <2 x double>) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
