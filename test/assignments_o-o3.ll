; ModuleID = 'assignments_o.ll'
source_filename = "assignments_o.ll"

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
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %Main* (%Main*, %String*)*, %Main* (%Main*, i32)*, %String* (%Main*)*, i32 (%Main*)*, i32 (%Main*, i32)*, %Object* (%Main*)* }
%Main = type { %_Main_vtable*, i32 }

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
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %Main* (%Main*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Main* (%Main*, %String*)*), %Main* (%Main*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Main* (%Main*, i32)*), %String* (%Main*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Main*)*), i32 (%Main*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Main*)*), i32 (%Main*, i32)* @Main_foo, %Object* (%Main*)* @Main_main }
@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [17 x i8] c"assignments_o.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @global_str.0, i32 0, i32 0) }

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
  %vtpm.43.i = tail call i8* @malloc(i32 16)
  %malloc.null.i = icmp eq i8* %vtpm.43.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_foo.exit12

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_foo.exit12:                                  ; preds = %entry
  %vtpm.44.i = bitcast i8* %vtpm.43.i to %Main*
  %vtpm.45.i = bitcast i8* %vtpm.43.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.45.i, align 8
  %vtpm.46.i = getelementptr i8, i8* %vtpm.43.i, i64 8
  %0 = bitcast i8* %vtpm.46.i to i32*
  store i32 0, i32* %0, align 4
  %vtpm.13.i9 = tail call i32 @Main_foo(%Main* nonnull %vtpm.44.i, i32 8)
  %vtpm.16.i = add i32 %vtpm.13.i9, 26
  store i32 %vtpm.16.i, i32* %0, align 4
  %vtpm.34.i = load %_Main_vtable*, %_Main_vtable** %vtpm.45.i, align 8
  %vtpm.35.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.34.i, i64 0, i32 8
  %tmp.1.i = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.35.i, align 8
  %vtpm.36.i = tail call %Main* %tmp.1.i(%Main* nonnull %vtpm.44.i, i32 %vtpm.16.i)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define i32 @Main_foo(%Main* %self, i32 %x) {
entry:
  %vtpm.4 = icmp slt i32 %x, 10
  br i1 %vtpm.4, label %true.0, label %end.0

true.0:                                           ; preds = %entry
  %vtpm.9 = icmp eq %Main* %self, null
  br i1 %vtpm.9, label %abort, label %ok.0

ok.0:                                             ; preds = %true.0
  %vtpm.7 = add nsw i32 %x, 1
  %vtpm.10 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.11 = load %_Main_vtable*, %_Main_vtable** %vtpm.10, align 8
  %vtpm.12 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.11, i64 0, i32 11
  %tmp.0 = load i32 (%Main*, i32)*, i32 (%Main*, i32)** %vtpm.12, align 8
  %vtpm.13 = tail call i32 %tmp.0(%Main* nonnull %self, i32 %vtpm.7)
  %vtpm.16 = add i32 %vtpm.7, %vtpm.13
  br label %end.0

end.0:                                            ; preds = %entry, %ok.0
  %vtpm.0.0 = phi i32 [ %vtpm.16, %ok.0 ], [ 1, %entry ]
  ret i32 %vtpm.0.0

abort:                                            ; preds = %true.0
  tail call void @abort()
  unreachable
}

define %Object* @Main_main(%Main* %self) {
entry:
  %vtpm.21 = icmp eq %Main* %self, null
  br i1 %vtpm.21, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.22 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.23 = load %_Main_vtable*, %_Main_vtable** %vtpm.22, align 8
  %vtpm.24 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.23, i64 0, i32 11
  %tmp.0 = load i32 (%Main*, i32)*, i32 (%Main*, i32)** %vtpm.24, align 8
  %vtpm.25 = tail call i32 %tmp.0(%Main* nonnull %self, i32 4)
  %vtpm.27 = getelementptr %Main, %Main* %self, i64 0, i32 1
  store i32 %vtpm.25, i32* %vtpm.27, align 4
  %vtpm.34 = load %_Main_vtable*, %_Main_vtable** %vtpm.22, align 8
  %vtpm.35 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.34, i64 0, i32 8
  %tmp.1 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.35, align 8
  %vtpm.36 = tail call %Main* %tmp.1(%Main* nonnull %self, i32 %vtpm.25)
  %vtpm.38 = bitcast %Main* %self to %Object*
  ret %Object* %vtpm.38

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.43 = tail call i8* @malloc(i32 16)
  %malloc.null = icmp eq i8* %vtpm.43, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.44 = bitcast i8* %vtpm.43 to %Main*
  %vtpm.45 = bitcast i8* %vtpm.43 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.45, align 8
  %vtpm.46 = getelementptr i8, i8* %vtpm.43, i64 8
  %0 = bitcast i8* %vtpm.46 to i32*
  store i32 0, i32* %0, align 4
  ret %Main* %vtpm.44

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}
