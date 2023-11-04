; ModuleID = 'caseskip.ll'
source_filename = "caseskip.ll"

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
%_A_vtable = type { i32, i32, i8*, %A* ()*, %Object* (%A*)*, %String* (%A*)*, %A* (%A*)* }
%A = type { %_A_vtable* }
%_B_vtable = type { i32, i32, i8*, %B* ()*, %Object* (%B*)*, %String* (%B*)*, %B* (%B*)* }
%B = type { %_B_vtable* }
%_B1_vtable = type { i32, i32, i8*, %B1* ()*, %Object* (%B1*)*, %String* (%B1*)*, %B1* (%B1*)* }
%B1 = type { %_B1_vtable* }
%_B2_vtable = type { i32, i32, i8*, %B2* ()*, %Object* (%B2*)*, %String* (%B2*)*, %B2* (%B2*)* }
%B2 = type { %_B2_vtable* }
%_E_vtable = type { i32, i32, i8*, %E* ()*, %Object* (%E*)*, %String* (%E*)*, %E* (%E*)* }
%E = type { %_E_vtable* }
%_F_vtable = type { i32, i32, i8*, %F* ()*, %Object* (%F*)*, %String* (%F*)*, %F* (%F*)* }
%F = type { %_F_vtable* }

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
@_A_vtable_prototype = constant %_A_vtable { i32 6, i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0), %A* ()* @A_new, %Object* (%A*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%A*)*), %String* (%A*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%A*)*), %A* (%A*)* bitcast (%Object* (%Object*)* @Object_copy to %A* (%A*)*) }
@str.B = internal constant [2 x i8] c"B\00"
@_B_vtable_prototype = constant %_B_vtable { i32 7, i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0), %B* ()* @B_new, %Object* (%B*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%B*)*), %String* (%B*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%B*)*), %B* (%B*)* bitcast (%Object* (%Object*)* @Object_copy to %B* (%B*)*) }
@str.B1 = internal constant [3 x i8] c"B1\00"
@_B1_vtable_prototype = constant %_B1_vtable { i32 8, i32 ptrtoint (%B1* getelementptr (%B1, %B1* null, i32 1) to i32), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.B1, i32 0, i32 0), %B1* ()* @B1_new, %Object* (%B1*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%B1*)*), %String* (%B1*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%B1*)*), %B1* (%B1*)* bitcast (%Object* (%Object*)* @Object_copy to %B1* (%B1*)*) }
@str.B2 = internal constant [3 x i8] c"B2\00"
@_B2_vtable_prototype = constant %_B2_vtable { i32 9, i32 ptrtoint (%B2* getelementptr (%B2, %B2* null, i32 1) to i32), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.B2, i32 0, i32 0), %B2* ()* @B2_new, %Object* (%B2*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%B2*)*), %String* (%B2*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%B2*)*), %B2* (%B2*)* bitcast (%Object* (%Object*)* @Object_copy to %B2* (%B2*)*) }
@str.E = internal constant [2 x i8] c"E\00"
@_E_vtable_prototype = constant %_E_vtable { i32 10, i32 ptrtoint (%E* getelementptr (%E, %E* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.E, i32 0, i32 0), %E* ()* @E_new, %Object* (%E*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%E*)*), %String* (%E*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%E*)*), %E* (%E*)* bitcast (%Object* (%Object*)* @Object_copy to %E* (%E*)*) }
@str.F = internal constant [2 x i8] c"F\00"
@_F_vtable_prototype = constant %_F_vtable { i32 11, i32 ptrtoint (%F* getelementptr (%F, %F* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.F, i32 0, i32 0), %F* ()* @F_new, %Object* (%F*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%F*)*), %String* (%F*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%F*)*), %F* (%F*)* bitcast (%Object* (%Object*)* @Object_copy to %F* (%F*)*) }
@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [12 x i8] c"caseskip.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_str.0, i32 0, i32 0) }

declare void @abort() local_unnamed_addr

declare i8* @malloc(i32) local_unnamed_addr

declare %Object* @Object_abort(%Object*)

declare %String* @Object_type_name(%Object*)

declare %Object* @Object_copy(%Object*)

declare void @Int_init(%Int*, i32) local_unnamed_addr

declare i32 @String_length(%String*)

declare %String* @String_concat(%String*, %String*)

declare %String* @String_substr(%String*, i32, i32)

declare %IO* @IO_out_string(%IO*, %String*)

declare %IO* @IO_out_int(%IO*, i32)

declare %String* @IO_in_string(%IO*)

declare i32 @IO_in_int(%IO*)

define i32 @main() local_unnamed_addr {
entry:
  %vtpm.41.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.41.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.43.i = bitcast i8* %vtpm.41.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.43.i, align 8
  %vtpm.55.i.i = tail call i8* @malloc(i32 8)
  %malloc.null.i.i = icmp eq i8* %vtpm.55.i.i, null
  br i1 %malloc.null.i.i, label %abort.i.i, label %Main_main.exit

abort.i.i:                                        ; preds = %Main_new.exit
  tail call void @abort()
  unreachable

Main_main.exit:                                   ; preds = %Main_new.exit
  %vtpm.42.i = bitcast i8* %vtpm.41.i to %Main*
  %vtpm.57.i.i = bitcast i8* %vtpm.55.i.i to %_B_vtable**
  store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.57.i.i, align 8
  %vtpm.26.i = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.26.i, i32 2)
  %vtpm.31.i = load %_Main_vtable*, %_Main_vtable** %vtpm.43.i, align 8
  %vtpm.32.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.31.i, i64 0, i32 8
  %tmp.3.i = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.32.i, align 8
  %vtpm.33.i = getelementptr %Int, %Int* %vtpm.26.i, i64 0, i32 1
  %vtpm.34.i = load i32, i32* %vtpm.33.i, align 4
  %vtpm.35.i = tail call %Main* %tmp.3.i(%Main* nonnull %vtpm.42.i, i32 %vtpm.34.i)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %Object* @Main_main(%Main* %self) {
entry:
  %vtpm.55.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.55.i, null
  br i1 %malloc.null.i, label %abort.i, label %B_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

B_new.exit:                                       ; preds = %entry
  %vtpm.57.i = bitcast i8* %vtpm.55.i to %_B_vtable**
  store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.57.i, align 8
  %vtpm.26 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.26, i32 2)
  %vtpm.29 = icmp eq %Main* %self, null
  br i1 %vtpm.29, label %abort, label %ok.1

ok.1:                                             ; preds = %B_new.exit
  %vtpm.30 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.31 = load %_Main_vtable*, %_Main_vtable** %vtpm.30, align 8
  %vtpm.32 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.31, i64 0, i32 8
  %tmp.3 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.32, align 8
  %vtpm.33 = getelementptr %Int, %Int* %vtpm.26, i64 0, i32 1
  %vtpm.34 = load i32, i32* %vtpm.33, align 4
  %vtpm.35 = tail call %Main* %tmp.3(%Main* nonnull %self, i32 %vtpm.34)
  %vtpm.36 = bitcast %Main* %vtpm.35 to %Object*
  ret %Object* %vtpm.36

abort:                                            ; preds = %B_new.exit
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.41 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.41, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.42 = bitcast i8* %vtpm.41 to %Main*
  %vtpm.43 = bitcast i8* %vtpm.41 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.43, align 8
  ret %Main* %vtpm.42

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %A* @A_new() {
entry:
  %vtpm.48 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.48, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.49 = bitcast i8* %vtpm.48 to %A*
  %vtpm.50 = bitcast i8* %vtpm.48 to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.50, align 8
  ret %A* %vtpm.49

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %B* @B_new() {
entry:
  %vtpm.55 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.55, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.56 = bitcast i8* %vtpm.55 to %B*
  %vtpm.57 = bitcast i8* %vtpm.55 to %_B_vtable**
  store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.57, align 8
  ret %B* %vtpm.56

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %B1* @B1_new() {
entry:
  %vtpm.62 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.62, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.63 = bitcast i8* %vtpm.62 to %B1*
  %vtpm.64 = bitcast i8* %vtpm.62 to %_B1_vtable**
  store %_B1_vtable* @_B1_vtable_prototype, %_B1_vtable** %vtpm.64, align 8
  ret %B1* %vtpm.63

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %B2* @B2_new() {
entry:
  %vtpm.69 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.69, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.70 = bitcast i8* %vtpm.69 to %B2*
  %vtpm.71 = bitcast i8* %vtpm.69 to %_B2_vtable**
  store %_B2_vtable* @_B2_vtable_prototype, %_B2_vtable** %vtpm.71, align 8
  ret %B2* %vtpm.70

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %E* @E_new() {
entry:
  %vtpm.76 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.76, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.77 = bitcast i8* %vtpm.76 to %E*
  %vtpm.78 = bitcast i8* %vtpm.76 to %_E_vtable**
  store %_E_vtable* @_E_vtable_prototype, %_E_vtable** %vtpm.78, align 8
  ret %E* %vtpm.77

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %F* @F_new() {
entry:
  %vtpm.83 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.83, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.84 = bitcast i8* %vtpm.83 to %F*
  %vtpm.85 = bitcast i8* %vtpm.83 to %_F_vtable**
  store %_F_vtable* @_F_vtable_prototype, %_F_vtable** %vtpm.85, align 8
  ret %F* %vtpm.84

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}
