; ModuleID = 'attr2o.ll'
source_filename = "attr2o.ll"

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
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %Main* (%Main*, %String*)*, %Main* (%Main*, i32)*, %String* (%Main*)*, i32 (%Main*)*, %Object* (%Main*)* }
%Main = type { %_Main_vtable*, %Alpha* }
%Alpha = type { %_Alpha_vtable*, i32 }
%_Alpha_vtable = type { i32, i32, i8*, %Alpha* ()*, %Object* (%Alpha*)*, %String* (%Alpha*)*, %Alpha* (%Alpha*)*, i32 (%Alpha*)* }

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
@str.Main = internal constant [5 x i8] c"Main\00"
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %Main* (%Main*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Main* (%Main*, %String*)*), %Main* (%Main*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Main* (%Main*, i32)*), %String* (%Main*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Main*)*), i32 (%Main*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Main*)*), %Object* (%Main*)* @Main_main }
@str.Alpha = internal constant [6 x i8] c"Alpha\00"
@_Alpha_vtable_prototype = constant %_Alpha_vtable { i32 6, i32 ptrtoint (%Alpha* getelementptr (%Alpha, %Alpha* null, i32 1) to i32), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.Alpha, i32 0, i32 0), %Alpha* ()* @Alpha_new, %Object* (%Alpha*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Alpha*)*), %String* (%Alpha*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Alpha*)*), %Alpha* (%Alpha*)* bitcast (%Object* (%Object*)* @Object_copy to %Alpha* (%Alpha*)*), i32 (%Alpha*)* @Alpha_getX }
@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [10 x i8] c"attr2o.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @global_str.0, i32 0, i32 0) }

declare void @abort() local_unnamed_addr

declare i8* @malloc(i32) local_unnamed_addr

declare %Object* @Object_abort(%Object*)

declare %String* @Object_type_name(%Object*)

declare %Object* @Object_copy(%Object*)

declare i32 @String_length(%String*)

declare %String* @String_concat(%String*, %String*)

declare %String* @String_substr(%String*, i32, i32)

declare %IO* @IO_out_string(%IO*, %String*)

declare %IO* @IO_out_int(%IO*, i32)

declare %String* @IO_in_string(%IO*)

declare i32 @IO_in_int(%IO*)

define i32 @main() local_unnamed_addr {
entry:
  %vtpm.21.i = tail call i8* @malloc(i32 16)
  %malloc.null.i = icmp eq i8* %vtpm.21.i, null
  br i1 %malloc.null.i, label %abort.i, label %okay.i

okay.i:                                           ; preds = %entry
  %vtpm.23.i = bitcast i8* %vtpm.21.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.23.i, align 8
  %vtpm.24.i = getelementptr i8, i8* %vtpm.21.i, i64 8
  %0 = bitcast i8* %vtpm.24.i to %Alpha**
  store %Alpha* null, %Alpha** %0, align 8
  %vtpm.38.i.i = tail call i8* @malloc(i32 16)
  %malloc.null.i.i = icmp eq i8* %vtpm.38.i.i, null
  br i1 %malloc.null.i.i, label %abort.i.i, label %Main_new.exit

abort.i.i:                                        ; preds = %okay.i
  tail call void @abort()
  unreachable

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %okay.i
  %vtpm.40.i.i = bitcast i8* %vtpm.38.i.i to %_Alpha_vtable**
  store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.40.i.i, align 8
  %vtpm.41.i.i = getelementptr i8, i8* %vtpm.38.i.i, i64 8
  %1 = bitcast i8* %vtpm.41.i.i to i32*
  store i32 67, i32* %1, align 4
  %2 = bitcast i8* %vtpm.24.i to i8**
  store i8* %vtpm.38.i.i, i8** %2, align 8
  %vtpm.3.i.cast = bitcast i8* %vtpm.38.i.i to %Alpha*
  %vtpm.22.i = bitcast i8* %vtpm.21.i to %Main*
  %vtpm.6.i = load %_Alpha_vtable*, %_Alpha_vtable** %vtpm.40.i.i, align 8
  %vtpm.7.i = getelementptr %_Alpha_vtable, %_Alpha_vtable* %vtpm.6.i, i64 0, i32 7
  %tmp.0.i = load i32 (%Alpha*)*, i32 (%Alpha*)** %vtpm.7.i, align 8
  %vtpm.8.i = tail call i32 %tmp.0.i(%Alpha* nonnull %vtpm.3.i.cast)
  %vtpm.12.i = load %_Main_vtable*, %_Main_vtable** %vtpm.23.i, align 8
  %vtpm.13.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.12.i, i64 0, i32 8
  %tmp.1.i = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.13.i, align 8
  %vtpm.14.i = tail call %Main* %tmp.1.i(%Main* nonnull %vtpm.22.i, i32 %vtpm.8.i)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %Object* @Main_main(%Main* %self) {
entry:
  %vtpm.2 = getelementptr %Main, %Main* %self, i64 0, i32 1
  %vtpm.3 = load %Alpha*, %Alpha** %vtpm.2, align 8
  %vtpm.4 = icmp eq %Alpha* %vtpm.3, null
  br i1 %vtpm.4, label %abort, label %ok.1

ok.1:                                             ; preds = %entry
  %vtpm.5 = getelementptr %Alpha, %Alpha* %vtpm.3, i64 0, i32 0
  %vtpm.6 = load %_Alpha_vtable*, %_Alpha_vtable** %vtpm.5, align 8
  %vtpm.7 = getelementptr %_Alpha_vtable, %_Alpha_vtable* %vtpm.6, i64 0, i32 7
  %tmp.0 = load i32 (%Alpha*)*, i32 (%Alpha*)** %vtpm.7, align 8
  %vtpm.8 = tail call i32 %tmp.0(%Alpha* nonnull %vtpm.3)
  %vtpm.11 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.12 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.13 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.12, i64 0, i32 8
  %tmp.1 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.13, align 8
  %vtpm.14 = tail call %Main* %tmp.1(%Main* nonnull %self, i32 %vtpm.8)
  %vtpm.16 = bitcast %Main* %self to %Object*
  ret %Object* %vtpm.16

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.21 = tail call i8* @malloc(i32 16)
  %malloc.null = icmp eq i8* %vtpm.21, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.23 = bitcast i8* %vtpm.21 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.23, align 8
  %vtpm.24 = getelementptr i8, i8* %vtpm.21, i64 8
  %0 = bitcast i8* %vtpm.24 to %Alpha**
  store %Alpha* null, %Alpha** %0, align 8
  %vtpm.38.i = tail call i8* @malloc(i32 16)
  %malloc.null.i = icmp eq i8* %vtpm.38.i, null
  br i1 %malloc.null.i, label %abort.i, label %Alpha_new.exit

abort.i:                                          ; preds = %okay
  tail call void @abort()
  unreachable

Alpha_new.exit:                                   ; preds = %okay
  %vtpm.22 = bitcast i8* %vtpm.21 to %Main*
  %vtpm.40.i = bitcast i8* %vtpm.38.i to %_Alpha_vtable**
  store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.40.i, align 8
  %vtpm.41.i = getelementptr i8, i8* %vtpm.38.i, i64 8
  %1 = bitcast i8* %vtpm.41.i to i32*
  store i32 67, i32* %1, align 4
  %2 = bitcast i8* %vtpm.24 to i8**
  store i8* %vtpm.38.i, i8** %2, align 8
  ret %Main* %vtpm.22

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn
define i32 @Alpha_getX(%Alpha* nocapture readonly %self) #0 {
entry:
  %vtpm.32 = getelementptr %Alpha, %Alpha* %self, i64 0, i32 1
  %vtpm.33 = load i32, i32* %vtpm.32, align 4
  ret i32 %vtpm.33
}

define %Alpha* @Alpha_new() {
entry:
  %vtpm.38 = tail call i8* @malloc(i32 16)
  %malloc.null = icmp eq i8* %vtpm.38, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.39 = bitcast i8* %vtpm.38 to %Alpha*
  %vtpm.40 = bitcast i8* %vtpm.38 to %_Alpha_vtable**
  store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.40, align 8
  %vtpm.41 = getelementptr i8, i8* %vtpm.38, i64 8
  %0 = bitcast i8* %vtpm.41 to i32*
  store i32 67, i32* %0, align 4
  ret %Alpha* %vtpm.39

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn }
