; ModuleID = '<stdin>'
source_filename = "fannkuch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Pfannkuchen(%d) = %ld\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 11, ptr %6, align 4
  %7 = load i32, ptr %6, align 4
  %8 = load i32, ptr %6, align 4
  %9 = call i64 @fannkuch(i32 noundef %8)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %7, i64 noundef %9)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal i64 @fannkuch(i32 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %17 = load i32, ptr %3, align 4
  %18 = sub nsw i32 %17, 1
  store i32 %18, ptr %13, align 4
  %19 = load i32, ptr %3, align 4
  %20 = icmp slt i32 %19, 1
  br i1 %20, label %21, label %22

21:                                               ; preds = %1
  store i64 0, ptr %2, align 8
  br label %221

22:                                               ; preds = %1
  %23 = load i32, ptr %3, align 4
  %24 = sext i32 %23 to i64
  %25 = call noalias ptr @calloc(i64 noundef %24, i64 noundef 4) #3
  store ptr %25, ptr %4, align 8
  %26 = load i32, ptr %3, align 4
  %27 = sext i32 %26 to i64
  %28 = call noalias ptr @calloc(i64 noundef %27, i64 noundef 4) #3
  store ptr %28, ptr %5, align 8
  %29 = load i32, ptr %3, align 4
  %30 = sext i32 %29 to i64
  %31 = call noalias ptr @calloc(i64 noundef %30, i64 noundef 4) #3
  store ptr %31, ptr %6, align 8
  store i32 0, ptr %10, align 4
  %32 = load i32, ptr %10, align 4
  %33 = load i32, ptr %3, align 4
  %34 = icmp slt i32 %32, %33
  %35 = load i32, ptr %10, align 4
  %36 = load ptr, ptr %5, align 8
  %37 = load i32, ptr %10, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, ptr %36, i64 %38
  %40 = load i32, ptr %10, align 4
  %41 = add nsw i32 %40, 1
  br label %42

42:                                               ; preds = %44, %22
  br i1 %34, label %43, label %45

43:                                               ; preds = %42
  store i32 %35, ptr %39, align 4
  br label %44

44:                                               ; preds = %43
  store i32 %41, ptr %10, align 4
  br label %42, !llvm.loop !6

45:                                               ; preds = %42
  %46 = load i32, ptr %3, align 4
  store i32 %46, ptr %9, align 4
  store i32 0, ptr %12, align 4
  store i64 0, ptr %8, align 8
  %47 = load i32, ptr %12, align 4
  %48 = icmp slt i32 %47, 30
  %49 = load i32, ptr %10, align 4
  %50 = load i32, ptr %3, align 4
  %51 = icmp slt i32 %49, %50
  %52 = load ptr, ptr %5, align 8
  %53 = load i32, ptr %10, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, ptr %52, i64 %54
  %56 = load i32, ptr %10, align 4
  %57 = add nsw i32 %56, 1
  %58 = load i32, ptr %9, align 4
  %59 = icmp ne i32 %58, 1
  %60 = load i32, ptr %9, align 4
  %61 = load ptr, ptr %6, align 8
  %62 = load i32, ptr %9, align 4
  %63 = sub nsw i32 %62, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, ptr %61, i64 %64
  %66 = load i32, ptr %9, align 4
  %67 = add nsw i32 %66, -1
  %68 = load i32, ptr %12, align 4
  %69 = add nsw i32 %68, 1
  %70 = load ptr, ptr %5, align 8
  %71 = getelementptr inbounds i32, ptr %70, i64 0
  %72 = load i32, ptr %71, align 4
  %73 = icmp eq i32 %72, 0
  %74 = load i32, ptr %9, align 4
  %75 = load i32, ptr %3, align 4
  %76 = icmp eq i32 %74, %75
  %77 = load ptr, ptr %5, align 8
  %78 = getelementptr inbounds i32, ptr %77, i64 0
  %79 = load i32, ptr %10, align 4
  %80 = load i32, ptr %9, align 4
  %81 = icmp slt i32 %79, %80
  %82 = load i32, ptr %10, align 4
  %83 = add nsw i32 %82, 1
  %84 = load ptr, ptr %5, align 8
  %85 = load i32, ptr %11, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, ptr %84, i64 %86
  %88 = load ptr, ptr %5, align 8
  %89 = load i32, ptr %10, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, ptr %88, i64 %90
  %92 = load i32, ptr %11, align 4
  %93 = load i32, ptr %16, align 4
  %94 = load ptr, ptr %5, align 8
  %95 = load i32, ptr %9, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i32, ptr %94, i64 %96
  %98 = load ptr, ptr %6, align 8
  %99 = load i32, ptr %9, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, ptr %98, i64 %100
  %102 = load i32, ptr %9, align 4
  %103 = add nsw i32 %102, 1
  %104 = load ptr, ptr %5, align 8
  %105 = load i32, ptr %13, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, ptr %104, i64 %106
  %108 = load i32, ptr %13, align 4
  %109 = load i32, ptr %10, align 4
  %110 = load i32, ptr %3, align 4
  %111 = icmp slt i32 %109, %110
  %112 = load ptr, ptr %5, align 8
  %113 = load i32, ptr %10, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, ptr %112, i64 %114
  %116 = load ptr, ptr %4, align 8
  %117 = load i32, ptr %10, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, ptr %116, i64 %118
  %120 = load i32, ptr %10, align 4
  %121 = add nsw i32 %120, 1
  %122 = load ptr, ptr %5, align 8
  %123 = getelementptr inbounds i32, ptr %122, i64 0
  %124 = load i32, ptr %11, align 4
  %125 = sub nsw i32 %124, 1
  %126 = load i32, ptr %10, align 4
  %127 = load i32, ptr %14, align 4
  %128 = icmp slt i32 %126, %127
  %129 = load ptr, ptr %4, align 8
  %130 = load i32, ptr %10, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i32, ptr %129, i64 %131
  %133 = load ptr, ptr %4, align 8
  %134 = load i32, ptr %14, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i32, ptr %133, i64 %135
  %137 = load ptr, ptr %4, align 8
  %138 = load i32, ptr %10, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i32, ptr %137, i64 %139
  %141 = load i32, ptr %15, align 4
  %142 = load ptr, ptr %4, align 8
  %143 = load i32, ptr %14, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, ptr %142, i64 %144
  %146 = load i32, ptr %10, align 4
  %147 = add nsw i32 %146, 1
  %148 = load i32, ptr %14, align 4
  %149 = add nsw i32 %148, -1
  %150 = load i64, ptr %7, align 8
  %151 = add nsw i64 %150, 1
  %152 = load ptr, ptr %4, align 8
  %153 = load i32, ptr %11, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds i32, ptr %152, i64 %154
  %156 = load i32, ptr %11, align 4
  %157 = load ptr, ptr %4, align 8
  %158 = load i32, ptr %11, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i32, ptr %157, i64 %159
  %161 = load i32, ptr %14, align 4
  %162 = load i32, ptr %11, align 4
  %163 = icmp ne i32 %162, 0
  %164 = load i64, ptr %8, align 8
  %165 = load i64, ptr %7, align 8
  %166 = icmp slt i64 %164, %165
  %167 = load i64, ptr %7, align 8
  br label %168

168:                                              ; preds = %220, %45
  br i1 %48, label %169, label %178

169:                                              ; preds = %168
  store i32 0, ptr %10, align 4
  br label %170

170:                                              ; preds = %175, %169
  br i1 %51, label %171, label %176

171:                                              ; preds = %170
  %172 = load i32, ptr %55, align 4
  %173 = add nsw i32 1, %172
  %174 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %173)
  br label %175

175:                                              ; preds = %171
  store i32 %57, ptr %10, align 4
  br label %170, !llvm.loop !8

176:                                              ; preds = %170
  %177 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 %69, ptr %12, align 4
  br label %178

178:                                              ; preds = %176, %168
  br label %179

179:                                              ; preds = %181, %178
  br i1 %59, label %180, label %182

180:                                              ; preds = %179
  store i32 %60, ptr %65, align 4
  br label %181

181:                                              ; preds = %180
  store i32 %67, ptr %9, align 4
  br label %179, !llvm.loop !9

182:                                              ; preds = %179
  br i1 %73, label %205, label %183

183:                                              ; preds = %182
  %184 = load i32, ptr %107, align 4
  %185 = icmp eq i32 %184, %108
  br i1 %185, label %205, label %186

186:                                              ; preds = %183
  store i64 0, ptr %7, align 8
  store i32 1, ptr %10, align 4
  br label %187

187:                                              ; preds = %190, %186
  br i1 %111, label %188, label %191

188:                                              ; preds = %187
  %189 = load i32, ptr %115, align 4
  store i32 %189, ptr %119, align 4
  br label %190

190:                                              ; preds = %188
  store i32 %121, ptr %10, align 4
  br label %187, !llvm.loop !10

191:                                              ; preds = %187
  %192 = load i32, ptr %123, align 4
  store i32 %192, ptr %11, align 4
  %193 = load i32, ptr %155, align 4
  br label %194

194:                                              ; preds = %201, %191
  store i32 1, ptr %10, align 4
  store i32 %125, ptr %14, align 4
  br label %195

195:                                              ; preds = %199, %194
  br i1 %128, label %196, label %200

196:                                              ; preds = %195
  %197 = load i32, ptr %132, align 4
  store i32 %197, ptr %15, align 4
  %198 = load i32, ptr %136, align 4
  store i32 %198, ptr %140, align 4
  store i32 %141, ptr %145, align 4
  br label %199

199:                                              ; preds = %196
  store i32 %147, ptr %10, align 4
  store i32 %149, ptr %14, align 4
  br label %195, !llvm.loop !11

200:                                              ; preds = %195
  store i64 %151, ptr %7, align 8
  store i32 %193, ptr %14, align 4
  store i32 %156, ptr %160, align 4
  store i32 %161, ptr %11, align 4
  br label %201

201:                                              ; preds = %200
  br i1 %163, label %194, label %202, !llvm.loop !12

202:                                              ; preds = %201
  br i1 %166, label %203, label %204

203:                                              ; preds = %202
  store i64 %167, ptr %8, align 8
  br label %204

204:                                              ; preds = %203, %202
  br label %205

205:                                              ; preds = %204, %183, %182
  br label %206

206:                                              ; preds = %219, %205
  br i1 %76, label %207, label %209

207:                                              ; preds = %206
  %208 = load i64, ptr %8, align 8
  store i64 %208, ptr %2, align 8
  br label %221

209:                                              ; preds = %206
  %210 = load i32, ptr %78, align 4
  store i32 %210, ptr %16, align 4
  store i32 0, ptr %10, align 4
  br label %211

211:                                              ; preds = %212, %209
  br i1 %81, label %212, label %214

212:                                              ; preds = %211
  store i32 %83, ptr %11, align 4
  %213 = load i32, ptr %87, align 4
  store i32 %213, ptr %91, align 4
  store i32 %92, ptr %10, align 4
  br label %211, !llvm.loop !13

214:                                              ; preds = %211
  store i32 %93, ptr %97, align 4
  %215 = load i32, ptr %101, align 4
  %216 = sub nsw i32 %215, 1
  store i32 %216, ptr %101, align 4
  %217 = icmp sgt i32 %216, 0
  br i1 %217, label %218, label %219

218:                                              ; preds = %214
  br label %220

219:                                              ; preds = %214
  store i32 %103, ptr %9, align 4
  br label %206

220:                                              ; preds = %218
  br label %168

221:                                              ; preds = %207, %21
  %222 = load i64, ptr %2, align 8
  ret i64 %222
}

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) }

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
