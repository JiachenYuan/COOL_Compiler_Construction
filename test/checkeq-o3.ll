; ModuleID = 'checkeq.ll'
source_filename = "checkeq.ll"

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
%Main = type { %_Main_vtable*, %Object* }

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
@global_str.9 = internal constant [15 x i8] c"\22abc\22 = \22bbc\22\0A\00"
@String.9 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_str.9, i32 0, i32 0) }
@global_str.8 = internal constant [4 x i8] c"bbc\00"
@String.8 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @global_str.8, i32 0, i32 0) }
@global_str.10 = internal constant [16 x i8] c"\22abc\22 != \22bbc\22\0A\00"
@String.10 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.10, i32 0, i32 0) }
@global_str.7 = internal constant [4 x i8] c"abc\00"
@String.7 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @global_str.7, i32 0, i32 0) }
@global_str.6 = internal constant [15 x i8] c"true != false\0A\00"
@String.6 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_str.6, i32 0, i32 0) }
@global_str.5 = internal constant [14 x i8] c"true = false\0A\00"
@String.5 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.5, i32 0, i32 0) }
@global_str.4 = internal constant [8 x i8] c"1 != 0\0A\00"
@String.4 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_str.4, i32 0, i32 0) }
@global_str.3 = internal constant [7 x i8] c"1 = 0\0A\00"
@String.3 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_str.3, i32 0, i32 0) }
@global_str.2 = internal constant [13 x i8] c"self != obj\0A\00"
@String.2 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @global_str.2, i32 0, i32 0) }
@global_str.1 = internal constant [12 x i8] c"self = obj\0A\00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.11 = internal constant [14 x i8] c"<basic class>\00"
@String.11 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.11, i32 0, i32 0) }
@global_str.0 = internal constant [11 x i8] c"checkeq.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @global_str.0, i32 0, i32 0) }

declare void @abort() local_unnamed_addr

declare i8* @malloc(i32) local_unnamed_addr

declare %Object* @Object_abort(%Object*)

declare %String* @Object_type_name(%Object*)

declare %Object* @Object_copy(%Object*)

declare void @Int_init(%Int*, i32) local_unnamed_addr

declare void @Bool_init(%Bool*, i1) local_unnamed_addr

declare i32 @String_length(%String*)

declare %String* @String_concat(%String*, %String*)

declare %String* @String_substr(%String*, i32, i32)

declare %IO* @IO_out_string(%IO*, %String*)

declare %IO* @IO_out_int(%IO*, i32)

declare %String* @IO_in_string(%IO*)

declare i32 @IO_in_int(%IO*)

define i32 @main() local_unnamed_addr {
entry:
  %vtpm.86.i = tail call i8* @malloc(i32 16)
  %malloc.null.i = icmp eq i8* %vtpm.86.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.87.i = bitcast i8* %vtpm.86.i to %Main*
  %vtpm.88.i = bitcast i8* %vtpm.86.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.88.i, align 8
  %vtpm.89.i = getelementptr i8, i8* %vtpm.86.i, i64 8
  %0 = bitcast i8* %vtpm.89.i to %Object**
  store %Object* null, %Object** %0, align 8
  %main.retval = tail call %Object* @Main_main(%Main* nonnull %vtpm.87.i)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %Object* @Main_main(%Main* %self) {
entry:
  %vtpm.7 = getelementptr %Main, %Main* %self, i64 0, i32 1
  %0 = bitcast %Object** %vtpm.7 to i8**
  %vtpm.82 = load i8*, i8** %0, align 8
  %vtpm.9 = bitcast %Main* %self to i8*
  %vtpm.11 = icmp eq i8* %vtpm.82, %vtpm.9
  %vtpm.14 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.15 = load %_Main_vtable*, %_Main_vtable** %vtpm.14, align 8
  %vtpm.16 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.15, i64 0, i32 7
  %tmp.0 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.16, align 8
  %String.1.String.2 = select i1 %vtpm.11, %String* @String.1, %String* @String.2
  %vtpm.23 = tail call %Main* %tmp.0(%Main* nonnull %self, %String* nonnull %String.1.String.2)
  %vtpm.25 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.25, i32 1)
  %vtpm.28 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.28, i32 0)
  %vtpm.31 = icmp eq %Int* %vtpm.25, %vtpm.28
  %String.4.sink = select i1 %vtpm.31, %String* @String.3, %String* @String.4
  %vtpm.40 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.41 = load %_Main_vtable*, %_Main_vtable** %vtpm.40, align 8
  %vtpm.42 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.41, i64 0, i32 7
  %tmp.3 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.42, align 8
  %vtpm.43 = tail call %Main* %tmp.3(%Main* nonnull %self, %String* nonnull %String.4.sink)
  %vtpm.45 = tail call %Bool* @Bool_new()
  tail call void @Bool_init(%Bool* %vtpm.45, i1 true)
  %vtpm.48 = tail call %Bool* @Bool_new()
  tail call void @Bool_init(%Bool* %vtpm.48, i1 false)
  %vtpm.51 = icmp eq %Bool* %vtpm.45, %vtpm.48
  %String.6.sink = select i1 %vtpm.51, %String* @String.5, %String* @String.6
  %vtpm.60 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.61 = load %_Main_vtable*, %_Main_vtable** %vtpm.60, align 8
  %vtpm.62 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.61, i64 0, i32 7
  %tmp.5 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.62, align 8
  %vtpm.63 = tail call %Main* %tmp.5(%Main* nonnull %self, %String* nonnull %String.6.sink)
  %vtpm.76 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.77 = load %_Main_vtable*, %_Main_vtable** %vtpm.76, align 8
  %vtpm.78 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.77, i64 0, i32 7
  %tmp.7 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.78, align 8
  %vtpm.79 = tail call %Main* %tmp.7(%Main* nonnull %self, %String* nonnull @String.10)
  %vtpm.81 = bitcast %Main* %vtpm.79 to %Object*
  ret %Object* %vtpm.81
}

define %Main* @Main_new() {
entry:
  %vtpm.86 = tail call i8* @malloc(i32 16)
  %malloc.null = icmp eq i8* %vtpm.86, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.87 = bitcast i8* %vtpm.86 to %Main*
  %vtpm.88 = bitcast i8* %vtpm.86 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.88, align 8
  %vtpm.89 = getelementptr i8, i8* %vtpm.86, i64 8
  %0 = bitcast i8* %vtpm.89 to %Object**
  store %Object* null, %Object** %0, align 8
  ret %Main* %vtpm.87

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}
