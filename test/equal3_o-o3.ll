; ModuleID = 'equal3_o.ll'
source_filename = "equal3_o.ll"

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
%Main = type { %_Main_vtable*, %A*, %A*, %A* }
%A = type { %_A_vtable*, i32 }
%_A_vtable = type { i32, i32, i8*, %A* ()*, %Object* (%A*)*, %String* (%A*)*, %A* (%A*)* }

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
@global_str.2 = internal constant [5 x i8] c"ok!\0A\00"
@String.2 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @global_str.2, i32 0, i32 0) }
@global_str.1 = internal constant [9 x i8] c"not ok!\0A\00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.3 = internal constant [14 x i8] c"<basic class>\00"
@String.3 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.3, i32 0, i32 0) }
@global_str.0 = internal constant [12 x i8] c"equal3_o.cl\00"
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
  %vtpm.45.i = tail call i8* @malloc(i32 32)
  %malloc.null.i = icmp eq i8* %vtpm.45.i, null
  br i1 %malloc.null.i, label %abort.i, label %okay.i

okay.i:                                           ; preds = %entry
  %vtpm.47.i = bitcast i8* %vtpm.45.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.47.i, align 8
  %vtpm.48.i = getelementptr i8, i8* %vtpm.45.i, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(24) %vtpm.48.i, i8 0, i64 24, i1 false)
  %vtpm.61.i.i = tail call i8* @malloc(i32 16)
  %malloc.null.i.i = icmp eq i8* %vtpm.61.i.i, null
  br i1 %malloc.null.i.i, label %abort.i.i, label %A_new.exit.i

abort.i.i:                                        ; preds = %okay.i
  tail call void @abort()
  unreachable

A_new.exit.i:                                     ; preds = %okay.i
  %vtpm.63.i.i = bitcast i8* %vtpm.61.i.i to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.63.i.i, align 8
  %vtpm.64.i.i = getelementptr i8, i8* %vtpm.61.i.i, i64 8
  %0 = bitcast i8* %vtpm.64.i.i to i32*
  store i32 2, i32* %0, align 4
  %1 = bitcast i8* %vtpm.48.i to i8**
  store i8* %vtpm.61.i.i, i8** %1, align 8
  %vtpm.61.i1.i = tail call i8* @malloc(i32 16)
  %malloc.null.i2.i = icmp eq i8* %vtpm.61.i1.i, null
  br i1 %malloc.null.i2.i, label %abort.i6.i, label %Main_new.exit

abort.i6.i:                                       ; preds = %A_new.exit.i
  tail call void @abort()
  unreachable

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %A_new.exit.i
  %vtpm.49.i = getelementptr i8, i8* %vtpm.45.i, i64 16
  %vtpm.46.i = bitcast i8* %vtpm.45.i to %Main*
  %vtpm.63.i4.i = bitcast i8* %vtpm.61.i1.i to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.63.i4.i, align 8
  %vtpm.64.i5.i = getelementptr i8, i8* %vtpm.61.i1.i, i64 8
  %2 = bitcast i8* %vtpm.64.i5.i to i32*
  store i32 2, i32* %2, align 4
  %3 = bitcast i8* %vtpm.49.i to i8**
  store i8* %vtpm.61.i1.i, i8** %3, align 8
  %vtpm.51.i = load i8*, i8** %1, align 8
  %vtpm.11.i = icmp eq i8* %vtpm.51.i, %vtpm.61.i1.i
  br i1 %vtpm.11.i, label %ok.0.i, label %false.0.i

ok.0.i:                                           ; preds = %Main_new.exit
  %vtpm.15.i = load %_Main_vtable*, %_Main_vtable** %vtpm.47.i, align 8
  %vtpm.16.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.15.i, i64 0, i32 7
  %tmp.0.i = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.16.i, align 8
  %vtpm.17.i = tail call %Main* %tmp.0.i(%Main* nonnull %vtpm.46.i, %String* nonnull @String.1)
  br label %Main_main.exit

false.0.i:                                        ; preds = %Main_new.exit
  %vtpm.22.i = getelementptr i8, i8* %vtpm.45.i, i64 24
  %4 = bitcast i8* %vtpm.22.i to i8**
  %vtpm.233.i = load i8*, i8** %4, align 8
  %vtpm.26.i = icmp eq i8* %vtpm.61.i1.i, %vtpm.233.i
  %vtpm.30.i = load %_Main_vtable*, %_Main_vtable** %vtpm.47.i, align 8
  %vtpm.31.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.30.i, i64 0, i32 7
  %tmp.1.i = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.31.i, align 8
  br i1 %vtpm.26.i, label %ok.1.i, label %ok.2.i

ok.1.i:                                           ; preds = %false.0.i
  %vtpm.32.i = tail call %Main* %tmp.1.i(%Main* nonnull %vtpm.46.i, %String* nonnull @String.2)
  br label %Main_main.exit

ok.2.i:                                           ; preds = %false.0.i
  %vtpm.38.i = tail call %Main* %tmp.1.i(%Main* nonnull %vtpm.46.i, %String* nonnull @String.1)
  br label %Main_main.exit

Main_main.exit:                                   ; preds = %ok.0.i, %ok.1.i, %ok.2.i
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %Main* @Main_main(%Main* %self) {
entry:
  %vtpm.4 = getelementptr %Main, %Main* %self, i64 0, i32 1
  %0 = bitcast %A** %vtpm.4 to i8**
  %vtpm.51 = load i8*, i8** %0, align 8
  %vtpm.7 = getelementptr %Main, %Main* %self, i64 0, i32 2
  %1 = bitcast %A** %vtpm.7 to i8**
  %vtpm.82 = load i8*, i8** %1, align 8
  %vtpm.11 = icmp eq i8* %vtpm.51, %vtpm.82
  br i1 %vtpm.11, label %ok.0, label %false.0

ok.0:                                             ; preds = %entry
  %vtpm.14 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.15 = load %_Main_vtable*, %_Main_vtable** %vtpm.14, align 8
  %vtpm.16 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.15, i64 0, i32 7
  %tmp.0 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.16, align 8
  %vtpm.17 = tail call %Main* %tmp.0(%Main* nonnull %self, %String* nonnull @String.1)
  br label %end.0

false.0:                                          ; preds = %entry
  %vtpm.22 = getelementptr %Main, %Main* %self, i64 0, i32 3
  %2 = bitcast %A** %vtpm.22 to i8**
  %vtpm.233 = load i8*, i8** %2, align 8
  %vtpm.26 = icmp eq i8* %vtpm.82, %vtpm.233
  %vtpm.29 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.30 = load %_Main_vtable*, %_Main_vtable** %vtpm.29, align 8
  %vtpm.31 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.30, i64 0, i32 7
  %tmp.1 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.31, align 8
  br i1 %vtpm.26, label %ok.1, label %ok.2

ok.1:                                             ; preds = %false.0
  %vtpm.32 = tail call %Main* %tmp.1(%Main* nonnull %self, %String* nonnull @String.2)
  br label %end.0

ok.2:                                             ; preds = %false.0
  %vtpm.38 = tail call %Main* %tmp.1(%Main* nonnull %self, %String* nonnull @String.1)
  br label %end.0

end.0:                                            ; preds = %ok.1, %ok.2, %ok.0
  %vtpm.0.0 = phi %Main* [ %vtpm.17, %ok.0 ], [ %vtpm.32, %ok.1 ], [ %vtpm.38, %ok.2 ]
  ret %Main* %vtpm.0.0
}

define %Main* @Main_new() {
entry:
  %vtpm.45 = tail call i8* @malloc(i32 32)
  %malloc.null = icmp eq i8* %vtpm.45, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.47 = bitcast i8* %vtpm.45 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.47, align 8
  %vtpm.48 = getelementptr i8, i8* %vtpm.45, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(24) %vtpm.48, i8 0, i64 24, i1 false)
  %vtpm.61.i = tail call i8* @malloc(i32 16)
  %malloc.null.i = icmp eq i8* %vtpm.61.i, null
  br i1 %malloc.null.i, label %abort.i, label %A_new.exit

abort.i:                                          ; preds = %okay
  tail call void @abort()
  unreachable

A_new.exit:                                       ; preds = %okay
  %vtpm.63.i = bitcast i8* %vtpm.61.i to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.63.i, align 8
  %vtpm.64.i = getelementptr i8, i8* %vtpm.61.i, i64 8
  %0 = bitcast i8* %vtpm.64.i to i32*
  store i32 2, i32* %0, align 4
  %1 = bitcast i8* %vtpm.48 to i8**
  store i8* %vtpm.61.i, i8** %1, align 8
  %vtpm.61.i1 = tail call i8* @malloc(i32 16)
  %malloc.null.i2 = icmp eq i8* %vtpm.61.i1, null
  br i1 %malloc.null.i2, label %abort.i6, label %A_new.exit7

abort.i6:                                         ; preds = %A_new.exit
  tail call void @abort()
  unreachable

A_new.exit7:                                      ; preds = %A_new.exit
  %vtpm.49 = getelementptr i8, i8* %vtpm.45, i64 16
  %vtpm.46 = bitcast i8* %vtpm.45 to %Main*
  %vtpm.63.i4 = bitcast i8* %vtpm.61.i1 to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.63.i4, align 8
  %vtpm.64.i5 = getelementptr i8, i8* %vtpm.61.i1, i64 8
  %2 = bitcast i8* %vtpm.64.i5 to i32*
  store i32 2, i32* %2, align 4
  %3 = bitcast i8* %vtpm.49 to i8**
  store i8* %vtpm.61.i1, i8** %3, align 8
  ret %Main* %vtpm.46

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %A* @A_new() {
entry:
  %vtpm.61 = tail call i8* @malloc(i32 16)
  %malloc.null = icmp eq i8* %vtpm.61, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.62 = bitcast i8* %vtpm.61 to %A*
  %vtpm.63 = bitcast i8* %vtpm.61 to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.63, align 8
  %vtpm.64 = getelementptr i8, i8* %vtpm.61, i64 8
  %0 = bitcast i8* %vtpm.64 to i32*
  store i32 2, i32* %0, align 4
  ret %A* %vtpm.62

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #0

attributes #0 = { argmemonly nocallback nofree nounwind willreturn writeonly }
