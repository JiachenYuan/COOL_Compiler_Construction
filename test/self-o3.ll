; ModuleID = 'self.ll'
source_filename = "self.ll"

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
%_Alpha_vtable = type { i32, i32, i8*, %Alpha* ()*, %Object* (%Alpha*)*, %String* (%Alpha*)*, %Alpha* (%Alpha*)*, %Alpha* (%Alpha*)* }
%Alpha = type { %_Alpha_vtable* }
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %Alpha* (%Main*)* }
%Main = type { %_Main_vtable* }

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
@str.Alpha = internal constant [6 x i8] c"Alpha\00"
@_Alpha_vtable_prototype = constant %_Alpha_vtable { i32 5, i32 ptrtoint (%Alpha* getelementptr (%Alpha, %Alpha* null, i32 1) to i32), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.Alpha, i32 0, i32 0), %Alpha* ()* @Alpha_new, %Object* (%Alpha*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Alpha*)*), %String* (%Alpha*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Alpha*)*), %Alpha* (%Alpha*)* bitcast (%Object* (%Object*)* @Object_copy to %Alpha* (%Alpha*)*), %Alpha* (%Alpha*)* @Alpha_getSelf }
@str.Main = internal constant [5 x i8] c"Main\00"
@_Main_vtable_prototype = constant %_Main_vtable { i32 6, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %Alpha* (%Main*)* @Main_main }
@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [8 x i8] c"self.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_str.0, i32 0, i32 0) }

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
  %vtpm.21.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.21.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.23.i = bitcast i8* %vtpm.21.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.23.i, align 8
  %vtpm.6.i.i = tail call i8* @malloc(i32 8)
  %malloc.null.i.i = icmp eq i8* %vtpm.6.i.i, null
  br i1 %malloc.null.i.i, label %abort.i.i, label %Main_main.exit

abort.i.i:                                        ; preds = %Main_new.exit
  tail call void @abort()
  unreachable

Main_main.exit:                                   ; preds = %Main_new.exit
  %vtpm.8.i.i = bitcast i8* %vtpm.6.i.i to %_Alpha_vtable**
  store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.8.i.i, align 8
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define %Alpha* @Alpha_getSelf(%Alpha* readnone returned %self) #0 {
entry:
  ret %Alpha* %self
}

define %Alpha* @Alpha_new() {
entry:
  %vtpm.6 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.6, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.7 = bitcast i8* %vtpm.6 to %Alpha*
  %vtpm.8 = bitcast i8* %vtpm.6 to %_Alpha_vtable**
  store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.8, align 8
  ret %Alpha* %vtpm.7

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Alpha* @Main_main(%Main* nocapture readnone %self) {
entry:
  %vtpm.6.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.6.i, null
  br i1 %malloc.null.i, label %abort.i, label %Alpha_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Alpha_new.exit:                                   ; preds = %entry
  %vtpm.7.i = bitcast i8* %vtpm.6.i to %Alpha*
  %vtpm.8.i = bitcast i8* %vtpm.6.i to %_Alpha_vtable**
  store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.8.i, align 8
  ret %Alpha* %vtpm.7.i
}

define %Main* @Main_new() {
entry:
  %vtpm.21 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.21, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.22 = bitcast i8* %vtpm.21 to %Main*
  %vtpm.23 = bitcast i8* %vtpm.21 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.23, align 8
  ret %Main* %vtpm.22

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }