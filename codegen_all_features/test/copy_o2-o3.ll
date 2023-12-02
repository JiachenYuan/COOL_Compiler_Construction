; ModuleID = 'copy_o2.ll'
source_filename = "copy_o2.ll"

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
%_A_vtable = type { i32, i32, i8*, %A* ()*, %Object* (%A*)*, %String* (%A*)*, %A* (%A*)*, i32 (%A*)*, %A* (%A*, i32)* }
%A = type { %_A_vtable*, i32 }

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
@str.A = internal constant [2 x i8] c"A\00"
@_A_vtable_prototype = constant %_A_vtable { i32 6, i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0), %A* ()* @A_new, %Object* (%A*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%A*)*), %String* (%A*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%A*)*), %A* (%A*)* bitcast (%Object* (%Object*)* @Object_copy to %A* (%A*)*), i32 (%A*)* @A_getAnswerToAll, %A* (%A*, i32)* @A_setAnswerToAll }
@global_str.2 = internal constant [14 x i8] c"<basic class>\00"
@String.2 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.2, i32 0, i32 0) }
@global_str.1 = internal constant [2 x i8] c" \00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [11 x i8] c"copy_o2.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @global_str.0, i32 0, i32 0) }

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
  %vtpm.51.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.51.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.52.i = bitcast i8* %vtpm.51.i to %Main*
  %vtpm.53.i = bitcast i8* %vtpm.51.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.53.i, align 8
  %main.retval = tail call %Object* @Main_main(%Main* nonnull %vtpm.52.i)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %Object* @Main_main(%Main* %self) {
entry:
  %vtpm.70.i = tail call i8* @malloc(i32 16)
  %malloc.null.i = icmp eq i8* %vtpm.70.i, null
  br i1 %malloc.null.i, label %abort.i, label %A_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

A_new.exit:                                       ; preds = %entry
  %vtpm.72.i = bitcast i8* %vtpm.70.i to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.72.i, align 8
  %vtpm.73.i = getelementptr i8, i8* %vtpm.70.i, i64 8
  %0 = bitcast i8* %vtpm.73.i to i32*
  store i32 42, i32* %0, align 4
  %1 = bitcast i8* %vtpm.70.i to %Object*
  %vtpm.9 = tail call %Object* @Object_copy(%Object* nonnull %1)
  %2 = bitcast %Object* %vtpm.9 to %A*
  %vtpm.11 = icmp eq %Object* %vtpm.9, null
  br i1 %vtpm.11, label %abort, label %ok.1

ok.1:                                             ; preds = %A_new.exit
  %vtpm.71.i = bitcast i8* %vtpm.70.i to %A*
  %vtpm.12 = bitcast %Object* %vtpm.9 to %_A_vtable**
  %vtpm.13 = load %_A_vtable*, %_A_vtable** %vtpm.12, align 8
  %vtpm.14 = getelementptr %_A_vtable, %_A_vtable* %vtpm.13, i64 0, i32 8
  %tmp.1 = load %A* (%A*, i32)*, %A* (%A*, i32)** %vtpm.14, align 8
  %vtpm.15 = tail call %A* %tmp.1(%A* nonnull %2, i32 21)
  %vtpm.19 = load %_A_vtable*, %_A_vtable** %vtpm.72.i, align 8
  %vtpm.20 = getelementptr %_A_vtable, %_A_vtable* %vtpm.19, i64 0, i32 7
  %tmp.2 = load i32 (%A*)*, i32 (%A*)** %vtpm.20, align 8
  %vtpm.21 = tail call i32 %tmp.2(%A* nonnull %vtpm.71.i)
  %vtpm.23 = icmp eq %Main* %self, null
  br i1 %vtpm.23, label %abort, label %ok.3

ok.3:                                             ; preds = %ok.1
  %vtpm.24 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.25 = load %_Main_vtable*, %_Main_vtable** %vtpm.24, align 8
  %vtpm.26 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.25, i64 0, i32 8
  %tmp.3 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.26, align 8
  %vtpm.27 = tail call %Main* %tmp.3(%Main* nonnull %self, i32 %vtpm.21)
  %vtpm.31 = load %_Main_vtable*, %_Main_vtable** %vtpm.24, align 8
  %vtpm.32 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.31, i64 0, i32 7
  %tmp.4 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.32, align 8
  %vtpm.33 = tail call %Main* %tmp.4(%Main* nonnull %self, %String* nonnull @String.1)
  %vtpm.37 = load %_A_vtable*, %_A_vtable** %vtpm.12, align 8
  %vtpm.38 = getelementptr %_A_vtable, %_A_vtable* %vtpm.37, i64 0, i32 7
  %tmp.5 = load i32 (%A*)*, i32 (%A*)** %vtpm.38, align 8
  %vtpm.39 = tail call i32 %tmp.5(%A* nonnull %2)
  %vtpm.43 = load %_Main_vtable*, %_Main_vtable** %vtpm.24, align 8
  %vtpm.44 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.43, i64 0, i32 8
  %tmp.6 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.44, align 8
  %vtpm.45 = tail call %Main* %tmp.6(%Main* nonnull %self, i32 %vtpm.39)
  %vtpm.46 = bitcast %Main* %vtpm.45 to %Object*
  ret %Object* %vtpm.46

abort:                                            ; preds = %ok.1, %A_new.exit
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.51 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.51, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.52 = bitcast i8* %vtpm.51 to %Main*
  %vtpm.53 = bitcast i8* %vtpm.51 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.53, align 8
  ret %Main* %vtpm.52

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn
define i32 @A_getAnswerToAll(%A* nocapture readonly %self) #0 {
entry:
  %vtpm.57 = getelementptr %A, %A* %self, i64 0, i32 1
  %vtpm.58 = load i32, i32* %vtpm.57, align 4
  ret i32 %vtpm.58
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define %A* @A_setAnswerToAll(%A* returned writeonly %self, i32 %myAns) #1 {
entry:
  %vtpm.64 = getelementptr %A, %A* %self, i64 0, i32 1
  store i32 %myAns, i32* %vtpm.64, align 4
  ret %A* %self
}

define %A* @A_new() {
entry:
  %vtpm.70 = tail call i8* @malloc(i32 16)
  %malloc.null = icmp eq i8* %vtpm.70, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.71 = bitcast i8* %vtpm.70 to %A*
  %vtpm.72 = bitcast i8* %vtpm.70 to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.72, align 8
  %vtpm.73 = getelementptr i8, i8* %vtpm.70, i64 8
  %0 = bitcast i8* %vtpm.73 to i32*
  store i32 42, i32* %0, align 4
  ret %A* %vtpm.71

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly }
