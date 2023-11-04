; ModuleID = 'dispatch3_o.ll'
source_filename = "dispatch3_o.ll"

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
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %Main* (%Main*, %String*)*, %Main* (%Main*, i32)*, %String* (%Main*)*, i32 (%Main*)*, i32 (%Main*)*, %Object* (%Main*)* }
%Main = type { %_Main_vtable* }
%_Beta_vtable = type { i32, i32, i8*, %Beta* ()*, %Object* (%Beta*)*, %String* (%Beta*)*, %Beta* (%Beta*)*, i32 (%Beta*)*, i32 (%Beta*)* }
%Beta = type { %_Beta_vtable* }
%_Alpha_vtable = type { i32, i32, i8*, %Alpha* ()*, %Object* (%Alpha*)*, %String* (%Alpha*)*, %Alpha* (%Alpha*)*, i32 (%Alpha*)*, i32 (%Alpha*)* }
%Alpha = type { %_Alpha_vtable* }

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
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %Main* (%Main*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Main* (%Main*, %String*)*), %Main* (%Main*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Main* (%Main*, i32)*), %String* (%Main*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Main*)*), i32 (%Main*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Main*)*), i32 (%Main*)* @Main_func, %Object* (%Main*)* @Main_main }
@str.Beta = internal constant [5 x i8] c"Beta\00"
@_Beta_vtable_prototype = constant %_Beta_vtable { i32 6, i32 ptrtoint (%Beta* getelementptr (%Beta, %Beta* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Beta, i32 0, i32 0), %Beta* ()* @Beta_new, %Object* (%Beta*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Beta*)*), %String* (%Beta*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Beta*)*), %Beta* (%Beta*)* bitcast (%Object* (%Object*)* @Object_copy to %Beta* (%Beta*)*), i32 (%Beta*)* @Beta_niam, i32 (%Beta*)* @Beta_bugger }
@str.Alpha = internal constant [6 x i8] c"Alpha\00"
@_Alpha_vtable_prototype = constant %_Alpha_vtable { i32 7, i32 ptrtoint (%Alpha* getelementptr (%Alpha, %Alpha* null, i32 1) to i32), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.Alpha, i32 0, i32 0), %Alpha* ()* @Alpha_new, %Object* (%Alpha*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Alpha*)*), %String* (%Alpha*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Alpha*)*), %Alpha* (%Alpha*)* bitcast (%Object* (%Object*)* @Object_copy to %Alpha* (%Alpha*)*), i32 (%Alpha*)* bitcast (i32 (%Beta*)* @Beta_niam to i32 (%Alpha*)*), i32 (%Alpha*)* bitcast (i32 (%Beta*)* @Beta_bugger to i32 (%Alpha*)*) }
@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [15 x i8] c"dispatch3_o.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_str.0, i32 0, i32 0) }

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
  %vtpm.27.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.27.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_main.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_main.exit:                                   ; preds = %entry
  %vtpm.29.i = bitcast i8* %vtpm.27.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.29.i, align 8
  %vtpm.47.i.i = tail call i8* @malloc(i32 8)
  %malloc.null.i.i = icmp eq i8* %vtpm.47.i.i, null
  br i1 %malloc.null.i.i, label %abort.i.i, label %Main_func.exit

abort.i.i:                                        ; preds = %Main_main.exit
  tail call void @abort()
  unreachable

Main_func.exit:                                   ; preds = %Main_main.exit
  %vtpm.28.i = bitcast i8* %vtpm.27.i to %Main*
  %vtpm.49.i.i = bitcast i8* %vtpm.47.i.i to %_Alpha_vtable**
  store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.49.i.i, align 8
  %vtpm.18.i = load %_Main_vtable*, %_Main_vtable** %vtpm.29.i, align 8
  %vtpm.19.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.18.i, i64 0, i32 8
  %tmp.1.i = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.19.i, align 8
  %vtpm.20.i = tail call %Main* %tmp.1.i(%Main* nonnull %vtpm.28.i, i32 57)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define i32 @Main_func(%Main* nocapture readnone %self) {
entry:
  %vtpm.47.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.47.i, null
  br i1 %malloc.null.i, label %abort.i, label %Alpha_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Alpha_new.exit:                                   ; preds = %entry
  %vtpm.49.i = bitcast i8* %vtpm.47.i to %_Alpha_vtable**
  store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.49.i, align 8
  ret i32 57
}

define %Object* @Main_main(%Main* %self) {
entry:
  %vtpm.10 = icmp eq %Main* %self, null
  br i1 %vtpm.10, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.11 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.12 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.13 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.12, i64 0, i32 11
  %tmp.0 = load i32 (%Main*)*, i32 (%Main*)** %vtpm.13, align 8
  %vtpm.14 = tail call i32 %tmp.0(%Main* nonnull %self)
  %vtpm.18 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.19 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.18, i64 0, i32 8
  %tmp.1 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.19, align 8
  %vtpm.20 = tail call %Main* %tmp.1(%Main* nonnull %self, i32 %vtpm.14)
  %vtpm.22 = bitcast %Main* %self to %Object*
  ret %Object* %vtpm.22

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.27 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.27, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.28 = bitcast i8* %vtpm.27 to %Main*
  %vtpm.29 = bitcast i8* %vtpm.27 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.29, align 8
  ret %Main* %vtpm.28

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @Beta_bugger(%Beta* nocapture readnone %self) #0 {
entry:
  ret i32 57
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @Beta_niam(%Beta* nocapture readnone %self) #0 {
entry:
  ret i32 42
}

define %Beta* @Beta_new() {
entry:
  %vtpm.38 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.38, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.39 = bitcast i8* %vtpm.38 to %Beta*
  %vtpm.40 = bitcast i8* %vtpm.38 to %_Beta_vtable**
  store %_Beta_vtable* @_Beta_vtable_prototype, %_Beta_vtable** %vtpm.40, align 8
  ret %Beta* %vtpm.39

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @Alpha_niam(%Alpha* nocapture readnone %self) local_unnamed_addr #0 {
entry:
  ret i32 90
}

define %Alpha* @Alpha_new() {
entry:
  %vtpm.47 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.47, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.48 = bitcast i8* %vtpm.47 to %Alpha*
  %vtpm.49 = bitcast i8* %vtpm.47 to %_Alpha_vtable**
  store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.49, align 8
  ret %Alpha* %vtpm.48

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
