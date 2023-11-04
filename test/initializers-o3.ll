; ModuleID = 'initializers.ll'
source_filename = "initializers.ll"

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
%Main = type { %_Main_vtable*, %Main*, i32 }

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
@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [16 x i8] c"initializers.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.0, i32 0, i32 0) }

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
  %vtpm.15.i = tail call i8* @malloc(i32 24)
  %malloc.null.i = icmp eq i8* %vtpm.15.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_main.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_main.exit:                                   ; preds = %entry
  %vtpm.17.i = bitcast i8* %vtpm.15.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.17.i, align 8
  %vtpm.18.i = getelementptr i8, i8* %vtpm.15.i, i64 8
  %0 = bitcast i8* %vtpm.18.i to %Main**
  store %Main* null, %Main** %0, align 8
  %vtpm.19.i = getelementptr i8, i8* %vtpm.15.i, i64 16
  %1 = bitcast i8* %vtpm.19.i to i32*
  store i32 0, i32* %1, align 4
  %vtpm.16.i = bitcast i8* %vtpm.15.i to %Main*
  %2 = bitcast i8* %vtpm.15.i to %IO*
  %vtpm.29.i = tail call %IO* @IO_out_int(%IO* nonnull %2, i32 0)
  %3 = bitcast i8* %vtpm.18.i to %IO**
  store %IO* %vtpm.29.i, %IO** %3, align 8
  store i32 12, i32* %1, align 4
  %vtpm.7.i = load %_Main_vtable*, %_Main_vtable** %vtpm.17.i, align 8
  %vtpm.8.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.7.i, i64 0, i32 8
  %tmp.0.i = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.8.i, align 8
  %vtpm.9.i = tail call %Main* %tmp.0.i(%Main* nonnull %vtpm.16.i, i32 12)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %Object* @Main_main(%Main* %self) {
entry:
  %vtpm.5 = icmp eq %Main* %self, null
  br i1 %vtpm.5, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.2 = getelementptr %Main, %Main* %self, i64 0, i32 2
  %vtpm.3 = load i32, i32* %vtpm.2, align 4
  %vtpm.6 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.7 = load %_Main_vtable*, %_Main_vtable** %vtpm.6, align 8
  %vtpm.8 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.7, i64 0, i32 8
  %tmp.0 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.8, align 8
  %vtpm.9 = tail call %Main* %tmp.0(%Main* nonnull %self, i32 %vtpm.3)
  %vtpm.10 = bitcast %Main* %vtpm.9 to %Object*
  ret %Object* %vtpm.10

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.15 = tail call i8* @malloc(i32 24)
  %malloc.null = icmp eq i8* %vtpm.15, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.17 = bitcast i8* %vtpm.15 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.17, align 8
  %vtpm.18 = getelementptr i8, i8* %vtpm.15, i64 8
  %0 = bitcast i8* %vtpm.18 to %Main**
  store %Main* null, %Main** %0, align 8
  %vtpm.19 = getelementptr i8, i8* %vtpm.15, i64 16
  %1 = bitcast i8* %vtpm.19 to i32*
  store i32 0, i32* %1, align 4
  %vtpm.16 = bitcast i8* %vtpm.15 to %Main*
  %2 = bitcast i8* %vtpm.15 to %IO*
  %vtpm.29 = tail call %IO* @IO_out_int(%IO* nonnull %2, i32 0)
  %3 = bitcast i8* %vtpm.18 to %IO**
  store %IO* %vtpm.29, %IO** %3, align 8
  store i32 12, i32* %1, align 4
  ret %Main* %vtpm.16

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}
