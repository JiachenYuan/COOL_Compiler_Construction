; ModuleID = 'equal4_o.ll'
source_filename = "equal4_o.ll"

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
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %Main* (%Main*, %String*)*, %Main* (%Main*, i32)*, %String* (%Main*)*, i32 (%Main*)*, %Main* (%Main*)* }
%Main = type { %_Main_vtable*, %A*, %A*, %A*, %B* }
%A = type { %_A_vtable*, i32 }
%_A_vtable = type { i32, i32, i8*, %A* ()*, %Object* (%A*)*, %String* (%A*)*, %A* (%A*)* }
%B = type { %_B_vtable*, i32 }
%_B_vtable = type { i32, i32, i8*, %B* ()*, %Object* (%B*)*, %String* (%B*)*, %B* (%B*)* }

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
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %Main* (%Main*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Main* (%Main*, %String*)*), %Main* (%Main*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Main* (%Main*, i32)*), %String* (%Main*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Main*)*), i32 (%Main*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Main*)*), %Main* (%Main*)* @Main_main }
@str.A = internal constant [2 x i8] c"A\00"
@_A_vtable_prototype = constant %_A_vtable { i32 6, i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0), %A* ()* @A_new, %Object* (%A*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%A*)*), %String* (%A*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%A*)*), %A* (%A*)* bitcast (%Object* (%Object*)* @Object_copy to %A* (%A*)*) }
@str.B = internal constant [2 x i8] c"B\00"
@_B_vtable_prototype = constant %_B_vtable { i32 7, i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0), %B* ()* @B_new, %Object* (%B*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%B*)*), %String* (%B*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%B*)*), %B* (%B*)* bitcast (%Object* (%Object*)* @Object_copy to %B* (%B*)*) }
@global_str.3 = internal constant [14 x i8] c"<basic class>\00"
@String.3 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.3, i32 0, i32 0) }
@global_str.2 = internal constant [5 x i8] c"ok!\0A\00"
@String.2 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @global_str.2, i32 0, i32 0) }
@global_str.1 = internal constant [9 x i8] c"not ok!\0A\00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [12 x i8] c"equal4_o.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_str.0, i32 0, i32 0) }

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
  %vtpm.62.i = tail call i8* @malloc(i32 40)
  %malloc.null.i = icmp eq i8* %vtpm.62.i, null
  br i1 %malloc.null.i, label %abort.i, label %okay.i

okay.i:                                           ; preds = %entry
  %vtpm.64.i = bitcast i8* %vtpm.62.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.64.i, align 8
  %vtpm.65.i = getelementptr i8, i8* %vtpm.62.i, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %vtpm.65.i, i8 0, i64 32, i1 false)
  %vtpm.86.i.i = tail call i8* @malloc(i32 16)
  %malloc.null.i.i = icmp eq i8* %vtpm.86.i.i, null
  br i1 %malloc.null.i.i, label %abort.i.i, label %Main_main.exit

abort.i.i:                                        ; preds = %okay.i
  tail call void @abort()
  unreachable

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_main.exit:                                   ; preds = %okay.i
  %vtpm.66.i = getelementptr i8, i8* %vtpm.62.i, i64 16
  %vtpm.63.i = bitcast i8* %vtpm.62.i to %Main*
  %vtpm.88.i.i = bitcast i8* %vtpm.86.i.i to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.88.i.i, align 8
  %vtpm.89.i.i = getelementptr i8, i8* %vtpm.86.i.i, i64 8
  %0 = bitcast i8* %vtpm.89.i.i to i32*
  store i32 2, i32* %0, align 4
  %1 = bitcast i8* %vtpm.65.i to i8**
  store i8* %vtpm.86.i.i, i8** %1, align 8
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(24) %vtpm.66.i, i8 0, i64 24, i1 false)
  %vtpm.40.i = load %_Main_vtable*, %_Main_vtable** %vtpm.64.i, align 8
  %vtpm.41.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.40.i, i64 0, i32 7
  %tmp.1.i = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.41.i, align 8
  %vtpm.42.i = tail call %Main* %tmp.1.i(%Main* nonnull %vtpm.63.i, %String* nonnull @String.2)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %Main* @Main_main(%Main* %self) {
entry:
  %vtpm.5 = getelementptr %Main, %Main* %self, i64 0, i32 1
  %0 = bitcast %A** %vtpm.5 to i8**
  %vtpm.61 = load i8*, i8** %0, align 8
  %vtpm.8 = getelementptr %Main, %Main* %self, i64 0, i32 2
  %1 = bitcast %A** %vtpm.8 to i8**
  %vtpm.92 = load i8*, i8** %1, align 8
  %vtpm.12 = icmp eq i8* %vtpm.61, %vtpm.92
  br i1 %vtpm.12, label %ok.0, label %false.0

ok.0:                                             ; preds = %entry
  %vtpm.15 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.16 = load %_Main_vtable*, %_Main_vtable** %vtpm.15, align 8
  %vtpm.17 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.16, i64 0, i32 7
  %tmp.0 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.17, align 8
  %vtpm.18 = tail call %Main* %tmp.0(%Main* nonnull %self, %String* nonnull @String.1)
  br label %end.0

false.0:                                          ; preds = %entry
  %vtpm.23 = getelementptr %Main, %Main* %self, i64 0, i32 3
  %2 = bitcast %A** %vtpm.23 to i8**
  %vtpm.243 = load i8*, i8** %2, align 8
  %vtpm.27 = icmp eq i8* %vtpm.92, %vtpm.243
  br i1 %vtpm.27, label %true.1, label %ok.3

true.1:                                           ; preds = %false.0
  %vtpm.29 = getelementptr %Main, %Main* %self, i64 0, i32 4
  %3 = bitcast %B** %vtpm.29 to i8**
  %vtpm.304 = load i8*, i8** %3, align 8
  %vtpm.36 = icmp eq i8* %vtpm.304, %vtpm.92
  %vtpm.39 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.40 = load %_Main_vtable*, %_Main_vtable** %vtpm.39, align 8
  %vtpm.41 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.40, i64 0, i32 7
  %tmp.1 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.41, align 8
  br i1 %vtpm.36, label %ok.1, label %ok.2

ok.1:                                             ; preds = %true.1
  %vtpm.42 = tail call %Main* %tmp.1(%Main* nonnull %self, %String* nonnull @String.2)
  br label %end.0

ok.2:                                             ; preds = %true.1
  %vtpm.48 = tail call %Main* %tmp.1(%Main* nonnull %self, %String* nonnull @String.1)
  br label %end.0

ok.3:                                             ; preds = %false.0
  %vtpm.52 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.53 = load %_Main_vtable*, %_Main_vtable** %vtpm.52, align 8
  %vtpm.54 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.53, i64 0, i32 7
  %tmp.3 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.54, align 8
  %vtpm.55 = tail call %Main* %tmp.3(%Main* nonnull %self, %String* nonnull @String.1)
  br label %end.0

end.0:                                            ; preds = %ok.3, %ok.2, %ok.1, %ok.0
  %vtpm.0.0 = phi %Main* [ %vtpm.18, %ok.0 ], [ %vtpm.55, %ok.3 ], [ %vtpm.42, %ok.1 ], [ %vtpm.48, %ok.2 ]
  ret %Main* %vtpm.0.0
}

define %Main* @Main_new() {
entry:
  %vtpm.62 = tail call i8* @malloc(i32 40)
  %malloc.null = icmp eq i8* %vtpm.62, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.64 = bitcast i8* %vtpm.62 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.64, align 8
  %vtpm.65 = getelementptr i8, i8* %vtpm.62, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %vtpm.65, i8 0, i64 32, i1 false)
  %vtpm.86.i = tail call i8* @malloc(i32 16)
  %malloc.null.i = icmp eq i8* %vtpm.86.i, null
  br i1 %malloc.null.i, label %abort.i, label %A_new.exit

abort.i:                                          ; preds = %okay
  tail call void @abort()
  unreachable

A_new.exit:                                       ; preds = %okay
  %vtpm.66 = getelementptr i8, i8* %vtpm.62, i64 16
  %vtpm.63 = bitcast i8* %vtpm.62 to %Main*
  %vtpm.88.i = bitcast i8* %vtpm.86.i to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.88.i, align 8
  %vtpm.89.i = getelementptr i8, i8* %vtpm.86.i, i64 8
  %0 = bitcast i8* %vtpm.89.i to i32*
  store i32 2, i32* %0, align 4
  %1 = bitcast i8* %vtpm.65 to i8**
  store i8* %vtpm.86.i, i8** %1, align 8
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(24) %vtpm.66, i8 0, i64 24, i1 false)
  ret %Main* %vtpm.63

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %A* @A_new() {
entry:
  %vtpm.86 = tail call i8* @malloc(i32 16)
  %malloc.null = icmp eq i8* %vtpm.86, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.87 = bitcast i8* %vtpm.86 to %A*
  %vtpm.88 = bitcast i8* %vtpm.86 to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.88, align 8
  %vtpm.89 = getelementptr i8, i8* %vtpm.86, i64 8
  %0 = bitcast i8* %vtpm.89 to i32*
  store i32 2, i32* %0, align 4
  ret %A* %vtpm.87

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %B* @B_new() {
entry:
  %vtpm.97 = tail call i8* @malloc(i32 16)
  %malloc.null = icmp eq i8* %vtpm.97, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.98 = bitcast i8* %vtpm.97 to %B*
  %vtpm.99 = bitcast i8* %vtpm.97 to %_B_vtable**
  store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.99, align 8
  %vtpm.100 = getelementptr i8, i8* %vtpm.97, i64 8
  %0 = bitcast i8* %vtpm.100 to i32*
  store i32 3, i32* %0, align 4
  ret %B* %vtpm.98

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #0

attributes #0 = { argmemonly nocallback nofree nounwind willreturn writeonly }
