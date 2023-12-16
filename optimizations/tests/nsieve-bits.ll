; ModuleID = '<stdin>'
source_filename = "nsieve-bits.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Primes up to %8d %8d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 40960000, ptr %7, align 4
  %13 = load i32, ptr %7, align 4
  %14 = udiv i32 %13, 8
  %15 = zext i32 %14 to i64
  %16 = add i64 %15, 4
  %17 = call noalias ptr @malloc(i64 noundef %16) #5
  store ptr %17, ptr %8, align 8
  %18 = load ptr, ptr %8, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %21, label %20

20:                                               ; preds = %2
  store i32 1, ptr %3, align 4
  br label %108

21:                                               ; preds = %2
  store i32 0, ptr %6, align 4
  %22 = load i32, ptr %6, align 4
  %23 = icmp ule i32 %22, 2
  %24 = load i32, ptr %7, align 4
  %25 = load i32, ptr %6, align 4
  %26 = lshr i32 %24, %25
  %27 = load ptr, ptr %8, align 8
  %28 = load i32, ptr %12, align 4
  %29 = udiv i32 %28, 8
  %30 = zext i32 %29 to i64
  %31 = add i64 %30, 4
  %32 = load i32, ptr %9, align 4
  %33 = load i32, ptr %12, align 4
  %34 = icmp ule i32 %32, %33
  %35 = load ptr, ptr %8, align 8
  %36 = load i32, ptr %9, align 4
  %37 = zext i32 %36 to i64
  %38 = udiv i64 %37, 32
  %39 = getelementptr inbounds i32, ptr %35, i64 %38
  %40 = load i32, ptr %9, align 4
  %41 = zext i32 %40 to i64
  %42 = urem i64 %41, 32
  %43 = trunc i64 %42 to i32
  %44 = shl i32 1, %43
  %45 = load i32, ptr %11, align 4
  %46 = add i32 %45, 1
  %47 = load i32, ptr %9, align 4
  %48 = load i32, ptr %9, align 4
  %49 = add i32 %47, %48
  %50 = load i32, ptr %10, align 4
  %51 = load i32, ptr %12, align 4
  %52 = icmp ule i32 %50, %51
  %53 = load ptr, ptr %8, align 8
  %54 = load i32, ptr %10, align 4
  %55 = zext i32 %54 to i64
  %56 = udiv i64 %55, 32
  %57 = getelementptr inbounds i32, ptr %53, i64 %56
  %58 = load i32, ptr %10, align 4
  %59 = zext i32 %58 to i64
  %60 = urem i64 %59, 32
  %61 = trunc i64 %60 to i32
  %62 = shl i32 1, %61
  %63 = load i32, ptr %10, align 4
  %64 = zext i32 %63 to i64
  %65 = urem i64 %64, 32
  %66 = trunc i64 %65 to i32
  %67 = shl i32 1, %66
  %68 = load ptr, ptr %8, align 8
  %69 = load i32, ptr %10, align 4
  %70 = zext i32 %69 to i64
  %71 = udiv i64 %70, 32
  %72 = getelementptr inbounds i32, ptr %68, i64 %71
  %73 = load i32, ptr %9, align 4
  %74 = load i32, ptr %10, align 4
  %75 = add i32 %74, %73
  %76 = load i32, ptr %9, align 4
  %77 = add i32 %76, 1
  %78 = load i32, ptr %12, align 4
  %79 = load i32, ptr %11, align 4
  %80 = load i32, ptr %6, align 4
  %81 = add i32 %80, 1
  br label %82

82:                                               ; preds = %105, %21
  br i1 %23, label %83, label %106

83:                                               ; preds = %82
  store i32 0, ptr %11, align 4
  store i32 %26, ptr %12, align 4
  call void @llvm.memset.p0.i64(ptr align 4 %27, i8 -1, i64 %31, i1 false)
  store i32 2, ptr %9, align 4
  br label %84

84:                                               ; preds = %102, %83
  br i1 %34, label %85, label %103

85:                                               ; preds = %84
  %86 = load i32, ptr %39, align 4
  %87 = and i32 %86, %44
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %89, label %101

89:                                               ; preds = %85
  store i32 %46, ptr %11, align 4
  store i32 %49, ptr %10, align 4
  br label %90

90:                                               ; preds = %99, %89
  br i1 %52, label %91, label %100

91:                                               ; preds = %90
  %92 = load i32, ptr %57, align 4
  %93 = and i32 %92, %62
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %98

95:                                               ; preds = %91
  %96 = load i32, ptr %72, align 4
  %97 = xor i32 %96, %67
  store i32 %97, ptr %72, align 4
  br label %98

98:                                               ; preds = %95, %91
  br label %99

99:                                               ; preds = %98
  store i32 %75, ptr %10, align 4
  br label %90, !llvm.loop !6

100:                                              ; preds = %90
  br label %101

101:                                              ; preds = %100, %85
  br label %102

102:                                              ; preds = %101
  store i32 %77, ptr %9, align 4
  br label %84, !llvm.loop !8

103:                                              ; preds = %84
  %104 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %78, i32 noundef %79)
  br label %105

105:                                              ; preds = %103
  store i32 %81, ptr %6, align 4
  br label %82, !llvm.loop !9

106:                                              ; preds = %82
  %107 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %107) #6
  store i32 0, ptr %3, align 4
  br label %108

108:                                              ; preds = %106, %20
  %109 = load i32, ptr %3, align 4
  ret i32 %109
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind }

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
