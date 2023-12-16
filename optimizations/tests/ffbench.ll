; ModuleID = '<stdin>'
source_filename = "ffbench.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.nsize = internal global [3 x i32] zeroinitializer, align 4
@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [28 x i8] c"Can't allocate data array.\0A\00", align 1
@.str.1 = private unnamed_addr constant [48 x i8] c"Wrong answer at (%d,%d)!  Expected %d, got %d.\0A\00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"%d passes.  No errors in results.\0A\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"%d passes.  %d errors in results.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  %20 = alloca double, align 8
  %21 = alloca double, align 8
  store i32 0, ptr %1, align 4
  store i32 63, ptr %7, align 4
  store i32 256, ptr %8, align 4
  %22 = load i32, ptr %8, align 4
  %23 = load i32, ptr %8, align 4
  %24 = mul nsw i32 %22, %23
  %25 = sext i32 %24 to i64
  store i64 %25, ptr %10, align 8
  %26 = load i64, ptr %10, align 8
  %27 = add nsw i64 %26, 1
  %28 = mul nsw i64 %27, 2
  %29 = mul i64 %28, 8
  store i64 %29, ptr %11, align 8
  %30 = load i32, ptr %8, align 4
  store i32 %30, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 2), align 4
  store i32 %30, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 1), align 4
  %31 = load i64, ptr %11, align 8
  %32 = call noalias ptr @malloc(i64 noundef %31) #7
  store ptr %32, ptr %9, align 8
  %33 = load ptr, ptr %9, align 8
  %34 = icmp eq ptr %33, null
  br i1 %34, label %35, label %38

35:                                               ; preds = %0
  %36 = load ptr, ptr @stderr, align 8
  %37 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %36, ptr noundef @.str)
  call void @exit(i32 noundef 1) #8
  unreachable

38:                                               ; preds = %0
  %39 = load ptr, ptr %9, align 8
  %40 = load i64, ptr %11, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %39, i8 0, i64 %40, i1 false)
  store i32 0, ptr %2, align 4
  %41 = load i32, ptr %2, align 4
  %42 = load i32, ptr %8, align 4
  %43 = icmp slt i32 %41, %42
  %44 = load i32, ptr %3, align 4
  %45 = load i32, ptr %8, align 4
  %46 = icmp slt i32 %44, %45
  %47 = load i32, ptr %2, align 4
  %48 = and i32 %47, 15
  %49 = icmp eq i32 %48, 8
  %50 = load ptr, ptr %9, align 8
  %51 = load i32, ptr %8, align 4
  %52 = load i32, ptr %2, align 4
  %53 = mul nsw i32 %51, %52
  %54 = load i32, ptr %3, align 4
  %55 = add nsw i32 %53, %54
  %56 = mul nsw i32 %55, 2
  %57 = add nsw i32 1, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, ptr %50, i64 %58
  %60 = load i32, ptr %3, align 4
  %61 = and i32 %60, 15
  %62 = icmp eq i32 %61, 8
  %63 = load i32, ptr %3, align 4
  %64 = add nsw i32 %63, 1
  %65 = load i32, ptr %2, align 4
  %66 = add nsw i32 %65, 1
  br label %67

67:                                               ; preds = %76, %38
  br i1 %43, label %68, label %77

68:                                               ; preds = %67
  store i32 0, ptr %3, align 4
  br label %69

69:                                               ; preds = %74, %68
  br i1 %46, label %70, label %75

70:                                               ; preds = %69
  br i1 %49, label %72, label %71

71:                                               ; preds = %70
  br i1 %62, label %72, label %73

72:                                               ; preds = %71, %70
  store double 1.280000e+02, ptr %59, align 8
  br label %73

73:                                               ; preds = %72, %71
  br label %74

74:                                               ; preds = %73
  store i32 %64, ptr %3, align 4
  br label %69, !llvm.loop !6

75:                                               ; preds = %69
  br label %76

76:                                               ; preds = %75
  store i32 %66, ptr %2, align 4
  br label %67, !llvm.loop !8

77:                                               ; preds = %67
  store i32 0, ptr %2, align 4
  %78 = load i32, ptr %2, align 4
  %79 = load i32, ptr %7, align 4
  %80 = icmp slt i32 %78, %79
  %81 = load ptr, ptr %9, align 8
  %82 = load ptr, ptr %9, align 8
  %83 = load i32, ptr %2, align 4
  %84 = add nsw i32 %83, 1
  br label %85

85:                                               ; preds = %87, %77
  br i1 %80, label %86, label %88

86:                                               ; preds = %85
  call void @fourn(ptr noundef %81, ptr noundef @main.nsize, i32 noundef 2, i32 noundef 1)
  call void @fourn(ptr noundef %82, ptr noundef @main.nsize, i32 noundef 2, i32 noundef -1)
  br label %87

87:                                               ; preds = %86
  store i32 %84, ptr %2, align 4
  br label %85, !llvm.loop !9

88:                                               ; preds = %85
  store double 1.000000e+10, ptr %14, align 8
  store double -1.000000e+10, ptr %15, align 8
  store double 1.000000e+10, ptr %16, align 8
  store double -1.000000e+10, ptr %17, align 8
  store double 0.000000e+00, ptr %20, align 8
  store double 0.000000e+00, ptr %21, align 8
  store i32 1, ptr %2, align 4
  %89 = load i32, ptr %2, align 4
  %90 = sext i32 %89 to i64
  %91 = load i64, ptr %10, align 8
  %92 = icmp sle i64 %90, %91
  %93 = load ptr, ptr %9, align 8
  %94 = load i32, ptr %2, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double, ptr %93, i64 %95
  %97 = load ptr, ptr %9, align 8
  %98 = load i32, ptr %2, align 4
  %99 = add nsw i32 %98, 1
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, ptr %97, i64 %100
  %102 = load double, ptr %18, align 8
  %103 = load double, ptr %20, align 8
  %104 = fadd double %103, %102
  %105 = load double, ptr %19, align 8
  %106 = load double, ptr %21, align 8
  %107 = fadd double %106, %105
  %108 = load double, ptr %18, align 8
  %109 = load double, ptr %14, align 8
  %110 = fcmp ole double %108, %109
  %111 = load double, ptr %18, align 8
  %112 = load double, ptr %14, align 8
  %113 = load double, ptr %18, align 8
  %114 = load double, ptr %15, align 8
  %115 = fcmp ogt double %113, %114
  %116 = load double, ptr %18, align 8
  %117 = load double, ptr %15, align 8
  %118 = load double, ptr %19, align 8
  %119 = load double, ptr %16, align 8
  %120 = fcmp ole double %118, %119
  %121 = load double, ptr %19, align 8
  %122 = load double, ptr %16, align 8
  %123 = load double, ptr %19, align 8
  %124 = load double, ptr %17, align 8
  %125 = fcmp ogt double %123, %124
  %126 = load double, ptr %19, align 8
  %127 = load double, ptr %17, align 8
  %128 = load i32, ptr %2, align 4
  %129 = add nsw i32 %128, 2
  br label %130

130:                                              ; preds = %150, %88
  br i1 %92, label %131, label %151

131:                                              ; preds = %130
  %132 = load double, ptr %96, align 8
  store double %132, ptr %18, align 8
  %133 = load double, ptr %101, align 8
  store double %133, ptr %19, align 8
  store double %104, ptr %20, align 8
  store double %107, ptr %21, align 8
  br i1 %110, label %134, label %135

134:                                              ; preds = %131
  br label %136

135:                                              ; preds = %131
  br label %136

136:                                              ; preds = %135, %134
  %137 = phi double [ %111, %134 ], [ %112, %135 ]
  store double %137, ptr %14, align 8
  br i1 %115, label %138, label %139

138:                                              ; preds = %136
  br label %140

139:                                              ; preds = %136
  br label %140

140:                                              ; preds = %139, %138
  %141 = phi double [ %116, %138 ], [ %117, %139 ]
  store double %141, ptr %15, align 8
  br i1 %120, label %142, label %143

142:                                              ; preds = %140
  br label %144

143:                                              ; preds = %140
  br label %144

144:                                              ; preds = %143, %142
  %145 = phi double [ %121, %142 ], [ %122, %143 ]
  store double %145, ptr %16, align 8
  br i1 %125, label %146, label %147

146:                                              ; preds = %144
  br label %148

147:                                              ; preds = %144
  br label %148

148:                                              ; preds = %147, %146
  %149 = phi double [ %126, %146 ], [ %127, %147 ]
  store double %149, ptr %17, align 8
  br label %150

150:                                              ; preds = %148
  store i32 %129, ptr %2, align 4
  br label %130, !llvm.loop !10

151:                                              ; preds = %130
  %152 = load double, ptr %14, align 8
  store double %152, ptr %12, align 8
  %153 = load double, ptr %15, align 8
  %154 = load double, ptr %14, align 8
  %155 = fsub double %153, %154
  %156 = fdiv double 2.550000e+02, %155
  store double %156, ptr %13, align 8
  store i32 0, ptr %6, align 4
  store i32 0, ptr %2, align 4
  %157 = load i32, ptr %2, align 4
  %158 = load i32, ptr %8, align 4
  %159 = icmp slt i32 %157, %158
  %160 = load i32, ptr %3, align 4
  %161 = load i32, ptr %8, align 4
  %162 = icmp slt i32 %160, %161
  %163 = load ptr, ptr %9, align 8
  %164 = load i32, ptr %8, align 4
  %165 = load i32, ptr %2, align 4
  %166 = mul nsw i32 %164, %165
  %167 = load i32, ptr %3, align 4
  %168 = add nsw i32 %166, %167
  %169 = mul nsw i32 %168, 2
  %170 = add nsw i32 1, %169
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds double, ptr %163, i64 %171
  %173 = load double, ptr %12, align 8
  %174 = load double, ptr %13, align 8
  %175 = load i32, ptr %2, align 4
  %176 = and i32 %175, 15
  %177 = icmp eq i32 %176, 8
  %178 = load i32, ptr %4, align 4
  %179 = load i32, ptr %5, align 4
  %180 = icmp ne i32 %178, %179
  %181 = load i32, ptr %3, align 4
  %182 = and i32 %181, 15
  %183 = icmp eq i32 %182, 8
  %184 = load i32, ptr %6, align 4
  %185 = add nsw i32 %184, 1
  %186 = load ptr, ptr @stderr, align 8
  %187 = load i32, ptr %2, align 4
  %188 = load i32, ptr %3, align 4
  %189 = load i32, ptr %5, align 4
  %190 = load i32, ptr %4, align 4
  %191 = load i32, ptr %3, align 4
  %192 = add nsw i32 %191, 1
  %193 = load i32, ptr %2, align 4
  %194 = add nsw i32 %193, 1
  br label %195

195:                                              ; preds = %210, %151
  br i1 %159, label %196, label %211

196:                                              ; preds = %195
  store i32 0, ptr %3, align 4
  br label %197

197:                                              ; preds = %208, %196
  br i1 %162, label %198, label %209

198:                                              ; preds = %197
  %199 = load double, ptr %172, align 8
  %200 = fsub double %199, %173
  %201 = fmul double %200, %174
  %202 = fptosi double %201 to i32
  store i32 %202, ptr %4, align 4
  br i1 %177, label %204, label %203

203:                                              ; preds = %198
  br label %204

204:                                              ; preds = %203, %198
  store i32 255, ptr %5, align 4
  br i1 %180, label %205, label %207

205:                                              ; preds = %204
  store i32 %185, ptr %6, align 4
  %206 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %186, ptr noundef @.str.1, i32 noundef %187, i32 noundef %188, i32 noundef %189, i32 noundef %190)
  br label %207

207:                                              ; preds = %205, %204
  br label %208

208:                                              ; preds = %207
  store i32 %192, ptr %3, align 4
  br label %197, !llvm.loop !11

209:                                              ; preds = %197
  br label %210

210:                                              ; preds = %209
  store i32 %194, ptr %2, align 4
  br label %195, !llvm.loop !12

211:                                              ; preds = %195
  %212 = load i32, ptr %6, align 4
  %213 = icmp eq i32 %212, 0
  br i1 %213, label %214, label %218

214:                                              ; preds = %211
  %215 = load ptr, ptr @stderr, align 8
  %216 = load i32, ptr %7, align 4
  %217 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %215, ptr noundef @.str.2, i32 noundef %216)
  br label %223

218:                                              ; preds = %211
  %219 = load ptr, ptr @stderr, align 8
  %220 = load i32, ptr %7, align 4
  %221 = load i32, ptr %6, align 4
  %222 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %219, ptr noundef @.str.3, i32 noundef %220, i32 noundef %221)
  br label %223

223:                                              ; preds = %218, %214
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define internal void @fourn(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca double, align 8
  %28 = alloca double, align 8
  %29 = alloca double, align 8
  %30 = alloca double, align 8
  %31 = alloca double, align 8
  %32 = alloca double, align 8
  %33 = alloca double, align 8
  %34 = alloca double, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 1, ptr %26, align 4
  store i32 1, ptr %20, align 4
  %35 = load i32, ptr %20, align 4
  %36 = load i32, ptr %7, align 4
  %37 = icmp sle i32 %35, %36
  %38 = load ptr, ptr %6, align 8
  %39 = load i32, ptr %20, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr %38, i64 %40
  %42 = load i32, ptr %26, align 4
  %43 = load i32, ptr %20, align 4
  %44 = add nsw i32 %43, 1
  br label %45

45:                                               ; preds = %49, %4
  br i1 %37, label %46, label %50

46:                                               ; preds = %45
  %47 = load i32, ptr %41, align 4
  %48 = mul nsw i32 %42, %47
  store i32 %48, ptr %26, align 4
  br label %49

49:                                               ; preds = %46
  store i32 %44, ptr %20, align 4
  br label %45, !llvm.loop !13

50:                                               ; preds = %45
  store i32 1, ptr %24, align 4
  %51 = load i32, ptr %7, align 4
  store i32 %51, ptr %20, align 4
  %52 = load i32, ptr %20, align 4
  %53 = icmp sge i32 %52, 1
  %54 = load ptr, ptr %6, align 8
  %55 = load i32, ptr %20, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, ptr %54, i64 %56
  %58 = load i32, ptr %26, align 4
  %59 = load i32, ptr %23, align 4
  %60 = load i32, ptr %24, align 4
  %61 = mul nsw i32 %59, %60
  %62 = load i32, ptr %24, align 4
  %63 = shl i32 %62, 1
  %64 = load i32, ptr %14, align 4
  %65 = load i32, ptr %23, align 4
  %66 = mul nsw i32 %64, %65
  %67 = load i32, ptr %15, align 4
  %68 = load i32, ptr %25, align 4
  %69 = mul nsw i32 %67, %68
  %70 = load i32, ptr %10, align 4
  %71 = load i32, ptr %15, align 4
  %72 = icmp sle i32 %70, %71
  %73 = load i32, ptr %10, align 4
  %74 = load i32, ptr %12, align 4
  %75 = icmp slt i32 %73, %74
  %76 = load i32, ptr %10, align 4
  %77 = load i32, ptr %9, align 4
  %78 = load i32, ptr %10, align 4
  %79 = load i32, ptr %14, align 4
  %80 = add nsw i32 %78, %79
  %81 = sub nsw i32 %80, 2
  %82 = icmp sle i32 %77, %81
  %83 = load i32, ptr %9, align 4
  %84 = load i32, ptr %11, align 4
  %85 = load i32, ptr %16, align 4
  %86 = icmp sle i32 %84, %85
  %87 = load i32, ptr %12, align 4
  %88 = load i32, ptr %11, align 4
  %89 = add nsw i32 %87, %88
  %90 = load i32, ptr %10, align 4
  %91 = sub nsw i32 %89, %90
  %92 = load ptr, ptr %5, align 8
  %93 = load i32, ptr %11, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds double, ptr %92, i64 %94
  %96 = load ptr, ptr %5, align 8
  %97 = load i32, ptr %13, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds double, ptr %96, i64 %98
  %100 = load ptr, ptr %5, align 8
  %101 = load i32, ptr %11, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds double, ptr %100, i64 %102
  %104 = load double, ptr %28, align 8
  %105 = load ptr, ptr %5, align 8
  %106 = load i32, ptr %13, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds double, ptr %105, i64 %107
  %109 = load ptr, ptr %5, align 8
  %110 = load i32, ptr %11, align 4
  %111 = add nsw i32 %110, 1
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds double, ptr %109, i64 %112
  %114 = load ptr, ptr %5, align 8
  %115 = load i32, ptr %13, align 4
  %116 = add nsw i32 %115, 1
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds double, ptr %114, i64 %117
  %119 = load ptr, ptr %5, align 8
  %120 = load i32, ptr %11, align 4
  %121 = add nsw i32 %120, 1
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds double, ptr %119, i64 %122
  %124 = load double, ptr %28, align 8
  %125 = load ptr, ptr %5, align 8
  %126 = load i32, ptr %13, align 4
  %127 = add nsw i32 %126, 1
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds double, ptr %125, i64 %128
  %130 = load i32, ptr %15, align 4
  %131 = load i32, ptr %11, align 4
  %132 = add nsw i32 %131, %130
  %133 = load i32, ptr %9, align 4
  %134 = add nsw i32 %133, 2
  %135 = load i32, ptr %15, align 4
  %136 = ashr i32 %135, 1
  %137 = load i32, ptr %19, align 4
  %138 = load i32, ptr %14, align 4
  %139 = icmp sge i32 %137, %138
  %140 = load i32, ptr %12, align 4
  %141 = load i32, ptr %19, align 4
  %142 = icmp sgt i32 %140, %141
  %143 = load i32, ptr %19, align 4
  %144 = load i32, ptr %12, align 4
  %145 = sub nsw i32 %144, %143
  %146 = load i32, ptr %19, align 4
  %147 = ashr i32 %146, 1
  %148 = load i32, ptr %19, align 4
  %149 = load i32, ptr %12, align 4
  %150 = add nsw i32 %149, %148
  %151 = load i32, ptr %14, align 4
  %152 = load i32, ptr %10, align 4
  %153 = add nsw i32 %152, %151
  %154 = load i32, ptr %14, align 4
  %155 = load i32, ptr %17, align 4
  %156 = load i32, ptr %15, align 4
  %157 = icmp slt i32 %155, %156
  %158 = load i32, ptr %17, align 4
  %159 = shl i32 %158, 1
  %160 = load i32, ptr %8, align 4
  %161 = sitofp i32 %160 to double
  %162 = fmul double %161, 0x401921FB54442D1C
  %163 = load i32, ptr %18, align 4
  %164 = load i32, ptr %14, align 4
  %165 = load double, ptr %29, align 8
  %166 = fmul double 5.000000e-01, %165
  %167 = load double, ptr %34, align 8
  %168 = fmul double -2.000000e+00, %167
  %169 = load double, ptr %34, align 8
  %170 = fmul double %168, %169
  %171 = load double, ptr %29, align 8
  %172 = load i32, ptr %11, align 4
  %173 = load i32, ptr %17, align 4
  %174 = icmp sle i32 %172, %173
  %175 = load i32, ptr %11, align 4
  %176 = load i32, ptr %9, align 4
  %177 = load i32, ptr %11, align 4
  %178 = load i32, ptr %14, align 4
  %179 = add nsw i32 %177, %178
  %180 = sub nsw i32 %179, 2
  %181 = icmp sle i32 %176, %180
  %182 = load i32, ptr %9, align 4
  %183 = load i32, ptr %10, align 4
  %184 = load i32, ptr %16, align 4
  %185 = icmp sle i32 %183, %184
  %186 = load i32, ptr %10, align 4
  %187 = load i32, ptr %21, align 4
  %188 = load i32, ptr %17, align 4
  %189 = add nsw i32 %187, %188
  %190 = load double, ptr %33, align 8
  %191 = load ptr, ptr %5, align 8
  %192 = load i32, ptr %22, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds double, ptr %191, i64 %193
  %195 = load double, ptr %30, align 8
  %196 = load ptr, ptr %5, align 8
  %197 = load i32, ptr %22, align 4
  %198 = add nsw i32 %197, 1
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds double, ptr %196, i64 %199
  %201 = load double, ptr %33, align 8
  %202 = load ptr, ptr %5, align 8
  %203 = load i32, ptr %22, align 4
  %204 = add nsw i32 %203, 1
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds double, ptr %202, i64 %205
  %207 = load double, ptr %30, align 8
  %208 = load ptr, ptr %5, align 8
  %209 = load i32, ptr %22, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds double, ptr %208, i64 %210
  %212 = load ptr, ptr %5, align 8
  %213 = load i32, ptr %21, align 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds double, ptr %212, i64 %214
  %216 = load double, ptr %28, align 8
  %217 = load ptr, ptr %5, align 8
  %218 = load i32, ptr %22, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds double, ptr %217, i64 %219
  %221 = load ptr, ptr %5, align 8
  %222 = load i32, ptr %21, align 4
  %223 = add nsw i32 %222, 1
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds double, ptr %221, i64 %224
  %226 = load double, ptr %27, align 8
  %227 = load ptr, ptr %5, align 8
  %228 = load i32, ptr %22, align 4
  %229 = add nsw i32 %228, 1
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds double, ptr %227, i64 %230
  %232 = load double, ptr %28, align 8
  %233 = load ptr, ptr %5, align 8
  %234 = load i32, ptr %21, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds double, ptr %233, i64 %235
  %237 = load double, ptr %27, align 8
  %238 = load ptr, ptr %5, align 8
  %239 = load i32, ptr %21, align 4
  %240 = add nsw i32 %239, 1
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds double, ptr %238, i64 %241
  %243 = load i32, ptr %18, align 4
  %244 = load i32, ptr %10, align 4
  %245 = add nsw i32 %244, %243
  %246 = load i32, ptr %9, align 4
  %247 = add nsw i32 %246, 2
  %248 = load double, ptr %33, align 8
  %249 = load double, ptr %32, align 8
  %250 = load double, ptr %30, align 8
  %251 = load double, ptr %31, align 8
  %252 = fmul double %250, %251
  %253 = fneg double %252
  %254 = load double, ptr %33, align 8
  %255 = load double, ptr %30, align 8
  %256 = load double, ptr %32, align 8
  %257 = load double, ptr %34, align 8
  %258 = load double, ptr %31, align 8
  %259 = fmul double %257, %258
  %260 = load double, ptr %30, align 8
  %261 = load i32, ptr %14, align 4
  %262 = load i32, ptr %11, align 4
  %263 = add nsw i32 %262, %261
  %264 = load i32, ptr %18, align 4
  %265 = load i32, ptr %23, align 4
  %266 = load i32, ptr %24, align 4
  %267 = mul nsw i32 %266, %265
  %268 = load i32, ptr %20, align 4
  %269 = add nsw i32 %268, -1
  br label %270

270:                                              ; preds = %339, %50
  br i1 %53, label %271, label %340

271:                                              ; preds = %270
  %272 = load i32, ptr %57, align 4
  store i32 %272, ptr %23, align 4
  %273 = sdiv i32 %58, %61
  store i32 %273, ptr %25, align 4
  store i32 %63, ptr %14, align 4
  store i32 %66, ptr %15, align 4
  store i32 %69, ptr %16, align 4
  store i32 1, ptr %12, align 4
  store i32 1, ptr %10, align 4
  br label %274

274:                                              ; preds = %296, %271
  br i1 %72, label %275, label %297

275:                                              ; preds = %274
  br i1 %75, label %276, label %289

276:                                              ; preds = %275
  store i32 %76, ptr %9, align 4
  br label %277

277:                                              ; preds = %287, %276
  br i1 %82, label %278, label %288

278:                                              ; preds = %277
  store i32 %83, ptr %11, align 4
  br label %279

279:                                              ; preds = %285, %278
  br i1 %86, label %280, label %286

280:                                              ; preds = %279
  store i32 %91, ptr %13, align 4
  %281 = load double, ptr %95, align 8
  store double %281, ptr %28, align 8
  %282 = load double, ptr %99, align 8
  store double %282, ptr %103, align 8
  store double %104, ptr %108, align 8
  %283 = load double, ptr %113, align 8
  store double %283, ptr %28, align 8
  %284 = load double, ptr %118, align 8
  store double %284, ptr %123, align 8
  store double %124, ptr %129, align 8
  br label %285

285:                                              ; preds = %280
  store i32 %132, ptr %11, align 4
  br label %279, !llvm.loop !14

286:                                              ; preds = %279
  br label %287

287:                                              ; preds = %286
  store i32 %134, ptr %9, align 4
  br label %277, !llvm.loop !15

288:                                              ; preds = %277
  br label %289

289:                                              ; preds = %288, %275
  store i32 %136, ptr %19, align 4
  br label %290

290:                                              ; preds = %294, %289
  br i1 %139, label %291, label %292

291:                                              ; preds = %290
  br label %292

292:                                              ; preds = %291, %290
  %293 = phi i1 [ false, %290 ], [ %142, %291 ]
  br i1 %293, label %294, label %295

294:                                              ; preds = %292
  store i32 %145, ptr %12, align 4
  store i32 %147, ptr %19, align 4
  br label %290, !llvm.loop !16

295:                                              ; preds = %292
  store i32 %150, ptr %12, align 4
  br label %296

296:                                              ; preds = %295
  store i32 %153, ptr %10, align 4
  br label %274, !llvm.loop !17

297:                                              ; preds = %274
  store i32 %154, ptr %17, align 4
  br label %298

298:                                              ; preds = %337, %297
  br i1 %157, label %299, label %338

299:                                              ; preds = %298
  store i32 %159, ptr %18, align 4
  %300 = sdiv i32 %163, %164
  %301 = sitofp i32 %300 to double
  %302 = fdiv double %162, %301
  store double %302, ptr %29, align 8
  %303 = call double @sin(double noundef %166) #9
  store double %303, ptr %34, align 8
  store double %170, ptr %32, align 8
  %304 = call double @sin(double noundef %171) #9
  store double %304, ptr %31, align 8
  store double 1.000000e+00, ptr %33, align 8
  store double 0.000000e+00, ptr %30, align 8
  store i32 1, ptr %11, align 4
  br label %305

305:                                              ; preds = %336, %299
  br i1 %174, label %306, label %337

306:                                              ; preds = %305
  store i32 %175, ptr %9, align 4
  br label %307

307:                                              ; preds = %330, %306
  br i1 %181, label %308, label %331

308:                                              ; preds = %307
  store i32 %182, ptr %10, align 4
  br label %309

309:                                              ; preds = %328, %308
  br i1 %185, label %310, label %329

310:                                              ; preds = %309
  store i32 %186, ptr %21, align 4
  store i32 %189, ptr %22, align 4
  %311 = load double, ptr %194, align 8
  %312 = load double, ptr %200, align 8
  %313 = fmul double %195, %312
  %314 = fneg double %313
  %315 = call double @llvm.fmuladd.f64(double %190, double %311, double %314)
  store double %315, ptr %28, align 8
  %316 = load double, ptr %206, align 8
  %317 = load double, ptr %211, align 8
  %318 = fmul double %207, %317
  %319 = call double @llvm.fmuladd.f64(double %201, double %316, double %318)
  store double %319, ptr %27, align 8
  %320 = load double, ptr %215, align 8
  %321 = fsub double %320, %216
  store double %321, ptr %220, align 8
  %322 = load double, ptr %225, align 8
  %323 = fsub double %322, %226
  store double %323, ptr %231, align 8
  %324 = load double, ptr %236, align 8
  %325 = fadd double %324, %232
  store double %325, ptr %236, align 8
  %326 = load double, ptr %242, align 8
  %327 = fadd double %326, %237
  store double %327, ptr %242, align 8
  br label %328

328:                                              ; preds = %310
  store i32 %245, ptr %10, align 4
  br label %309, !llvm.loop !18

329:                                              ; preds = %309
  br label %330

330:                                              ; preds = %329
  store i32 %247, ptr %9, align 4
  br label %307, !llvm.loop !19

331:                                              ; preds = %307
  store double %248, ptr %34, align 8
  %332 = call double @llvm.fmuladd.f64(double %248, double %249, double %253)
  %333 = fadd double %332, %254
  store double %333, ptr %33, align 8
  %334 = call double @llvm.fmuladd.f64(double %255, double %256, double %259)
  %335 = fadd double %334, %260
  store double %335, ptr %30, align 8
  br label %336

336:                                              ; preds = %331
  store i32 %263, ptr %11, align 4
  br label %305, !llvm.loop !20

337:                                              ; preds = %305
  store i32 %264, ptr %17, align 4
  br label %298, !llvm.loop !21

338:                                              ; preds = %298
  store i32 %267, ptr %24, align 4
  br label %339

339:                                              ; preds = %338
  store i32 %269, ptr %20, align 4
  br label %270, !llvm.loop !22

340:                                              ; preds = %270
  ret void
}

; Function Attrs: nounwind
declare double @sin(double noundef) #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #6

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind }

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
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
