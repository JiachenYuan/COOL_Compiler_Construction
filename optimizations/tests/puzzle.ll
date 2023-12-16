; ModuleID = '<stdin>'
source_filename = "puzzle.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@next = internal global i64 1, align 8
@.str = private unnamed_addr constant [21 x i8] c"Found duplicate: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rand() #0 {
  %1 = load i64, ptr @next, align 8
  %2 = mul i64 %1, 1103515245
  %3 = add i64 %2, 12345
  store i64 %3, ptr @next, align 8
  %4 = load i64, ptr @next, align 8
  %5 = udiv i64 %4, 65536
  %6 = trunc i64 %5 to i32
  %7 = urem i32 %6, 32767
  %8 = add i32 %7, 1
  ret i32 %8
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @srand(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = zext i32 %3 to i64
  store i64 %4, ptr @next, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @randInt(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %3, align 4
  %9 = sub nsw i32 %7, %8
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %6, align 4
  %11 = load i32, ptr %6, align 4
  %12 = sitofp i32 %11 to double
  %13 = call i32 @rand() #4
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 3.276800e+04
  %16 = fmul double %12, %15
  %17 = fptosi double %16 to i32
  store i32 %17, ptr %5, align 4
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %6, align 4
  %20 = icmp eq i32 %18, %19
  br i1 %20, label %21, label %26

21:                                               ; preds = %2
  %22 = load i32, ptr %5, align 4
  %23 = load i32, ptr %3, align 4
  %24 = add nsw i32 %22, %23
  %25 = sub nsw i32 %24, 1
  br label %30

26:                                               ; preds = %2
  %27 = load i32, ptr %5, align 4
  %28 = load i32, ptr %3, align 4
  %29 = add nsw i32 %27, %28
  br label %30

30:                                               ; preds = %26, %21
  %31 = phi i32 [ %25, %21 ], [ %29, %26 ]
  ret i32 %31
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @shuffle(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  %10 = sub nsw i32 %9, 1
  %11 = sext i32 %10 to i64
  store i64 %11, ptr %7, align 8
  %12 = load i64, ptr %7, align 8
  %13 = icmp ugt i64 %12, 0
  %14 = load i64, ptr %7, align 8
  %15 = add i64 %14, 1
  %16 = uitofp i64 %15 to double
  %17 = load i64, ptr %6, align 8
  %18 = load i64, ptr %7, align 8
  %19 = add i64 %18, 1
  %20 = icmp eq i64 %17, %19
  %21 = load i64, ptr %6, align 8
  %22 = sub i64 %21, 1
  %23 = load i64, ptr %6, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = load i64, ptr %7, align 8
  %26 = getelementptr inbounds i32, ptr %24, i64 %25
  %27 = load ptr, ptr %3, align 8
  %28 = load i64, ptr %5, align 8
  %29 = getelementptr inbounds i32, ptr %27, i64 %28
  %30 = load ptr, ptr %3, align 8
  %31 = load i64, ptr %7, align 8
  %32 = getelementptr inbounds i32, ptr %30, i64 %31
  %33 = load i32, ptr %8, align 4
  %34 = load ptr, ptr %3, align 8
  %35 = load i64, ptr %5, align 8
  %36 = getelementptr inbounds i32, ptr %34, i64 %35
  %37 = load i64, ptr %7, align 8
  %38 = add i64 %37, -1
  br label %39

39:                                               ; preds = %53, %2
  br i1 %13, label %40, label %54

40:                                               ; preds = %39
  %41 = call i32 @rand() #4
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, 3.276800e+04
  %44 = fmul double %16, %43
  %45 = fptosi double %44 to i32
  %46 = sext i32 %45 to i64
  store i64 %46, ptr %6, align 8
  br i1 %20, label %47, label %48

47:                                               ; preds = %40
  br label %49

48:                                               ; preds = %40
  br label %49

49:                                               ; preds = %48, %47
  %50 = phi i64 [ %22, %47 ], [ %23, %48 ]
  store i64 %50, ptr %5, align 8
  %51 = load i32, ptr %26, align 4
  store i32 %51, ptr %8, align 4
  %52 = load i32, ptr %29, align 4
  store i32 %52, ptr %32, align 4
  store i32 %33, ptr %36, align 4
  br label %53

53:                                               ; preds = %49
  store i64 %38, ptr %7, align 8
  br label %39, !llvm.loop !6

54:                                               ; preds = %39
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @createRandomArray(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %6 = load i32, ptr %2, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, ptr %4, align 4
  %8 = load i32, ptr %4, align 4
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 4
  %11 = call noalias ptr @malloc(i64 noundef %10) #5
  store ptr %11, ptr %5, align 8
  store i32 0, ptr %3, align 4
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %12, %13
  %15 = load i32, ptr %3, align 4
  %16 = load ptr, ptr %5, align 8
  %17 = load i32, ptr %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, ptr %16, i64 %18
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, 1
  br label %22

22:                                               ; preds = %24, %1
  br i1 %14, label %23, label %25

23:                                               ; preds = %22
  store i32 %15, ptr %19, align 4
  br label %24

24:                                               ; preds = %23
  store i32 %21, ptr %3, align 4
  br label %22, !llvm.loop !8

25:                                               ; preds = %22
  %26 = load i32, ptr %2, align 4
  %27 = call i32 @randInt(i32 noundef 1, i32 noundef %26)
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds i32, ptr %28, i64 0
  store i32 %27, ptr %29, align 4
  %30 = load ptr, ptr %5, align 8
  %31 = load i32, ptr %4, align 4
  call void @shuffle(ptr noundef %30, i32 noundef %31)
  %32 = load ptr, ptr %5, align 8
  ret ptr %32
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @findDuplicate(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %5, align 4
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  %10 = load i32, ptr %6, align 4
  %11 = load i32, ptr %5, align 4
  %12 = add nsw i32 %11, 1
  %13 = xor i32 %10, %12
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %5, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr %14, i64 %16
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, 1
  br label %20

20:                                               ; preds = %24, %2
  br i1 %9, label %21, label %25

21:                                               ; preds = %20
  %22 = load i32, ptr %17, align 4
  %23 = xor i32 %13, %22
  store i32 %23, ptr %6, align 4
  br label %24

24:                                               ; preds = %21
  store i32 %19, ptr %5, align 4
  br label %20, !llvm.loop !9

25:                                               ; preds = %20
  %26 = load i32, ptr %4, align 4
  %27 = load i32, ptr %6, align 4
  %28 = xor i32 %27, %26
  store i32 %28, ptr %6, align 4
  %29 = load i32, ptr %6, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  call void @srand(i32 noundef 1) #4
  store i32 0, ptr %2, align 4
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %6, 5
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %8, 200
  %10 = load ptr, ptr %5, align 8
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, 1
  %13 = load ptr, ptr %5, align 8
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %2, align 4
  %16 = add nsw i32 %15, 1
  br label %17

17:                                               ; preds = %26, %0
  br i1 %7, label %18, label %27

18:                                               ; preds = %17
  %19 = call ptr @createRandomArray(i32 noundef 500000)
  store ptr %19, ptr %5, align 8
  store i32 0, ptr %3, align 4
  br label %20

20:                                               ; preds = %23, %18
  br i1 %9, label %21, label %24

21:                                               ; preds = %20
  %22 = call i32 @findDuplicate(ptr noundef %10, i32 noundef 500001)
  store i32 %22, ptr %4, align 4
  br label %23

23:                                               ; preds = %21
  store i32 %12, ptr %3, align 4
  br label %20, !llvm.loop !10

24:                                               ; preds = %20
  call void @free(ptr noundef %13) #4
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %14)
  br label %26

26:                                               ; preds = %24
  store i32 %16, ptr %2, align 4
  br label %17, !llvm.loop !11

27:                                               ; preds = %17
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind allocsize(0) }

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
