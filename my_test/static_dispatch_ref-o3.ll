; ModuleID = 'static_dispatch_ref.ll'
source_filename = "static_dispatch_ref.ll"

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
%_A_vtable = type { i32, i32, i8*, %A* ()*, %Object* (%A*)*, %String* (%A*)*, %A* (%A*)* }
%A = type { %_A_vtable* }
%_B_vtable = type { i32, i32, i8*, %B* ()*, %Object* (%B*)*, %String* (%B*)*, %B* (%B*)*, %B* (%B*, %A*, i32)* }
%B = type { %_B_vtable*, %String*, i1, %B* }
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %Main* (%Main*, %A*, i32)*, %String* (%Main*)* }
%Main = type { %_Main_vtable*, %String*, i1, %B* }

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
@str.A = internal constant [2 x i8] c"A\00"
@_A_vtable_prototype = constant %_A_vtable { i32 5, i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0), %A* ()* @A_new, %Object* (%A*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%A*)*), %String* (%A*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%A*)*), %A* (%A*)* bitcast (%Object* (%Object*)* @Object_copy to %A* (%A*)*) }
@str.B = internal constant [2 x i8] c"B\00"
@_B_vtable_prototype = constant %_B_vtable { i32 6, i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0), %B* ()* @B_new, %Object* (%B*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%B*)*), %String* (%B*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%B*)*), %B* (%B*)* bitcast (%Object* (%Object*)* @Object_copy to %B* (%B*)*), %B* (%B*, %A*, i32)* @B.test1 }
@str.Main = internal constant [5 x i8] c"Main\00"
@_Main_vtable_prototype = constant %_Main_vtable { i32 7, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %Main* (%Main*, %A*, i32)* bitcast (%B* (%B*, %A*, i32)* @B.test1 to %Main* (%Main*, %A*, i32)*), %String* (%Main*)* @Main.main }
@str.2 = internal constant [14 x i8] c"<basic class>\00"
@String.2 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str.2, i32 0, i32 0) }
@str.1 = internal constant [6 x i8] c"Hello\00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.1, i32 0, i32 0) }
@str.0 = internal constant [19 x i8] c"static_dispatch.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.0, i32 0, i32 0) }

declare void @abort() local_unnamed_addr

declare i8* @malloc(i32) local_unnamed_addr

declare %Object* @Object_new()

declare %Object* @Object_abort(%Object*)

declare %String* @Object_type_name(%Object*)

declare %Object* @Object_copy(%Object*)

declare %IO* @IO_new()

declare %IO* @IO_out_string(%IO*, %String*)

declare %IO* @IO_out_int(%IO*, i32)

declare %String* @IO_in_string(%IO*)

declare i32 @IO_in_int(%IO*)

declare %String* @String_new()

declare i32 @String_length(%String*)

declare %String* @String_concat(%String*, %String*)

declare %String* @String_substr(%String*, i32, i32)

declare %Int* @Int_new()

declare %Bool* @Bool_new()

define i32 @main() local_unnamed_addr {
entry:
  %tmp.17.i = tail call i8* @malloc(i32 32)
  %malloc.null.i = icmp eq i8* %tmp.17.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main.main.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main.main.exit:                                   ; preds = %entry
  %tmp.19.i = bitcast i8* %tmp.17.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %tmp.19.i, align 8
  %tmp.20.i = getelementptr i8, i8* %tmp.17.i, i64 8
  %0 = bitcast i8* %tmp.20.i to %String**
  %tmp.21.i = tail call %String* @String_new()
  store %String* %tmp.21.i, %String** %0, align 8
  %tmp.22.i = getelementptr i8, i8* %tmp.17.i, i64 16
  %1 = bitcast i8* %tmp.22.i to i1*
  store i1 false, i1* %1, align 1
  %tmp.23.i = getelementptr i8, i8* %tmp.17.i, i64 24
  %2 = bitcast i8* %tmp.23.i to %B**
  store %B* null, %B** %2, align 8
  %tmp.25.i = tail call %String* @String_new()
  store %String* %tmp.25.i, %String** %0, align 8
  store i1 false, i1* %1, align 1
  store %B* null, %B** %2, align 8
  ret i32 0
}

define %A* @A_new() {
entry:
  %tmp.3 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %tmp.3, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %tmp.4 = bitcast i8* %tmp.3 to %A*
  %tmp.5 = bitcast i8* %tmp.3 to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %tmp.5, align 8
  ret %A* %tmp.4

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define %B* @B.test1(%B* readnone returned %self, %A* nocapture readnone %arg1, i32 %arg2) #0 {
entry:
  ret %B* %self
}

define %B* @B_new() {
entry:
  %tmp.7 = tail call i8* @malloc(i32 32)
  %malloc.null = icmp eq i8* %tmp.7, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %tmp.8 = bitcast i8* %tmp.7 to %B*
  %tmp.9 = bitcast i8* %tmp.7 to %_B_vtable**
  store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %tmp.9, align 8
  %tmp.10 = getelementptr i8, i8* %tmp.7, i64 8
  %0 = bitcast i8* %tmp.10 to %String**
  %tmp.11 = tail call %String* @String_new()
  store %String* %tmp.11, %String** %0, align 8
  %tmp.12 = getelementptr i8, i8* %tmp.7, i64 16
  %1 = bitcast i8* %tmp.12 to i1*
  store i1 false, i1* %1, align 1
  %tmp.13 = getelementptr i8, i8* %tmp.7, i64 24
  %2 = bitcast i8* %tmp.13 to %B**
  store %B* null, %B** %2, align 8
  %tmp.15 = tail call %String* @String_new()
  store %String* %tmp.15, %String** %0, align 8
  store i1 false, i1* %1, align 1
  store %B* null, %B** %2, align 8
  ret %B* %tmp.8

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define nonnull %String* @Main.main(%Main* readnone %self) {
entry:
  %tmp.7 = icmp eq %Main* %self, null
  br i1 %tmp.7, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  ret %String* @String.1

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %tmp.17 = tail call i8* @malloc(i32 32)
  %malloc.null = icmp eq i8* %tmp.17, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %tmp.18 = bitcast i8* %tmp.17 to %Main*
  %tmp.19 = bitcast i8* %tmp.17 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %tmp.19, align 8
  %tmp.20 = getelementptr i8, i8* %tmp.17, i64 8
  %0 = bitcast i8* %tmp.20 to %String**
  %tmp.21 = tail call %String* @String_new()
  store %String* %tmp.21, %String** %0, align 8
  %tmp.22 = getelementptr i8, i8* %tmp.17, i64 16
  %1 = bitcast i8* %tmp.22 to i1*
  store i1 false, i1* %1, align 1
  %tmp.23 = getelementptr i8, i8* %tmp.17, i64 24
  %2 = bitcast i8* %tmp.23 to %B**
  store %B* null, %B** %2, align 8
  %tmp.25 = tail call %String* @String_new()
  store %String* %tmp.25, %String** %0, align 8
  store i1 false, i1* %1, align 1
  store %B* null, %B** %2, align 8
  ret %Main* %tmp.18

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
