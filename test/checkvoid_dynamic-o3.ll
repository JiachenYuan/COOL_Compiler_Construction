; ModuleID = 'checkvoid_dynamic.ll'
source_filename = "checkvoid_dynamic.ll"

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
%_Foo_vtable = type { i32, i32, i8*, %Foo* ()*, %Object* (%Foo*)*, %String* (%Foo*)*, %Foo* (%Foo*)*, %Object* (%Foo*)* }
%Foo = type { %_Foo_vtable* }
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %Object* (%Main*)* }
%Main = type { %_Main_vtable*, %Foo* }

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
@str.Foo = internal constant [4 x i8] c"Foo\00"
@_Foo_vtable_prototype = constant %_Foo_vtable { i32 5, i32 ptrtoint (%Foo* getelementptr (%Foo, %Foo* null, i32 1) to i32), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.Foo, i32 0, i32 0), %Foo* ()* @Foo_new, %Object* (%Foo*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Foo*)*), %String* (%Foo*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Foo*)*), %Foo* (%Foo*)* bitcast (%Object* (%Object*)* @Object_copy to %Foo* (%Foo*)*), %Object* (%Foo*)* @Foo_f }
@str.Main = internal constant [5 x i8] c"Main\00"
@_Main_vtable_prototype = constant %_Main_vtable { i32 6, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %Object* (%Main*)* @Main_main }
@global_str.2 = internal constant [14 x i8] c"<basic class>\00"
@String.2 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.2, i32 0, i32 0) }
@global_str.1 = internal constant [15 x i8] c"Hi from Foo_f\0A\00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [21 x i8] c"checkvoid_dynamic.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @global_str.0, i32 0, i32 0) }

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
  %vtpm.29.i = tail call i8* @malloc(i32 16)
  %malloc.null.i = icmp eq i8* %vtpm.29.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.31.i = bitcast i8* %vtpm.29.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.31.i, align 8
  %vtpm.32.i = getelementptr i8, i8* %vtpm.29.i, i64 8
  %0 = bitcast i8* %vtpm.32.i to %Foo**
  store %Foo* null, %Foo** %0, align 8
  tail call void @abort()
  unreachable
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %Object* @Foo_f(%Foo* nocapture readnone %self) {
entry:
  %vtpm.1 = tail call %IO* @IO_new()
  %vtpm.2 = icmp eq %IO* %vtpm.1, null
  br i1 %vtpm.2, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.3 = getelementptr %IO, %IO* %vtpm.1, i64 0, i32 0
  %vtpm.4 = load %_IO_vtable*, %_IO_vtable** %vtpm.3, align 8
  %vtpm.5 = getelementptr %_IO_vtable, %_IO_vtable* %vtpm.4, i64 0, i32 7
  %tmp.0 = load %IO* (%IO*, %String*)*, %IO* (%IO*, %String*)** %vtpm.5, align 8
  %vtpm.6 = tail call %IO* %tmp.0(%IO* nonnull %vtpm.1, %String* nonnull @String.1)
  %vtpm.7 = bitcast %IO* %vtpm.6 to %Object*
  ret %Object* %vtpm.7

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Foo* @Foo_new() {
entry:
  %vtpm.12 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.12, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.13 = bitcast i8* %vtpm.12 to %Foo*
  %vtpm.14 = bitcast i8* %vtpm.12 to %_Foo_vtable**
  store %_Foo_vtable* @_Foo_vtable_prototype, %_Foo_vtable** %vtpm.14, align 8
  ret %Foo* %vtpm.13

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Object* @Main_main(%Main* nocapture readonly %self) {
entry:
  %vtpm.18 = getelementptr %Main, %Main* %self, i64 0, i32 1
  %vtpm.19 = load %Foo*, %Foo** %vtpm.18, align 8
  %vtpm.20 = icmp eq %Foo* %vtpm.19, null
  br i1 %vtpm.20, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.21 = getelementptr %Foo, %Foo* %vtpm.19, i64 0, i32 0
  %vtpm.22 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.21, align 8
  %vtpm.23 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.22, i64 0, i32 7
  %tmp.0 = load %Object* (%Foo*)*, %Object* (%Foo*)** %vtpm.23, align 8
  %vtpm.24 = tail call %Object* %tmp.0(%Foo* nonnull %vtpm.19)
  ret %Object* %vtpm.24

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.29 = tail call i8* @malloc(i32 16)
  %malloc.null = icmp eq i8* %vtpm.29, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.30 = bitcast i8* %vtpm.29 to %Main*
  %vtpm.31 = bitcast i8* %vtpm.29 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.31, align 8
  %vtpm.32 = getelementptr i8, i8* %vtpm.29, i64 8
  %0 = bitcast i8* %vtpm.32 to %Foo**
  store %Foo* null, %Foo** %0, align 8
  ret %Main* %vtpm.30

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}
