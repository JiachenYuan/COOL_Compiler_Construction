; ModuleID = '<stdin>'
source_filename = "n-body.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies = dso_local global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @advance(i32 noundef %0, ptr noundef %1, double noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca double, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store double %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  %17 = load i32, ptr %7, align 4
  %18 = load i32, ptr %4, align 4
  %19 = icmp slt i32 %17, %18
  %20 = load ptr, ptr %5, align 8
  %21 = load i32, ptr %7, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.planet, ptr %20, i64 %22
  %24 = load i32, ptr %7, align 4
  %25 = add nsw i32 %24, 1
  %26 = load i32, ptr %8, align 4
  %27 = load i32, ptr %4, align 4
  %28 = icmp slt i32 %26, %27
  %29 = load ptr, ptr %5, align 8
  %30 = load i32, ptr %8, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds %struct.planet, ptr %29, i64 %31
  %33 = load ptr, ptr %9, align 8
  %34 = getelementptr inbounds %struct.planet, ptr %33, i32 0, i32 0
  %35 = load ptr, ptr %10, align 8
  %36 = getelementptr inbounds %struct.planet, ptr %35, i32 0, i32 0
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr inbounds %struct.planet, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %10, align 8
  %40 = getelementptr inbounds %struct.planet, ptr %39, i32 0, i32 1
  %41 = load ptr, ptr %9, align 8
  %42 = getelementptr inbounds %struct.planet, ptr %41, i32 0, i32 2
  %43 = load ptr, ptr %10, align 8
  %44 = getelementptr inbounds %struct.planet, ptr %43, i32 0, i32 2
  %45 = load double, ptr %11, align 8
  %46 = load double, ptr %11, align 8
  %47 = load double, ptr %12, align 8
  %48 = load double, ptr %12, align 8
  %49 = fmul double %47, %48
  %50 = load double, ptr %13, align 8
  %51 = load double, ptr %13, align 8
  %52 = load double, ptr %6, align 8
  %53 = load double, ptr %14, align 8
  %54 = load double, ptr %14, align 8
  %55 = fmul double %53, %54
  %56 = load double, ptr %14, align 8
  %57 = fmul double %55, %56
  %58 = fdiv double %52, %57
  %59 = load double, ptr %11, align 8
  %60 = load ptr, ptr %10, align 8
  %61 = getelementptr inbounds %struct.planet, ptr %60, i32 0, i32 6
  %62 = load double, ptr %15, align 8
  %63 = load ptr, ptr %9, align 8
  %64 = getelementptr inbounds %struct.planet, ptr %63, i32 0, i32 3
  %65 = load double, ptr %12, align 8
  %66 = load ptr, ptr %10, align 8
  %67 = getelementptr inbounds %struct.planet, ptr %66, i32 0, i32 6
  %68 = load double, ptr %15, align 8
  %69 = load ptr, ptr %9, align 8
  %70 = getelementptr inbounds %struct.planet, ptr %69, i32 0, i32 4
  %71 = load double, ptr %13, align 8
  %72 = load ptr, ptr %10, align 8
  %73 = getelementptr inbounds %struct.planet, ptr %72, i32 0, i32 6
  %74 = load double, ptr %15, align 8
  %75 = load ptr, ptr %9, align 8
  %76 = getelementptr inbounds %struct.planet, ptr %75, i32 0, i32 5
  %77 = load double, ptr %11, align 8
  %78 = load ptr, ptr %9, align 8
  %79 = getelementptr inbounds %struct.planet, ptr %78, i32 0, i32 6
  %80 = load double, ptr %15, align 8
  %81 = load ptr, ptr %10, align 8
  %82 = getelementptr inbounds %struct.planet, ptr %81, i32 0, i32 3
  %83 = load double, ptr %12, align 8
  %84 = load ptr, ptr %9, align 8
  %85 = getelementptr inbounds %struct.planet, ptr %84, i32 0, i32 6
  %86 = load double, ptr %15, align 8
  %87 = load ptr, ptr %10, align 8
  %88 = getelementptr inbounds %struct.planet, ptr %87, i32 0, i32 4
  %89 = load double, ptr %13, align 8
  %90 = load ptr, ptr %9, align 8
  %91 = getelementptr inbounds %struct.planet, ptr %90, i32 0, i32 6
  %92 = load double, ptr %15, align 8
  %93 = load ptr, ptr %10, align 8
  %94 = getelementptr inbounds %struct.planet, ptr %93, i32 0, i32 5
  %95 = load i32, ptr %8, align 4
  %96 = add nsw i32 %95, 1
  %97 = load i32, ptr %7, align 4
  %98 = add nsw i32 %97, 1
  br label %99

99:                                               ; preds = %144, %3
  br i1 %19, label %100, label %145

100:                                              ; preds = %99
  store ptr %23, ptr %9, align 8
  store i32 %25, ptr %8, align 4
  br label %101

101:                                              ; preds = %142, %100
  br i1 %28, label %102, label %143

102:                                              ; preds = %101
  store ptr %32, ptr %10, align 8
  %103 = load double, ptr %34, align 8
  %104 = load double, ptr %36, align 8
  %105 = fsub double %103, %104
  store double %105, ptr %11, align 8
  %106 = load double, ptr %38, align 8
  %107 = load double, ptr %40, align 8
  %108 = fsub double %106, %107
  store double %108, ptr %12, align 8
  %109 = load double, ptr %42, align 8
  %110 = load double, ptr %44, align 8
  %111 = fsub double %109, %110
  store double %111, ptr %13, align 8
  %112 = call double @llvm.fmuladd.f64(double %45, double %46, double %49)
  %113 = call double @llvm.fmuladd.f64(double %50, double %51, double %112)
  %114 = call double @sqrt(double noundef %113) #4
  store double %114, ptr %14, align 8
  store double %58, ptr %15, align 8
  %115 = load double, ptr %61, align 8
  %116 = fmul double %59, %115
  %117 = load double, ptr %64, align 8
  %118 = fneg double %116
  %119 = call double @llvm.fmuladd.f64(double %118, double %62, double %117)
  store double %119, ptr %64, align 8
  %120 = load double, ptr %67, align 8
  %121 = fmul double %65, %120
  %122 = load double, ptr %70, align 8
  %123 = fneg double %121
  %124 = call double @llvm.fmuladd.f64(double %123, double %68, double %122)
  store double %124, ptr %70, align 8
  %125 = load double, ptr %73, align 8
  %126 = fmul double %71, %125
  %127 = load double, ptr %76, align 8
  %128 = fneg double %126
  %129 = call double @llvm.fmuladd.f64(double %128, double %74, double %127)
  store double %129, ptr %76, align 8
  %130 = load double, ptr %79, align 8
  %131 = fmul double %77, %130
  %132 = load double, ptr %82, align 8
  %133 = call double @llvm.fmuladd.f64(double %131, double %80, double %132)
  store double %133, ptr %82, align 8
  %134 = load double, ptr %85, align 8
  %135 = fmul double %83, %134
  %136 = load double, ptr %88, align 8
  %137 = call double @llvm.fmuladd.f64(double %135, double %86, double %136)
  store double %137, ptr %88, align 8
  %138 = load double, ptr %91, align 8
  %139 = fmul double %89, %138
  %140 = load double, ptr %94, align 8
  %141 = call double @llvm.fmuladd.f64(double %139, double %92, double %140)
  store double %141, ptr %94, align 8
  br label %142

142:                                              ; preds = %102
  store i32 %96, ptr %8, align 4
  br label %101, !llvm.loop !6

143:                                              ; preds = %101
  br label %144

144:                                              ; preds = %143
  store i32 %98, ptr %7, align 4
  br label %99, !llvm.loop !8

145:                                              ; preds = %99
  store i32 0, ptr %7, align 4
  %146 = load i32, ptr %7, align 4
  %147 = load i32, ptr %4, align 4
  %148 = icmp slt i32 %146, %147
  %149 = load ptr, ptr %5, align 8
  %150 = load i32, ptr %7, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds %struct.planet, ptr %149, i64 %151
  %153 = load double, ptr %6, align 8
  %154 = load ptr, ptr %16, align 8
  %155 = getelementptr inbounds %struct.planet, ptr %154, i32 0, i32 3
  %156 = load ptr, ptr %16, align 8
  %157 = getelementptr inbounds %struct.planet, ptr %156, i32 0, i32 0
  %158 = load double, ptr %6, align 8
  %159 = load ptr, ptr %16, align 8
  %160 = getelementptr inbounds %struct.planet, ptr %159, i32 0, i32 4
  %161 = load ptr, ptr %16, align 8
  %162 = getelementptr inbounds %struct.planet, ptr %161, i32 0, i32 1
  %163 = load double, ptr %6, align 8
  %164 = load ptr, ptr %16, align 8
  %165 = getelementptr inbounds %struct.planet, ptr %164, i32 0, i32 5
  %166 = load ptr, ptr %16, align 8
  %167 = getelementptr inbounds %struct.planet, ptr %166, i32 0, i32 2
  %168 = load i32, ptr %7, align 4
  %169 = add nsw i32 %168, 1
  br label %170

170:                                              ; preds = %181, %145
  br i1 %148, label %171, label %182

171:                                              ; preds = %170
  store ptr %152, ptr %16, align 8
  %172 = load double, ptr %155, align 8
  %173 = load double, ptr %157, align 8
  %174 = call double @llvm.fmuladd.f64(double %153, double %172, double %173)
  store double %174, ptr %157, align 8
  %175 = load double, ptr %160, align 8
  %176 = load double, ptr %162, align 8
  %177 = call double @llvm.fmuladd.f64(double %158, double %175, double %176)
  store double %177, ptr %162, align 8
  %178 = load double, ptr %165, align 8
  %179 = load double, ptr %167, align 8
  %180 = call double @llvm.fmuladd.f64(double %163, double %178, double %179)
  store double %180, ptr %167, align 8
  br label %181

181:                                              ; preds = %171
  store i32 %169, ptr %7, align 4
  br label %170, !llvm.loop !9

182:                                              ; preds = %170
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @energy(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store double 0.000000e+00, ptr %5, align 8
  store i32 0, ptr %6, align 4
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %3, align 4
  %16 = icmp slt i32 %14, %15
  %17 = load ptr, ptr %4, align 8
  %18 = load i32, ptr %6, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %struct.planet, ptr %17, i64 %19
  %21 = load ptr, ptr %8, align 8
  %22 = getelementptr inbounds %struct.planet, ptr %21, i32 0, i32 6
  %23 = load ptr, ptr %8, align 8
  %24 = getelementptr inbounds %struct.planet, ptr %23, i32 0, i32 3
  %25 = load ptr, ptr %8, align 8
  %26 = getelementptr inbounds %struct.planet, ptr %25, i32 0, i32 3
  %27 = load ptr, ptr %8, align 8
  %28 = getelementptr inbounds %struct.planet, ptr %27, i32 0, i32 4
  %29 = load ptr, ptr %8, align 8
  %30 = getelementptr inbounds %struct.planet, ptr %29, i32 0, i32 4
  %31 = load ptr, ptr %8, align 8
  %32 = getelementptr inbounds %struct.planet, ptr %31, i32 0, i32 5
  %33 = load ptr, ptr %8, align 8
  %34 = getelementptr inbounds %struct.planet, ptr %33, i32 0, i32 5
  %35 = load double, ptr %5, align 8
  %36 = load i32, ptr %6, align 4
  %37 = add nsw i32 %36, 1
  %38 = load i32, ptr %7, align 4
  %39 = load i32, ptr %3, align 4
  %40 = icmp slt i32 %38, %39
  %41 = load ptr, ptr %4, align 8
  %42 = load i32, ptr %7, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds %struct.planet, ptr %41, i64 %43
  %45 = load ptr, ptr %8, align 8
  %46 = getelementptr inbounds %struct.planet, ptr %45, i32 0, i32 0
  %47 = load ptr, ptr %9, align 8
  %48 = getelementptr inbounds %struct.planet, ptr %47, i32 0, i32 0
  %49 = load ptr, ptr %8, align 8
  %50 = getelementptr inbounds %struct.planet, ptr %49, i32 0, i32 1
  %51 = load ptr, ptr %9, align 8
  %52 = getelementptr inbounds %struct.planet, ptr %51, i32 0, i32 1
  %53 = load ptr, ptr %8, align 8
  %54 = getelementptr inbounds %struct.planet, ptr %53, i32 0, i32 2
  %55 = load ptr, ptr %9, align 8
  %56 = getelementptr inbounds %struct.planet, ptr %55, i32 0, i32 2
  %57 = load double, ptr %10, align 8
  %58 = load double, ptr %10, align 8
  %59 = load double, ptr %11, align 8
  %60 = load double, ptr %11, align 8
  %61 = fmul double %59, %60
  %62 = load double, ptr %12, align 8
  %63 = load double, ptr %12, align 8
  %64 = load ptr, ptr %8, align 8
  %65 = getelementptr inbounds %struct.planet, ptr %64, i32 0, i32 6
  %66 = load ptr, ptr %9, align 8
  %67 = getelementptr inbounds %struct.planet, ptr %66, i32 0, i32 6
  %68 = load double, ptr %13, align 8
  %69 = load double, ptr %5, align 8
  %70 = load i32, ptr %7, align 4
  %71 = add nsw i32 %70, 1
  %72 = load i32, ptr %6, align 4
  %73 = add nsw i32 %72, 1
  br label %74

74:                                               ; preds = %109, %2
  br i1 %16, label %75, label %110

75:                                               ; preds = %74
  store ptr %20, ptr %8, align 8
  %76 = load double, ptr %22, align 8
  %77 = fmul double 5.000000e-01, %76
  %78 = load double, ptr %24, align 8
  %79 = load double, ptr %26, align 8
  %80 = load double, ptr %28, align 8
  %81 = load double, ptr %30, align 8
  %82 = fmul double %80, %81
  %83 = call double @llvm.fmuladd.f64(double %78, double %79, double %82)
  %84 = load double, ptr %32, align 8
  %85 = load double, ptr %34, align 8
  %86 = call double @llvm.fmuladd.f64(double %84, double %85, double %83)
  %87 = call double @llvm.fmuladd.f64(double %77, double %86, double %35)
  store double %87, ptr %5, align 8
  store i32 %37, ptr %7, align 4
  br label %88

88:                                               ; preds = %107, %75
  br i1 %40, label %89, label %108

89:                                               ; preds = %88
  store ptr %44, ptr %9, align 8
  %90 = load double, ptr %46, align 8
  %91 = load double, ptr %48, align 8
  %92 = fsub double %90, %91
  store double %92, ptr %10, align 8
  %93 = load double, ptr %50, align 8
  %94 = load double, ptr %52, align 8
  %95 = fsub double %93, %94
  store double %95, ptr %11, align 8
  %96 = load double, ptr %54, align 8
  %97 = load double, ptr %56, align 8
  %98 = fsub double %96, %97
  store double %98, ptr %12, align 8
  %99 = call double @llvm.fmuladd.f64(double %57, double %58, double %61)
  %100 = call double @llvm.fmuladd.f64(double %62, double %63, double %99)
  %101 = call double @sqrt(double noundef %100) #4
  store double %101, ptr %13, align 8
  %102 = load double, ptr %65, align 8
  %103 = load double, ptr %67, align 8
  %104 = fmul double %102, %103
  %105 = fdiv double %104, %68
  %106 = fsub double %69, %105
  store double %106, ptr %5, align 8
  br label %107

107:                                              ; preds = %89
  store i32 %71, ptr %7, align 4
  br label %88, !llvm.loop !10

108:                                              ; preds = %88
  br label %109

109:                                              ; preds = %108
  store i32 %73, ptr %6, align 4
  br label %74, !llvm.loop !11

110:                                              ; preds = %74
  %111 = load double, ptr %5, align 8
  ret double %111
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @offset_momentum(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store double 0.000000e+00, ptr %5, align 8
  store double 0.000000e+00, ptr %6, align 8
  store double 0.000000e+00, ptr %7, align 8
  store i32 0, ptr %8, align 4
  %9 = load i32, ptr %8, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %9, %10
  %12 = load ptr, ptr %4, align 8
  %13 = load i32, ptr %8, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.planet, ptr %12, i64 %14
  %16 = getelementptr inbounds %struct.planet, ptr %15, i32 0, i32 3
  %17 = load ptr, ptr %4, align 8
  %18 = load i32, ptr %8, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %struct.planet, ptr %17, i64 %19
  %21 = getelementptr inbounds %struct.planet, ptr %20, i32 0, i32 6
  %22 = load double, ptr %5, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = load i32, ptr %8, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.planet, ptr %23, i64 %25
  %27 = getelementptr inbounds %struct.planet, ptr %26, i32 0, i32 4
  %28 = load ptr, ptr %4, align 8
  %29 = load i32, ptr %8, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.planet, ptr %28, i64 %30
  %32 = getelementptr inbounds %struct.planet, ptr %31, i32 0, i32 6
  %33 = load double, ptr %6, align 8
  %34 = load ptr, ptr %4, align 8
  %35 = load i32, ptr %8, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds %struct.planet, ptr %34, i64 %36
  %38 = getelementptr inbounds %struct.planet, ptr %37, i32 0, i32 5
  %39 = load ptr, ptr %4, align 8
  %40 = load i32, ptr %8, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds %struct.planet, ptr %39, i64 %41
  %43 = getelementptr inbounds %struct.planet, ptr %42, i32 0, i32 6
  %44 = load double, ptr %7, align 8
  %45 = load i32, ptr %8, align 4
  %46 = add nsw i32 %45, 1
  br label %47

47:                                               ; preds = %58, %2
  br i1 %11, label %48, label %59

48:                                               ; preds = %47
  %49 = load double, ptr %16, align 8
  %50 = load double, ptr %21, align 8
  %51 = call double @llvm.fmuladd.f64(double %49, double %50, double %22)
  store double %51, ptr %5, align 8
  %52 = load double, ptr %27, align 8
  %53 = load double, ptr %32, align 8
  %54 = call double @llvm.fmuladd.f64(double %52, double %53, double %33)
  store double %54, ptr %6, align 8
  %55 = load double, ptr %38, align 8
  %56 = load double, ptr %43, align 8
  %57 = call double @llvm.fmuladd.f64(double %55, double %56, double %44)
  store double %57, ptr %7, align 8
  br label %58

58:                                               ; preds = %48
  store i32 %46, ptr %8, align 4
  br label %47, !llvm.loop !12

59:                                               ; preds = %47
  %60 = load double, ptr %5, align 8
  %61 = fneg double %60
  %62 = fdiv double %61, 0x4043BD3CC9BE45DE
  %63 = load ptr, ptr %4, align 8
  %64 = getelementptr inbounds %struct.planet, ptr %63, i64 0
  %65 = getelementptr inbounds %struct.planet, ptr %64, i32 0, i32 3
  store double %62, ptr %65, align 8
  %66 = load double, ptr %6, align 8
  %67 = fneg double %66
  %68 = fdiv double %67, 0x4043BD3CC9BE45DE
  %69 = load ptr, ptr %4, align 8
  %70 = getelementptr inbounds %struct.planet, ptr %69, i64 0
  %71 = getelementptr inbounds %struct.planet, ptr %70, i32 0, i32 4
  store double %68, ptr %71, align 8
  %72 = load double, ptr %7, align 8
  %73 = fneg double %72
  %74 = fdiv double %73, 0x4043BD3CC9BE45DE
  %75 = load ptr, ptr %4, align 8
  %76 = getelementptr inbounds %struct.planet, ptr %75, i64 0
  %77 = getelementptr inbounds %struct.planet, ptr %76, i32 0, i32 5
  store double %74, ptr %77, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 5000000, ptr %6, align 4
  call void @offset_momentum(i32 noundef 5, ptr noundef @bodies)
  %8 = call double @energy(i32 noundef 5, ptr noundef @bodies)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %8)
  store i32 1, ptr %7, align 4
  %10 = load i32, ptr %7, align 4
  %11 = load i32, ptr %6, align 4
  %12 = icmp sle i32 %10, %11
  %13 = load i32, ptr %7, align 4
  %14 = add nsw i32 %13, 1
  br label %15

15:                                               ; preds = %17, %2
  br i1 %12, label %16, label %18

16:                                               ; preds = %15
  call void @advance(i32 noundef 5, ptr noundef @bodies, double noundef 1.000000e-02)
  br label %17

17:                                               ; preds = %16
  store i32 %14, ptr %7, align 4
  br label %15, !llvm.loop !13

18:                                               ; preds = %15
  %19 = call double @energy(i32 noundef 5, ptr noundef @bodies)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %19)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
