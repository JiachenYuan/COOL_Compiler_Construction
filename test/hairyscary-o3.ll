; ModuleID = 'hairyscary.ll'
source_filename = "hairyscary.ll"

%_Object_vtable = type { i32, i32, i8*, %Object* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)* }
%Object = type { %_Object_vtable* }
%String = type { %_String_vtable*, i8* }
%_String_vtable = type { i32, i32, i8*, %String* ()*, %Object* (%String*)*, %String* (%String*)*, %String* (%String*)*, i32 (%String*)*, %String* (%String*, %String*)*, %String* (%String*, i32, i32)* }
%_Int_vtable = type { i32, i32, i8*, %Int* ()*, %Object* (%Int*)*, %String* (%Int*)*, %Int* (%Int*)* }
%Int = type { %_Int_vtable*, i32 }
%_Bool_vtable = type { i32, i32, i8*, %Bool* ()*, %Object* (%Bool*)*, %String* (%Bool*)*, %Bool* (%Bool*)* }
%Bool = type { %_Bool_vtable*, i1 }
%_IO_vtable = type { i32, i32, i8*, %IO* ()*, %Object* (%IO*)*, %String* (%IO*)*, %IO* (%IO*)*, %IO* (%IO*, %String*)*, %IO* (%IO*, i32)*, %String* (%IO*)*, i32 (%IO*)* }
%IO = type { %_IO_vtable* }
%_Bazz_vtable = type { i32, i32, i8*, %Bazz* ()*, %Object* (%Bazz*)*, %String* (%Bazz*)*, %Bazz* (%Bazz*)*, %Bazz* (%Bazz*, %String*)*, %Bazz* (%Bazz*, i32)*, %String* (%Bazz*)*, i32 (%Bazz*)*, i32 (%Bazz*)*, i32 (%Bazz*)* }
%Bazz = type { %_Bazz_vtable*, i32, %Foo*, %Object* }
%Foo = type { %_Foo_vtable*, i32, %Foo*, %Object*, %Razz*, i32 }
%_Foo_vtable = type { i32, i32, i8*, %Foo* ()*, %Object* (%Foo*)*, %String* (%Foo*)*, %Foo* (%Foo*)*, %Foo* (%Foo*, %String*)*, %Foo* (%Foo*, i32)*, %String* (%Foo*)*, i32 (%Foo*)*, i32 (%Foo*)*, i32 (%Foo*)* }
%Razz = type { %_Razz_vtable*, i32, %Foo*, %Object*, %Razz*, i32, %Bar*, i32 }
%_Razz_vtable = type { i32, i32, i8*, %Razz* ()*, %Object* (%Razz*)*, %String* (%Razz*)*, %Razz* (%Razz*)*, %Razz* (%Razz*, %String*)*, %Razz* (%Razz*, i32)*, %String* (%Razz*)*, i32 (%Razz*)*, i32 (%Razz*)*, i32 (%Razz*)* }
%Bar = type { %_Bar_vtable*, i32, %Foo*, %Object*, %Razz*, i32, %Bar*, i32, i32, %Object* }
%_Bar_vtable = type { i32, i32, i8*, %Bar* ()*, %Object* (%Bar*)*, %String* (%Bar*)*, %Bar* (%Bar*)*, %Bar* (%Bar*, %String*)*, %Bar* (%Bar*, i32)*, %String* (%Bar*)*, i32 (%Bar*)*, i32 (%Bar*)*, i32 (%Bar*)* }
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %String* (%Main*)* }
%Main = type { %_Main_vtable*, %Bazz*, %Foo*, %Razz*, %Bar* }

@str.Object = internal constant [7 x i8] c"Object\00"
@_Object_vtable_prototype = local_unnamed_addr constant %_Object_vtable { i32 0, i32 ptrtoint (%Object* getelementptr (%Object, %Object* null, i32 1) to i32), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.Object, i32 0, i32 0), %Object* ()* @Object_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy }
@str.Int = internal constant [4 x i8] c"Int\00"
@_Int_vtable_prototype = local_unnamed_addr constant %_Int_vtable { i32 1, i32 ptrtoint (%Int* getelementptr (%Int, %Int* null, i32 1) to i32), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.Int, i32 0, i32 0), %Int* ()* @Int_new, %Object* (%Int*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Int*)*), %String* (%Int*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Int*)*), %Int* (%Int*)* bitcast (%Object* (%Object*)* @Object_copy to %Int* (%Int*)*) }
@str.Bool = internal constant [5 x i8] c"Bool\00"
@_Bool_vtable_prototype = local_unnamed_addr constant %_Bool_vtable { i32 2, i32 ptrtoint (%Bool* getelementptr (%Bool, %Bool* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Bool, i32 0, i32 0), %Bool* ()* @Bool_new, %Object* (%Bool*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Bool*)*), %String* (%Bool*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Bool*)*), %Bool* (%Bool*)* bitcast (%Object* (%Object*)* @Object_copy to %Bool* (%Bool*)*) }
@str.String = internal constant [7 x i8] c"String\00"
@_String_vtable_prototype = constant %_String_vtable { i32 3, i32 ptrtoint (%String* getelementptr (%String, %String* null, i32 1) to i32), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.String, i32 0, i32 0), %String* ()* @String_new, %Object* (%String*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%String*)*), %String* (%String*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%String*)*), %String* (%String*)* bitcast (%Object* (%Object*)* @Object_copy to %String* (%String*)*), i32 (%String*)* @String_length, %String* (%String*, %String*)* @String_concat, %String* (%String*, i32, i32)* @String_substr }
@str.IO = internal constant [3 x i8] c"IO\00"
@_IO_vtable_prototype = local_unnamed_addr constant %_IO_vtable { i32 4, i32 ptrtoint (%IO* getelementptr (%IO, %IO* null, i32 1) to i32), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.IO, i32 0, i32 0), %IO* ()* @IO_new, %Object* (%IO*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%IO*)*), %String* (%IO*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%IO*)*), %IO* (%IO*)* bitcast (%Object* (%Object*)* @Object_copy to %IO* (%IO*)*), %IO* (%IO*, %String*)* @IO_out_string, %IO* (%IO*, i32)* @IO_out_int, %String* (%IO*)* @IO_in_string, i32 (%IO*)* @IO_in_int }
@str.Bazz = internal constant [5 x i8] c"Bazz\00"
@_Bazz_vtable_prototype = constant %_Bazz_vtable { i32 5, i32 ptrtoint (%Bazz* getelementptr (%Bazz, %Bazz* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Bazz, i32 0, i32 0), %Bazz* ()* @Bazz_new, %Object* (%Bazz*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Bazz*)*), %String* (%Bazz*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Bazz*)*), %Bazz* (%Bazz*)* bitcast (%Object* (%Object*)* @Object_copy to %Bazz* (%Bazz*)*), %Bazz* (%Bazz*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Bazz* (%Bazz*, %String*)*), %Bazz* (%Bazz*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Bazz* (%Bazz*, i32)*), %String* (%Bazz*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Bazz*)*), i32 (%Bazz*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Bazz*)*), i32 (%Bazz*)* @Bazz_printh, i32 (%Bazz*)* @Bazz_doh }
@str.Foo = internal constant [4 x i8] c"Foo\00"
@_Foo_vtable_prototype = constant %_Foo_vtable { i32 6, i32 ptrtoint (%Foo* getelementptr (%Foo, %Foo* null, i32 1) to i32), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.Foo, i32 0, i32 0), %Foo* ()* @Foo_new, %Object* (%Foo*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Foo*)*), %String* (%Foo*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Foo*)*), %Foo* (%Foo*)* bitcast (%Object* (%Object*)* @Object_copy to %Foo* (%Foo*)*), %Foo* (%Foo*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Foo* (%Foo*, %String*)*), %Foo* (%Foo*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Foo* (%Foo*, i32)*), %String* (%Foo*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Foo*)*), i32 (%Foo*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Foo*)*), i32 (%Foo*)* bitcast (i32 (%Bazz*)* @Bazz_printh to i32 (%Foo*)*), i32 (%Foo*)* @Foo_doh }
@str.Razz = internal constant [5 x i8] c"Razz\00"
@_Razz_vtable_prototype = constant %_Razz_vtable { i32 7, i32 ptrtoint (%Razz* getelementptr (%Razz, %Razz* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Razz, i32 0, i32 0), %Razz* ()* @Razz_new, %Object* (%Razz*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Razz*)*), %String* (%Razz*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Razz*)*), %Razz* (%Razz*)* bitcast (%Object* (%Object*)* @Object_copy to %Razz* (%Razz*)*), %Razz* (%Razz*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Razz* (%Razz*, %String*)*), %Razz* (%Razz*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Razz* (%Razz*, i32)*), %String* (%Razz*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Razz*)*), i32 (%Razz*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Razz*)*), i32 (%Razz*)* bitcast (i32 (%Bazz*)* @Bazz_printh to i32 (%Razz*)*), i32 (%Razz*)* bitcast (i32 (%Foo*)* @Foo_doh to i32 (%Razz*)*) }
@str.Bar = internal constant [4 x i8] c"Bar\00"
@_Bar_vtable_prototype = constant %_Bar_vtable { i32 8, i32 ptrtoint (%Bar* getelementptr (%Bar, %Bar* null, i32 1) to i32), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.Bar, i32 0, i32 0), %Bar* ()* @Bar_new, %Object* (%Bar*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Bar*)*), %String* (%Bar*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Bar*)*), %Bar* (%Bar*)* bitcast (%Object* (%Object*)* @Object_copy to %Bar* (%Bar*)*), %Bar* (%Bar*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Bar* (%Bar*, %String*)*), %Bar* (%Bar*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Bar* (%Bar*, i32)*), %String* (%Bar*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Bar*)*), i32 (%Bar*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Bar*)*), i32 (%Bar*)* bitcast (i32 (%Bazz*)* @Bazz_printh to i32 (%Bar*)*), i32 (%Bar*)* bitcast (i32 (%Foo*)* @Foo_doh to i32 (%Bar*)*) }
@str.Main = internal constant [5 x i8] c"Main\00"
@_Main_vtable_prototype = constant %_Main_vtable { i32 9, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %String* (%Main*)* @Main_main }
@global_str.2 = internal constant [14 x i8] c"<basic class>\00"
@String.2 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.2, i32 0, i32 0) }
@global_str.1 = internal constant [11 x i8] c"do nothing\00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [14 x i8] c"hairyscary.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.0, i32 0, i32 0) }

declare void @abort() local_unnamed_addr

declare i8* @malloc(i32) local_unnamed_addr

declare %Object* @Object_abort(%Object*)

declare %String* @Object_type_name(%Object*)

declare %Object* @Object_copy(%Object*)

declare void @Int_init(%Int*, i32) local_unnamed_addr

declare i32 @String_length(%String*)

declare %String* @String_concat(%String*, %String*)

declare %String* @String_substr(%String*, i32, i32)

declare %IO* @IO_out_string(%IO*, %String*)

declare %IO* @IO_out_int(%IO*, i32)

declare %String* @IO_in_string(%IO*)

declare i32 @IO_in_int(%IO*)

define i32 @main() local_unnamed_addr {
entry:
  %main.obj = tail call %Main* @Main_new()
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define i32 @Bazz_doh(%Bazz* nocapture %self) #0 {
entry:
  %vtpm.3 = getelementptr %Bazz, %Bazz* %self, i64 0, i32 1
  %vtpm.4 = load i32, i32* %vtpm.3, align 4
  %vtpm.8 = add i32 %vtpm.4, 1
  store i32 %vtpm.8, i32* %vtpm.3, align 4
  ret i32 %vtpm.4
}

define i32 @Bazz_printh(%Bazz* %self) {
entry:
  %vtpm.18 = icmp eq %Bazz* %self, null
  br i1 %vtpm.18, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.15 = getelementptr %Bazz, %Bazz* %self, i64 0, i32 1
  %vtpm.16 = load i32, i32* %vtpm.15, align 4
  %vtpm.19 = getelementptr %Bazz, %Bazz* %self, i64 0, i32 0
  %vtpm.20 = load %_Bazz_vtable*, %_Bazz_vtable** %vtpm.19, align 8
  %vtpm.21 = getelementptr %_Bazz_vtable, %_Bazz_vtable* %vtpm.20, i64 0, i32 8
  %tmp.0 = load %Bazz* (%Bazz*, i32)*, %Bazz* (%Bazz*, i32)** %vtpm.21, align 8
  %vtpm.22 = tail call %Bazz* %tmp.0(%Bazz* nonnull %self, i32 %vtpm.16)
  ret i32 0

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Bazz* @Bazz_new() {
entry:
  %vtpm.31 = tail call i8* @malloc(i32 32)
  %malloc.null = icmp eq i8* %vtpm.31, null
  br i1 %malloc.null, label %abort, label %case.exit.0

case.exit.0:                                      ; preds = %entry
  %vtpm.33 = bitcast i8* %vtpm.31 to %_Bazz_vtable**
  store %_Bazz_vtable* @_Bazz_vtable_prototype, %_Bazz_vtable** %vtpm.33, align 8
  %vtpm.34 = getelementptr i8, i8* %vtpm.31, i64 8
  %0 = bitcast i8* %vtpm.34 to i32*
  %vtpm.35 = getelementptr i8, i8* %vtpm.31, i64 16
  %1 = bitcast i8* %vtpm.35 to %Foo**
  %vtpm.36 = getelementptr i8, i8* %vtpm.31, i64 24
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %vtpm.35, i8 0, i64 16, i1 false)
  store i32 1, i32* %0, align 4
  %vtpm.63 = tail call %Foo* @Foo_new()
  store %Foo* %vtpm.63, %Foo** %1, align 8
  %vtpm.32 = bitcast i8* %vtpm.31 to %Bazz*
  %vtpm.70 = load %_Bazz_vtable*, %_Bazz_vtable** %vtpm.33, align 8
  %vtpm.71 = getelementptr %_Bazz_vtable, %_Bazz_vtable* %vtpm.70, i64 0, i32 11
  %tmp.3 = load i32 (%Bazz*)*, i32 (%Bazz*)** %vtpm.71, align 8
  %vtpm.72 = tail call i32 %tmp.3(%Bazz* nonnull %vtpm.32)
  %vtpm.75 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.75, i32 %vtpm.72)
  %2 = bitcast i8* %vtpm.36 to %Int**
  store %Int* %vtpm.75, %Int** %2, align 8
  ret %Bazz* %vtpm.32

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define i32 @Foo_doh(%Foo* nocapture %self) #0 {
entry:
  %vtpm.82 = getelementptr %Foo, %Foo* %self, i64 0, i32 1
  %vtpm.83 = load i32, i32* %vtpm.82, align 4
  %vtpm.87 = add i32 %vtpm.83, 2
  store i32 %vtpm.87, i32* %vtpm.82, align 4
  ret i32 %vtpm.83
}

define %Foo* @Foo_new() {
entry:
  %vtpm.102 = tail call i8* @malloc(i32 48)
  %vtpm.103 = bitcast i8* %vtpm.102 to %Foo*
  %malloc.null = icmp eq i8* %vtpm.102, null
  br i1 %malloc.null, label %abort, label %case.exit.0

case.exit.0:                                      ; preds = %entry
  %vtpm.104 = bitcast i8* %vtpm.102 to %_Foo_vtable**
  store %_Foo_vtable* @_Foo_vtable_prototype, %_Foo_vtable** %vtpm.104, align 8
  %vtpm.105 = getelementptr i8, i8* %vtpm.102, i64 8
  %0 = bitcast i8* %vtpm.105 to i32*
  %vtpm.106 = getelementptr i8, i8* %vtpm.102, i64 16
  %1 = bitcast i8* %vtpm.106 to %Foo**
  %vtpm.107 = getelementptr i8, i8* %vtpm.102, i64 24
  %vtpm.108 = getelementptr i8, i8* %vtpm.102, i64 32
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(28) %vtpm.106, i8 0, i64 28, i1 false)
  store i32 1, i32* %0, align 4
  %vtpm.131 = tail call %Razz* @Razz_new()
  %2 = bitcast i8* %vtpm.106 to %Razz**
  store %Razz* %vtpm.131, %Razz** %2, align 8
  %vtpm.143 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.104, align 8
  %vtpm.144 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.143, i64 0, i32 11
  %tmp.4 = load i32 (%Foo*)*, i32 (%Foo*)** %vtpm.144, align 8
  %vtpm.145 = tail call i32 %tmp.4(%Foo* nonnull %vtpm.103)
  %vtpm.148 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.148, i32 %vtpm.145)
  %3 = bitcast i8* %vtpm.107 to %Int**
  store %Int* %vtpm.148, %Int** %3, align 8
  %vtpm.154 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.104, align 8
  %vtpm.155 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.154, i64 0, i32 0
  %vtpm.156 = load i32, i32* %vtpm.155, align 4
  %.not7 = icmp eq i32 %vtpm.156, 8
  br i1 %.not7, label %case.exit.1.thread, label %case.7.1

case.exit.1.thread:                               ; preds = %case.exit.0
  %vtpm.159 = bitcast i8* %vtpm.102 to %Bar*
  %4 = bitcast i8* %vtpm.108 to i8**
  store i8* %vtpm.102, i8** %4, align 8
  br label %ok.3

case.7.1:                                         ; preds = %case.exit.0
  %5 = add i32 %vtpm.156, -9
  %6 = icmp ult i32 %5, -2
  br i1 %6, label %case.6.1, label %src_lte_mc.7.1

src_lte_mc.7.1:                                   ; preds = %case.7.1
  %vtpm.166 = tail call %Bar* @Bar_new()
  br label %case.exit.1

case.6.1:                                         ; preds = %case.7.1
  %.not = icmp eq i32 %5, -3
  br i1 %.not, label %src_lte_mc.6.1, label %abort

src_lte_mc.6.1:                                   ; preds = %case.6.1
  %vtpm.171 = tail call %Razz* @Razz_new()
  %vtpm.172 = bitcast %Razz* %vtpm.171 to %Bar*
  br label %case.exit.1

case.exit.1:                                      ; preds = %src_lte_mc.6.1, %src_lte_mc.7.1
  %tmp.1.0 = phi %Bar* [ %vtpm.172, %src_lte_mc.6.1 ], [ %vtpm.166, %src_lte_mc.7.1 ]
  %7 = bitcast i8* %vtpm.108 to %Bar**
  store %Bar* %tmp.1.0, %Bar** %7, align 8
  %vtpm.180 = icmp eq %Bar* %tmp.1.0, null
  br i1 %vtpm.180, label %abort, label %ok.3

ok.3:                                             ; preds = %case.exit.1.thread, %case.exit.1
  %tmp.1.010 = phi %Bar* [ %vtpm.159, %case.exit.1.thread ], [ %tmp.1.0, %case.exit.1 ]
  %vtpm.175 = bitcast %Bar* %tmp.1.010 to %Razz*
  %vtpm.181 = bitcast %Bar* %tmp.1.010 to %_Razz_vtable**
  %vtpm.182 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.181, align 8
  %vtpm.183 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.182, i64 0, i32 12
  %tmp.7 = load i32 (%Razz*)*, i32 (%Razz*)** %vtpm.183, align 8
  %vtpm.184 = tail call i32 %tmp.7(%Razz* nonnull %vtpm.175)
  %vtpm.187 = load %Foo*, %Foo** %1, align 8
  %vtpm.188 = icmp eq %Foo* %vtpm.187, null
  br i1 %vtpm.188, label %abort, label %ok.4

ok.4:                                             ; preds = %ok.3
  %vtpm.109 = getelementptr i8, i8* %vtpm.102, i64 40
  %8 = bitcast i8* %vtpm.109 to i32*
  %vtpm.189 = getelementptr %Foo, %Foo* %vtpm.187, i64 0, i32 0
  %vtpm.190 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.189, align 8
  %vtpm.191 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.190, i64 0, i32 12
  %tmp.8 = load i32 (%Foo*)*, i32 (%Foo*)** %vtpm.191, align 8
  %vtpm.192 = tail call i32 %tmp.8(%Foo* nonnull %vtpm.187)
  %vtpm.197 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.104, align 8
  %vtpm.198 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.197, i64 0, i32 12
  %tmp.9 = load i32 (%Foo*)*, i32 (%Foo*)** %vtpm.198, align 8
  %vtpm.199 = tail call i32 %tmp.9(%Foo* nonnull %vtpm.103)
  %vtpm.193 = add i32 %vtpm.192, %vtpm.184
  %vtpm.200 = add i32 %vtpm.193, %vtpm.199
  %vtpm.204 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.104, align 8
  %vtpm.205 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.204, i64 0, i32 11
  %tmp.10 = load i32 (%Foo*)*, i32 (%Foo*)** %vtpm.205, align 8
  %vtpm.206 = tail call i32 %tmp.10(%Foo* nonnull %vtpm.103)
  %vtpm.207 = add i32 %vtpm.200, %vtpm.206
  store i32 %vtpm.207, i32* %8, align 4
  ret %Foo* %vtpm.103

abort:                                            ; preds = %case.6.1, %ok.3, %case.exit.1, %entry
  tail call void @abort()
  unreachable
}

define %Razz* @Razz_new() {
entry:
  %vtpm.223 = tail call i8* @malloc(i32 64)
  %vtpm.224 = bitcast i8* %vtpm.223 to %Razz*
  %malloc.null = icmp eq i8* %vtpm.223, null
  br i1 %malloc.null, label %abort, label %case.exit.0

case.exit.0:                                      ; preds = %entry
  %vtpm.225 = bitcast i8* %vtpm.223 to %_Razz_vtable**
  store %_Razz_vtable* @_Razz_vtable_prototype, %_Razz_vtable** %vtpm.225, align 8
  %vtpm.226 = getelementptr i8, i8* %vtpm.223, i64 8
  %0 = bitcast i8* %vtpm.226 to i32*
  %vtpm.227 = getelementptr i8, i8* %vtpm.223, i64 16
  %1 = bitcast i8* %vtpm.227 to %Foo**
  %vtpm.228 = getelementptr i8, i8* %vtpm.223, i64 24
  %vtpm.229 = getelementptr i8, i8* %vtpm.223, i64 32
  %2 = bitcast i8* %vtpm.229 to %Razz**
  %vtpm.230 = getelementptr i8, i8* %vtpm.223, i64 40
  %3 = bitcast i8* %vtpm.230 to i32*
  %vtpm.231 = getelementptr i8, i8* %vtpm.223, i64 48
  %4 = bitcast i8* %vtpm.231 to %Bar**
  store %Bar* null, %Bar** %4, align 8
  %vtpm.232 = getelementptr i8, i8* %vtpm.223, i64 56
  %5 = bitcast i8* %vtpm.232 to i32*
  store i32 0, i32* %5, align 4
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(28) %vtpm.227, i8 0, i64 28, i1 false)
  store i32 1, i32* %0, align 4
  %vtpm.249 = tail call %Bar* @Bar_new()
  %6 = bitcast i8* %vtpm.227 to %Bar**
  store %Bar* %vtpm.249, %Bar** %6, align 8
  %vtpm.266 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.225, align 8
  %vtpm.267 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.266, i64 0, i32 11
  %tmp.5 = load i32 (%Razz*)*, i32 (%Razz*)** %vtpm.267, align 8
  %vtpm.268 = tail call i32 %tmp.5(%Razz* nonnull %vtpm.224)
  %vtpm.271 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.271, i32 %vtpm.268)
  %7 = bitcast i8* %vtpm.228 to %Int**
  store %Int* %vtpm.271, %Int** %7, align 8
  %vtpm.277 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.225, align 8
  %vtpm.278 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.277, i64 0, i32 0
  %vtpm.279 = load i32, i32* %vtpm.278, align 4
  %.not9 = icmp eq i32 %vtpm.279, 8
  br i1 %.not9, label %case.exit.1.thread, label %case.7.1

case.exit.1.thread:                               ; preds = %case.exit.0
  %vtpm.282 = bitcast i8* %vtpm.223 to %Bar*
  %8 = bitcast i8* %vtpm.229 to i8**
  store i8* %vtpm.223, i8** %8, align 8
  br label %ok.3

case.7.1:                                         ; preds = %case.exit.0
  %9 = add i32 %vtpm.279, -9
  %10 = icmp ult i32 %9, -2
  br i1 %10, label %case.6.1, label %src_lte_mc.7.1

src_lte_mc.7.1:                                   ; preds = %case.7.1
  %vtpm.288 = tail call %Bar* @Bar_new()
  br label %case.exit.1

case.6.1:                                         ; preds = %case.7.1
  %.not = icmp eq i32 %9, -3
  br i1 %.not, label %src_lte_mc.6.1, label %abort

src_lte_mc.6.1:                                   ; preds = %case.6.1
  %vtpm.294 = tail call %Razz* @Razz_new()
  %vtpm.295 = bitcast %Razz* %vtpm.294 to %Bar*
  br label %case.exit.1

case.exit.1:                                      ; preds = %src_lte_mc.6.1, %src_lte_mc.7.1
  %tmp.1.0 = phi %Bar* [ %vtpm.295, %src_lte_mc.6.1 ], [ %vtpm.288, %src_lte_mc.7.1 ]
  %11 = bitcast i8* %vtpm.229 to %Bar**
  store %Bar* %tmp.1.0, %Bar** %11, align 8
  %vtpm.303 = icmp eq %Bar* %tmp.1.0, null
  br i1 %vtpm.303, label %abort, label %ok.3

ok.3:                                             ; preds = %case.exit.1.thread, %case.exit.1
  %tmp.1.013 = phi %Bar* [ %vtpm.282, %case.exit.1.thread ], [ %tmp.1.0, %case.exit.1 ]
  %vtpm.298 = bitcast %Bar* %tmp.1.013 to %Razz*
  %vtpm.304 = bitcast %Bar* %tmp.1.013 to %_Razz_vtable**
  %vtpm.305 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.304, align 8
  %vtpm.306 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.305, i64 0, i32 12
  %tmp.8 = load i32 (%Razz*)*, i32 (%Razz*)** %vtpm.306, align 8
  %vtpm.307 = tail call i32 %tmp.8(%Razz* nonnull %vtpm.298)
  %vtpm.310 = load %Foo*, %Foo** %1, align 8
  %vtpm.311 = icmp eq %Foo* %vtpm.310, null
  br i1 %vtpm.311, label %abort, label %ok.4

ok.4:                                             ; preds = %ok.3
  %vtpm.312 = getelementptr %Foo, %Foo* %vtpm.310, i64 0, i32 0
  %vtpm.313 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.312, align 8
  %vtpm.314 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.313, i64 0, i32 12
  %tmp.9 = load i32 (%Foo*)*, i32 (%Foo*)** %vtpm.314, align 8
  %vtpm.315 = tail call i32 %tmp.9(%Foo* nonnull %vtpm.310)
  %vtpm.320 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.225, align 8
  %vtpm.321 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.320, i64 0, i32 12
  %tmp.10 = load i32 (%Razz*)*, i32 (%Razz*)** %vtpm.321, align 8
  %vtpm.322 = tail call i32 %tmp.10(%Razz* nonnull %vtpm.224)
  %vtpm.316 = add i32 %vtpm.315, %vtpm.307
  %vtpm.323 = add i32 %vtpm.316, %vtpm.322
  %vtpm.327 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.225, align 8
  %vtpm.328 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.327, i64 0, i32 11
  %tmp.11 = load i32 (%Razz*)*, i32 (%Razz*)** %vtpm.328, align 8
  %vtpm.329 = tail call i32 %tmp.11(%Razz* nonnull %vtpm.224)
  %vtpm.330 = add i32 %vtpm.323, %vtpm.329
  store i32 %vtpm.330, i32* %3, align 4
  %vtpm.336 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.225, align 8
  %vtpm.337 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.336, i64 0, i32 0
  %vtpm.338 = load i32, i32* %vtpm.337, align 4
  %.not10 = icmp eq i32 %vtpm.338, 8
  br i1 %.not10, label %src_lte_mc.8.2, label %case.7.2

src_lte_mc.8.2:                                   ; preds = %ok.4
  %vtpm.341 = bitcast i8* %vtpm.223 to %Bar*
  br label %case.exit.2

case.7.2:                                         ; preds = %ok.4
  %12 = add i32 %vtpm.338, -9
  %13 = icmp ult i32 %12, -2
  br i1 %13, label %abort, label %src_lte_mc.7.2

src_lte_mc.7.2:                                   ; preds = %case.7.2
  %vtpm.345 = tail call %Bar* @Bar_new()
  br label %case.exit.2

case.exit.2:                                      ; preds = %src_lte_mc.7.2, %src_lte_mc.8.2
  %tmp.2.0 = phi %Bar* [ %vtpm.345, %src_lte_mc.7.2 ], [ %vtpm.341, %src_lte_mc.8.2 ]
  store %Bar* %tmp.2.0, %Bar** %4, align 8
  %vtpm.351 = load %Razz*, %Razz** %2, align 8
  %vtpm.352 = icmp eq %Razz* %vtpm.351, null
  br i1 %vtpm.352, label %abort, label %ok.8

ok.8:                                             ; preds = %case.exit.2
  %14 = getelementptr %Razz, %Razz* %vtpm.351, i64 0, i32 1
  %vtpm.4.i = load i32, i32* %14, align 4
  %vtpm.8.i = add i32 %vtpm.4.i, 1
  store i32 %vtpm.8.i, i32* %14, align 4
  %vtpm.358 = load %Foo*, %Foo** %1, align 8
  %vtpm.359 = icmp eq %Foo* %vtpm.358, null
  br i1 %vtpm.359, label %abort, label %ok.9

ok.9:                                             ; preds = %ok.8
  %vtpm.360 = getelementptr %Foo, %Foo* %vtpm.358, i64 0, i32 0
  %vtpm.361 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.360, align 8
  %vtpm.362 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.361, i64 0, i32 12
  %tmp.15 = load i32 (%Foo*)*, i32 (%Foo*)** %vtpm.362, align 8
  %vtpm.363 = tail call i32 %tmp.15(%Foo* nonnull %vtpm.358)
  %vtpm.367 = load %Bar*, %Bar** %4, align 8
  %vtpm.368 = icmp eq %Bar* %vtpm.367, null
  br i1 %vtpm.368, label %abort, label %ok.10

ok.10:                                            ; preds = %ok.9
  %vtpm.369 = getelementptr %Bar, %Bar* %vtpm.367, i64 0, i32 0
  %vtpm.370 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.369, align 8
  %vtpm.371 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.370, i64 0, i32 12
  %tmp.16 = load i32 (%Bar*)*, i32 (%Bar*)** %vtpm.371, align 8
  %vtpm.372 = tail call i32 %tmp.16(%Bar* nonnull %vtpm.367)
  %vtpm.377 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.225, align 8
  %vtpm.378 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.377, i64 0, i32 12
  %tmp.17 = load i32 (%Razz*)*, i32 (%Razz*)** %vtpm.378, align 8
  %vtpm.379 = tail call i32 %tmp.17(%Razz* nonnull %vtpm.224)
  %vtpm.364 = add i32 %vtpm.363, %vtpm.4.i
  %vtpm.373 = add i32 %vtpm.364, %vtpm.372
  %vtpm.380 = add i32 %vtpm.373, %vtpm.379
  %vtpm.384 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.225, align 8
  %vtpm.385 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.384, i64 0, i32 11
  %tmp.18 = load i32 (%Razz*)*, i32 (%Razz*)** %vtpm.385, align 8
  %vtpm.386 = tail call i32 %tmp.18(%Razz* nonnull %vtpm.224)
  %vtpm.387 = add i32 %vtpm.380, %vtpm.386
  store i32 %vtpm.387, i32* %5, align 4
  ret %Razz* %vtpm.224

abort:                                            ; preds = %case.7.2, %case.6.1, %ok.9, %ok.8, %case.exit.2, %ok.3, %case.exit.1, %entry
  tail call void @abort()
  unreachable
}

define %Bar* @Bar_new() {
entry:
  %vtpm.403 = tail call i8* @malloc(i32 72)
  %vtpm.404 = bitcast i8* %vtpm.403 to %Bar*
  %malloc.null = icmp eq i8* %vtpm.403, null
  br i1 %malloc.null, label %abort, label %Bazz_printh.exit

Bazz_printh.exit:                                 ; preds = %entry
  %vtpm.405 = bitcast i8* %vtpm.403 to %_Bar_vtable**
  store %_Bar_vtable* @_Bar_vtable_prototype, %_Bar_vtable** %vtpm.405, align 8
  %vtpm.406 = getelementptr i8, i8* %vtpm.403, i64 8
  %0 = bitcast i8* %vtpm.406 to i32*
  %vtpm.407 = getelementptr i8, i8* %vtpm.403, i64 16
  %1 = bitcast i8* %vtpm.407 to %Foo**
  %vtpm.408 = getelementptr i8, i8* %vtpm.403, i64 24
  %vtpm.409 = getelementptr i8, i8* %vtpm.403, i64 32
  %2 = bitcast i8* %vtpm.409 to %Razz**
  %vtpm.410 = getelementptr i8, i8* %vtpm.403, i64 40
  %3 = bitcast i8* %vtpm.410 to i32*
  %vtpm.411 = getelementptr i8, i8* %vtpm.403, i64 48
  %4 = bitcast i8* %vtpm.411 to %Bar**
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(20) %vtpm.408, i8 0, i64 20, i1 false)
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(24) %vtpm.411, i8 0, i64 24, i1 false)
  store i32 1, i32* %0, align 4
  %5 = bitcast i8* %vtpm.407 to i8**
  store i8* %vtpm.403, i8** %5, align 8
  %6 = bitcast i8* %vtpm.403 to %IO*
  %vtpm.22.i = tail call %IO* @IO_out_int(%IO* nonnull %6, i32 1)
  %vtpm.453 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.453, i32 0)
  %7 = bitcast i8* %vtpm.408 to %Int**
  store %Int* %vtpm.453, %Int** %7, align 8
  %vtpm.459 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.405, align 8
  %vtpm.460 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.459, i64 0, i32 0
  %vtpm.461 = load i32, i32* %vtpm.460, align 4
  %.not9 = icmp eq i32 %vtpm.461, 8
  br i1 %.not9, label %case.exit.1.thread, label %case.7.1

case.exit.1.thread:                               ; preds = %Bazz_printh.exit
  %8 = bitcast i8* %vtpm.409 to i8**
  store i8* %vtpm.403, i8** %8, align 8
  br label %ok.3

case.7.1:                                         ; preds = %Bazz_printh.exit
  %9 = add i32 %vtpm.461, -9
  %10 = icmp ult i32 %9, -2
  br i1 %10, label %case.6.1, label %src_lte_mc.7.1

src_lte_mc.7.1:                                   ; preds = %case.7.1
  %vtpm.470 = tail call %Bar* @Bar_new()
  br label %case.exit.1

case.6.1:                                         ; preds = %case.7.1
  %.not = icmp eq i32 %9, -3
  br i1 %.not, label %src_lte_mc.6.1, label %abort

src_lte_mc.6.1:                                   ; preds = %case.6.1
  %vtpm.476 = tail call %Razz* @Razz_new()
  %vtpm.477 = bitcast %Razz* %vtpm.476 to %Bar*
  br label %case.exit.1

case.exit.1:                                      ; preds = %src_lte_mc.6.1, %src_lte_mc.7.1
  %tmp.1.0 = phi %Bar* [ %vtpm.477, %src_lte_mc.6.1 ], [ %vtpm.470, %src_lte_mc.7.1 ]
  %11 = bitcast i8* %vtpm.409 to %Bar**
  store %Bar* %tmp.1.0, %Bar** %11, align 8
  %vtpm.485 = icmp eq %Bar* %tmp.1.0, null
  br i1 %vtpm.485, label %abort, label %ok.3

ok.3:                                             ; preds = %case.exit.1.thread, %case.exit.1
  %tmp.1.013 = phi %Bar* [ %vtpm.404, %case.exit.1.thread ], [ %tmp.1.0, %case.exit.1 ]
  %vtpm.480 = bitcast %Bar* %tmp.1.013 to %Razz*
  %vtpm.486 = bitcast %Bar* %tmp.1.013 to %_Razz_vtable**
  %vtpm.487 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.486, align 8
  %vtpm.488 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.487, i64 0, i32 12
  %tmp.8 = load i32 (%Razz*)*, i32 (%Razz*)** %vtpm.488, align 8
  %vtpm.489 = tail call i32 %tmp.8(%Razz* nonnull %vtpm.480)
  %vtpm.492 = load %Foo*, %Foo** %1, align 8
  %vtpm.493 = icmp eq %Foo* %vtpm.492, null
  br i1 %vtpm.493, label %abort, label %ok.4

ok.4:                                             ; preds = %ok.3
  %vtpm.494 = getelementptr %Foo, %Foo* %vtpm.492, i64 0, i32 0
  %vtpm.495 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.494, align 8
  %vtpm.496 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.495, i64 0, i32 12
  %tmp.9 = load i32 (%Foo*)*, i32 (%Foo*)** %vtpm.496, align 8
  %vtpm.497 = tail call i32 %tmp.9(%Foo* nonnull %vtpm.492)
  %vtpm.502 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.405, align 8
  %vtpm.503 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.502, i64 0, i32 12
  %tmp.10 = load i32 (%Bar*)*, i32 (%Bar*)** %vtpm.503, align 8
  %vtpm.504 = tail call i32 %tmp.10(%Bar* nonnull %vtpm.404)
  %vtpm.498 = add i32 %vtpm.497, %vtpm.489
  %vtpm.505 = add i32 %vtpm.498, %vtpm.504
  %vtpm.509 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.405, align 8
  %vtpm.510 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.509, i64 0, i32 11
  %tmp.11 = load i32 (%Bar*)*, i32 (%Bar*)** %vtpm.510, align 8
  %vtpm.511 = tail call i32 %tmp.11(%Bar* nonnull %vtpm.404)
  %vtpm.512 = add i32 %vtpm.505, %vtpm.511
  store i32 %vtpm.512, i32* %3, align 4
  %vtpm.518 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.405, align 8
  %vtpm.519 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.518, i64 0, i32 0
  %vtpm.520 = load i32, i32* %vtpm.519, align 4
  %.not10 = icmp eq i32 %vtpm.520, 8
  br i1 %.not10, label %case.exit.2, label %case.7.2

case.7.2:                                         ; preds = %ok.4
  %12 = add i32 %vtpm.520, -9
  %13 = icmp ult i32 %12, -2
  br i1 %13, label %abort, label %src_lte_mc.7.2

src_lte_mc.7.2:                                   ; preds = %case.7.2
  %vtpm.527 = tail call %Bar* @Bar_new()
  br label %case.exit.2

case.exit.2:                                      ; preds = %ok.4, %src_lte_mc.7.2
  %tmp.2.0 = phi %Bar* [ %vtpm.527, %src_lte_mc.7.2 ], [ %vtpm.404, %ok.4 ]
  store %Bar* %tmp.2.0, %Bar** %4, align 8
  %vtpm.533 = load %Razz*, %Razz** %2, align 8
  %vtpm.534 = icmp eq %Razz* %vtpm.533, null
  br i1 %vtpm.534, label %abort, label %ok.8

ok.8:                                             ; preds = %case.exit.2
  %14 = getelementptr %Razz, %Razz* %vtpm.533, i64 0, i32 1
  %vtpm.4.i = load i32, i32* %14, align 4
  %vtpm.8.i = add i32 %vtpm.4.i, 1
  store i32 %vtpm.8.i, i32* %14, align 4
  %vtpm.540 = load %Foo*, %Foo** %1, align 8
  %vtpm.541 = icmp eq %Foo* %vtpm.540, null
  br i1 %vtpm.541, label %abort, label %ok.9

ok.9:                                             ; preds = %ok.8
  %vtpm.542 = getelementptr %Foo, %Foo* %vtpm.540, i64 0, i32 0
  %vtpm.543 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.542, align 8
  %vtpm.544 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.543, i64 0, i32 12
  %tmp.15 = load i32 (%Foo*)*, i32 (%Foo*)** %vtpm.544, align 8
  %vtpm.545 = tail call i32 %tmp.15(%Foo* nonnull %vtpm.540)
  %vtpm.549 = load %Bar*, %Bar** %4, align 8
  %vtpm.550 = icmp eq %Bar* %vtpm.549, null
  br i1 %vtpm.550, label %abort, label %ok.10

ok.10:                                            ; preds = %ok.9
  %vtpm.414 = getelementptr i8, i8* %vtpm.403, i64 64
  %vtpm.413 = getelementptr i8, i8* %vtpm.403, i64 60
  %15 = bitcast i8* %vtpm.413 to i32*
  %vtpm.412 = getelementptr i8, i8* %vtpm.403, i64 56
  %16 = bitcast i8* %vtpm.412 to i32*
  %vtpm.551 = getelementptr %Bar, %Bar* %vtpm.549, i64 0, i32 0
  %vtpm.552 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.551, align 8
  %vtpm.553 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.552, i64 0, i32 12
  %tmp.16 = load i32 (%Bar*)*, i32 (%Bar*)** %vtpm.553, align 8
  %vtpm.554 = tail call i32 %tmp.16(%Bar* nonnull %vtpm.549)
  %vtpm.559 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.405, align 8
  %vtpm.560 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.559, i64 0, i32 12
  %tmp.17 = load i32 (%Bar*)*, i32 (%Bar*)** %vtpm.560, align 8
  %vtpm.561 = tail call i32 %tmp.17(%Bar* nonnull %vtpm.404)
  %vtpm.546 = add i32 %vtpm.545, %vtpm.4.i
  %vtpm.555 = add i32 %vtpm.546, %vtpm.554
  %vtpm.562 = add i32 %vtpm.555, %vtpm.561
  %vtpm.566 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.405, align 8
  %vtpm.567 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.566, i64 0, i32 11
  %tmp.18 = load i32 (%Bar*)*, i32 (%Bar*)** %vtpm.567, align 8
  %vtpm.568 = tail call i32 %tmp.18(%Bar* nonnull %vtpm.404)
  %vtpm.569 = add i32 %vtpm.562, %vtpm.568
  store i32 %vtpm.569, i32* %16, align 4
  %vtpm.576 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.405, align 8
  %vtpm.577 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.576, i64 0, i32 12
  %tmp.19 = load i32 (%Bar*)*, i32 (%Bar*)** %vtpm.577, align 8
  %vtpm.578 = tail call i32 %tmp.19(%Bar* nonnull %vtpm.404)
  store i32 %vtpm.578, i32* %15, align 4
  %vtpm.585 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.405, align 8
  %vtpm.586 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.585, i64 0, i32 11
  %tmp.20 = load i32 (%Bar*)*, i32 (%Bar*)** %vtpm.586, align 8
  %vtpm.587 = tail call i32 %tmp.20(%Bar* nonnull %vtpm.404)
  %vtpm.590 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.590, i32 %vtpm.587)
  %17 = bitcast i8* %vtpm.414 to %Int**
  store %Int* %vtpm.590, %Int** %17, align 8
  ret %Bar* %vtpm.404

abort:                                            ; preds = %case.7.2, %case.6.1, %ok.9, %ok.8, %case.exit.2, %ok.3, %case.exit.1, %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define nonnull %String* @Main_main(%Main* nocapture readnone %self) #1 {
entry:
  ret %String* @String.1
}

define %Main* @Main_new() {
entry:
  %vtpm.599 = tail call i8* @malloc(i32 40)
  %malloc.null = icmp eq i8* %vtpm.599, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.601 = bitcast i8* %vtpm.599 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.601, align 8
  %vtpm.602 = getelementptr i8, i8* %vtpm.599, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %vtpm.602, i8 0, i64 32, i1 false)
  %vtpm.31.i = tail call i8* @malloc(i32 32)
  %malloc.null.i = icmp eq i8* %vtpm.31.i, null
  br i1 %malloc.null.i, label %abort.i, label %Bazz_new.exit

abort.i:                                          ; preds = %okay
  tail call void @abort()
  unreachable

Bazz_new.exit:                                    ; preds = %okay
  %vtpm.605 = getelementptr i8, i8* %vtpm.599, i64 32
  %0 = bitcast i8* %vtpm.605 to %Bar**
  %vtpm.604 = getelementptr i8, i8* %vtpm.599, i64 24
  %1 = bitcast i8* %vtpm.604 to %Razz**
  %vtpm.603 = getelementptr i8, i8* %vtpm.599, i64 16
  %2 = bitcast i8* %vtpm.603 to %Foo**
  %vtpm.600 = bitcast i8* %vtpm.599 to %Main*
  %vtpm.33.i = bitcast i8* %vtpm.31.i to %_Bazz_vtable**
  store %_Bazz_vtable* @_Bazz_vtable_prototype, %_Bazz_vtable** %vtpm.33.i, align 8
  %vtpm.34.i = getelementptr i8, i8* %vtpm.31.i, i64 8
  %3 = bitcast i8* %vtpm.34.i to i32*
  %vtpm.35.i = getelementptr i8, i8* %vtpm.31.i, i64 16
  %4 = bitcast i8* %vtpm.35.i to %Foo**
  %vtpm.36.i = getelementptr i8, i8* %vtpm.31.i, i64 24
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %vtpm.35.i, i8 0, i64 16, i1 false)
  store i32 1, i32* %3, align 4
  %vtpm.63.i = tail call %Foo* @Foo_new()
  store %Foo* %vtpm.63.i, %Foo** %4, align 8
  %vtpm.32.i = bitcast i8* %vtpm.31.i to %Bazz*
  %vtpm.70.i = load %_Bazz_vtable*, %_Bazz_vtable** %vtpm.33.i, align 8
  %vtpm.71.i = getelementptr %_Bazz_vtable, %_Bazz_vtable* %vtpm.70.i, i64 0, i32 11
  %tmp.3.i = load i32 (%Bazz*)*, i32 (%Bazz*)** %vtpm.71.i, align 8
  %vtpm.72.i = tail call i32 %tmp.3.i(%Bazz* nonnull %vtpm.32.i)
  %vtpm.75.i = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.75.i, i32 %vtpm.72.i)
  %5 = bitcast i8* %vtpm.36.i to %Int**
  store %Int* %vtpm.75.i, %Int** %5, align 8
  %6 = bitcast i8* %vtpm.602 to i8**
  store i8* %vtpm.31.i, i8** %6, align 8
  %vtpm.611 = tail call %Foo* @Foo_new()
  store %Foo* %vtpm.611, %Foo** %2, align 8
  %vtpm.615 = tail call %Razz* @Razz_new()
  store %Razz* %vtpm.615, %Razz** %1, align 8
  %vtpm.619 = tail call %Bar* @Bar_new()
  store %Bar* %vtpm.619, %Bar** %0, align 8
  ret %Main* %vtpm.600

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn }
attributes #1 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn writeonly }
