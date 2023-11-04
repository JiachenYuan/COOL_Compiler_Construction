; ModuleID = 'selftype.ll'
source_filename = "selftype.ll"

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
%_A_vtable = type { i32, i32, i8*, %A* ()*, %Object* (%A*)*, %String* (%A*)*, %A* (%A*)*, %A* (%A*)* }
%A = type { %_A_vtable* }
%_B_vtable = type { i32, i32, i8*, %B* ()*, %Object* (%B*)*, %String* (%B*)*, %B* (%B*)*, %B* (%B*)* }
%B = type { %_B_vtable* }
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %String* (%Main*)* }
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
@str.A = internal constant [2 x i8] c"A\00"
@_A_vtable_prototype = constant %_A_vtable { i32 5, i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0), %A* ()* @A_new, %Object* (%A*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%A*)*), %String* (%A*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%A*)*), %A* (%A*)* bitcast (%Object* (%Object*)* @Object_copy to %A* (%A*)*), %A* (%A*)* @A_me }
@str.B = internal constant [2 x i8] c"B\00"
@_B_vtable_prototype = constant %_B_vtable { i32 6, i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0), %B* ()* @B_new, %Object* (%B*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%B*)*), %String* (%B*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%B*)*), %B* (%B*)* bitcast (%Object* (%Object*)* @Object_copy to %B* (%B*)*), %B* (%B*)* bitcast (%A* (%A*)* @A_me to %B* (%B*)*) }
@str.Main = internal constant [5 x i8] c"Main\00"
@_Main_vtable_prototype = constant %_Main_vtable { i32 7, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %String* (%Main*)* @Main_main }
@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [12 x i8] c"selftype.cl\00"
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
  %vtpm.33.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.33.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.35.i = bitcast i8* %vtpm.33.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.35.i, align 8
  %vtpm.13.i.i = tail call i8* @malloc(i32 8)
  %malloc.null.i.i = icmp eq i8* %vtpm.13.i.i, null
  br i1 %malloc.null.i.i, label %abort.i.i, label %Main_main.exit

abort.i.i:                                        ; preds = %Main_new.exit
  tail call void @abort()
  unreachable

Main_main.exit:                                   ; preds = %Main_new.exit
  %vtpm.15.i.i = bitcast i8* %vtpm.13.i.i to %_B_vtable**
  store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.15.i.i, align 8
  %0 = bitcast i8* %vtpm.13.i.i to %Object*
  %vtpm.28.i = tail call %String* @Object_type_name(%Object* nonnull %0)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define %A* @A_me(%A* readnone returned %self) #0 {
entry:
  ret %A* %self
}

define %A* @A_new() {
entry:
  %vtpm.6 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.6, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.7 = bitcast i8* %vtpm.6 to %A*
  %vtpm.8 = bitcast i8* %vtpm.6 to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.8, align 8
  ret %A* %vtpm.7

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %B* @B_new() {
entry:
  %vtpm.13 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.13, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.14 = bitcast i8* %vtpm.13 to %B*
  %vtpm.15 = bitcast i8* %vtpm.13 to %_B_vtable**
  store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.15, align 8
  ret %B* %vtpm.14

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %String* @Main_main(%Main* nocapture readnone %self) {
entry:
  %vtpm.13.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.13.i, null
  br i1 %malloc.null.i, label %abort.i, label %B_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

B_new.exit:                                       ; preds = %entry
  %vtpm.15.i = bitcast i8* %vtpm.13.i to %_B_vtable**
  store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.15.i, align 8
  %0 = bitcast i8* %vtpm.13.i to %Object*
  %vtpm.28 = tail call %String* @Object_type_name(%Object* nonnull %0)
  ret %String* %vtpm.28
}

define %Main* @Main_new() {
entry:
  %vtpm.33 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.33, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.34 = bitcast i8* %vtpm.33 to %Main*
  %vtpm.35 = bitcast i8* %vtpm.33 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.35, align 8
  ret %Main* %vtpm.34

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
