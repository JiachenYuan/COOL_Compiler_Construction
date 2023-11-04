; ModuleID = 'basic_funcs.ll'
source_filename = "basic_funcs.ll"

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
@str.Main = internal constant [5 x i8] c"Main\00"
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %Main* (%Main*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Main* (%Main*, %String*)*), %Main* (%Main*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Main* (%Main*, i32)*), %String* (%Main*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Main*)*), i32 (%Main*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Main*)*), %Object* (%Main*)* @Main_main }
@global_str.1 = internal constant [7 x i8] c"Frugel\00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.2 = internal constant [14 x i8] c"<basic class>\00"
@String.2 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.2, i32 0, i32 0) }
@global_str.0 = internal constant [15 x i8] c"basic_funcs.cl\00"
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
  %vtpm.76.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.76.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.77.i = bitcast i8* %vtpm.76.i to %Main*
  %vtpm.78.i = bitcast i8* %vtpm.76.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.78.i, align 8
  %main.retval = tail call %Object* @Main_main(%Main* nonnull %vtpm.77.i)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %Object* @Main_main(%Main* %self) {
entry:
  %vtpm.2 = icmp eq %Main* %self, null
  br i1 %vtpm.2, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.3 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.4 = load %_Main_vtable*, %_Main_vtable** %vtpm.3, align 8
  %vtpm.5 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.4, i64 0, i32 5
  %tmp.0 = load %String* (%Main*)*, %String* (%Main*)** %vtpm.5, align 8
  %vtpm.6 = tail call %String* %tmp.0(%Main* nonnull %self)
  %vtpm.10 = load %_Main_vtable*, %_Main_vtable** %vtpm.3, align 8
  %vtpm.11 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.10, i64 0, i32 7
  %tmp.1 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.11, align 8
  %vtpm.12 = tail call %Main* %tmp.1(%Main* nonnull %self, %String* %vtpm.6)
  %vtpm.16 = load %_Main_vtable*, %_Main_vtable** %vtpm.3, align 8
  %vtpm.17 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.16, i64 0, i32 8
  %tmp.2 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.17, align 8
  %vtpm.18 = tail call %Main* %tmp.2(%Main* nonnull %self, i32 879)
  %vtpm.22 = load %_Main_vtable*, %_Main_vtable** %vtpm.3, align 8
  %vtpm.23 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.22, i64 0, i32 5
  %tmp.3 = load %String* (%Main*)*, %String* (%Main*)** %vtpm.23, align 8
  %vtpm.24 = tail call %String* %tmp.3(%Main* nonnull %self)
  %vtpm.25 = icmp eq %String* %vtpm.24, null
  br i1 %vtpm.25, label %abort, label %ok.4

ok.4:                                             ; preds = %ok.0
  %vtpm.26 = getelementptr %String, %String* %vtpm.24, i64 0, i32 0
  %vtpm.27 = load %_String_vtable*, %_String_vtable** %vtpm.26, align 8
  %vtpm.28 = getelementptr %_String_vtable, %_String_vtable* %vtpm.27, i64 0, i32 8
  %tmp.4 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.28, align 8
  %vtpm.29 = tail call %String* %tmp.4(%String* nonnull %vtpm.24, %String* nonnull @String.1)
  %vtpm.33 = load %_Main_vtable*, %_Main_vtable** %vtpm.3, align 8
  %vtpm.34 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.33, i64 0, i32 7
  %tmp.5 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.34, align 8
  %vtpm.35 = tail call %Main* %tmp.5(%Main* nonnull %self, %String* %vtpm.29)
  %vtpm.39 = load %_Main_vtable*, %_Main_vtable** %vtpm.3, align 8
  %vtpm.40 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.39, i64 0, i32 5
  %tmp.6 = load %String* (%Main*)*, %String* (%Main*)** %vtpm.40, align 8
  %vtpm.41 = tail call %String* %tmp.6(%Main* nonnull %self)
  %vtpm.42 = icmp eq %String* %vtpm.41, null
  br i1 %vtpm.42, label %abort, label %ok.7

ok.7:                                             ; preds = %ok.4
  %vtpm.43 = getelementptr %String, %String* %vtpm.41, i64 0, i32 0
  %vtpm.44 = load %_String_vtable*, %_String_vtable** %vtpm.43, align 8
  %vtpm.45 = getelementptr %_String_vtable, %_String_vtable* %vtpm.44, i64 0, i32 7
  %tmp.7 = load i32 (%String*)*, i32 (%String*)** %vtpm.45, align 8
  %vtpm.46 = tail call i32 %tmp.7(%String* nonnull %vtpm.41)
  %vtpm.50 = load %_Main_vtable*, %_Main_vtable** %vtpm.3, align 8
  %vtpm.51 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.50, i64 0, i32 8
  %tmp.8 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.51, align 8
  %vtpm.52 = tail call %Main* %tmp.8(%Main* nonnull %self, i32 %vtpm.46)
  %vtpm.56 = load %_Main_vtable*, %_Main_vtable** %vtpm.3, align 8
  %vtpm.57 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.56, i64 0, i32 5
  %tmp.9 = load %String* (%Main*)*, %String* (%Main*)** %vtpm.57, align 8
  %vtpm.58 = tail call %String* %tmp.9(%Main* nonnull %self)
  %vtpm.59 = icmp eq %String* %vtpm.58, null
  br i1 %vtpm.59, label %abort, label %ok.10

ok.10:                                            ; preds = %ok.7
  %vtpm.60 = getelementptr %String, %String* %vtpm.58, i64 0, i32 0
  %vtpm.61 = load %_String_vtable*, %_String_vtable** %vtpm.60, align 8
  %vtpm.62 = getelementptr %_String_vtable, %_String_vtable* %vtpm.61, i64 0, i32 9
  %tmp.10 = load %String* (%String*, i32, i32)*, %String* (%String*, i32, i32)** %vtpm.62, align 8
  %vtpm.63 = tail call %String* %tmp.10(%String* nonnull %vtpm.58, i32 2, i32 2)
  %vtpm.67 = load %_Main_vtable*, %_Main_vtable** %vtpm.3, align 8
  %vtpm.68 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.67, i64 0, i32 7
  %tmp.11 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.68, align 8
  %vtpm.69 = tail call %Main* %tmp.11(%Main* nonnull %self, %String* %vtpm.63)
  %vtpm.71 = bitcast %Main* %self to %Object*
  ret %Object* %vtpm.71

abort:                                            ; preds = %ok.7, %ok.4, %ok.0, %entry
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.76 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.76, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.77 = bitcast i8* %vtpm.76 to %Main*
  %vtpm.78 = bitcast i8* %vtpm.76 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.78, align 8
  ret %Main* %vtpm.77

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}
