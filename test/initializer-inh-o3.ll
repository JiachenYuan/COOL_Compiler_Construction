; ModuleID = 'initializer-inh.ll'
source_filename = "initializer-inh.ll"

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
%_A_vtable = type { i32, i32, i8*, %A* ()*, %Object* (%A*)*, %String* (%A*)*, %A* (%A*)*, %A* (%A*, %String*)*, %A* (%A*, i32)*, %String* (%A*)*, i32 (%A*)*, %Object* (%A*)* }
%A = type { %_A_vtable*, %Object*, i32 }
%_B_vtable = type { i32, i32, i8*, %B* ()*, %Object* (%B*)*, %String* (%B*)*, %B* (%B*)*, %B* (%B*, %String*)*, %B* (%B*, i32)*, %String* (%B*)*, i32 (%B*)*, %Object* (%B*)* }
%B = type { %_B_vtable*, %Object*, i32, i32 }
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
@str.A = internal constant [2 x i8] c"A\00"
@_A_vtable_prototype = constant %_A_vtable { i32 5, i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0), %A* ()* @A_new, %Object* (%A*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%A*)*), %String* (%A*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%A*)*), %A* (%A*)* bitcast (%Object* (%Object*)* @Object_copy to %A* (%A*)*), %A* (%A*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %A* (%A*, %String*)*), %A* (%A*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %A* (%A*, i32)*), %String* (%A*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%A*)*), i32 (%A*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%A*)*), %Object* (%A*)* @A_f }
@str.B = internal constant [2 x i8] c"B\00"
@_B_vtable_prototype = constant %_B_vtable { i32 6, i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0), %B* ()* @B_new, %Object* (%B*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%B*)*), %String* (%B*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%B*)*), %B* (%B*)* bitcast (%Object* (%Object*)* @Object_copy to %B* (%B*)*), %B* (%B*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %B* (%B*, %String*)*), %B* (%B*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %B* (%B*, i32)*), %String* (%B*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%B*)*), i32 (%B*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%B*)*), %Object* (%B*)* @B_f }
@str.Main = internal constant [5 x i8] c"Main\00"
@_Main_vtable_prototype = constant %_Main_vtable { i32 7, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %Main* (%Main*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Main* (%Main*, %String*)*), %Main* (%Main*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Main* (%Main*, i32)*), %String* (%Main*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Main*)*), i32 (%Main*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Main*)*), %Object* (%Main*)* @Main_main }
@global_str.7 = internal constant [14 x i8] c"<basic class>\00"
@String.7 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.7, i32 0, i32 0) }
@global_str.6 = internal constant [7 x i8] c"new B\0A\00"
@String.6 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_str.6, i32 0, i32 0) }
@global_str.5 = internal constant [7 x i8] c"new A\0A\00"
@String.5 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_str.5, i32 0, i32 0) }
@global_str.4 = internal constant [10 x i8] c"B.f: y = \00"
@String.4 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @global_str.4, i32 0, i32 0) }
@global_str.3 = internal constant [28 x i8] c"initializing B.y. here x = \00"
@String.3 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @global_str.3, i32 0, i32 0) }
@global_str.2 = internal constant [2 x i8] c"\0A\00"
@String.2 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @global_str.2, i32 0, i32 0) }
@global_str.1 = internal constant [10 x i8] c"A.f: x = \00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [19 x i8] c"initializer-inh.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @global_str.0, i32 0, i32 0) }

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
  %vtpm.135.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.135.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.136.i = bitcast i8* %vtpm.135.i to %Main*
  %vtpm.137.i = bitcast i8* %vtpm.135.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.137.i, align 8
  %main.retval = tail call %Object* @Main_main(%Main* nonnull %vtpm.136.i)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %Object* @A_f(%A* %self) {
entry:
  %vtpm.2 = icmp eq %A* %self, null
  br i1 %vtpm.2, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.3 = getelementptr %A, %A* %self, i64 0, i32 0
  %vtpm.4 = load %_A_vtable*, %_A_vtable** %vtpm.3, align 8
  %vtpm.5 = getelementptr %_A_vtable, %_A_vtable* %vtpm.4, i64 0, i32 7
  %tmp.0 = load %A* (%A*, %String*)*, %A* (%A*, %String*)** %vtpm.5, align 8
  %vtpm.6 = tail call %A* %tmp.0(%A* nonnull %self, %String* nonnull @String.1)
  %vtpm.8 = getelementptr %A, %A* %self, i64 0, i32 2
  %vtpm.9 = load i32, i32* %vtpm.8, align 4
  %vtpm.13 = load %_A_vtable*, %_A_vtable** %vtpm.3, align 8
  %vtpm.14 = getelementptr %_A_vtable, %_A_vtable* %vtpm.13, i64 0, i32 8
  %tmp.1 = load %A* (%A*, i32)*, %A* (%A*, i32)** %vtpm.14, align 8
  %vtpm.15 = tail call %A* %tmp.1(%A* nonnull %self, i32 %vtpm.9)
  %vtpm.19 = load %_A_vtable*, %_A_vtable** %vtpm.3, align 8
  %vtpm.20 = getelementptr %_A_vtable, %_A_vtable* %vtpm.19, i64 0, i32 7
  %tmp.2 = load %A* (%A*, %String*)*, %A* (%A*, %String*)** %vtpm.20, align 8
  %vtpm.21 = tail call %A* %tmp.2(%A* nonnull %self, %String* nonnull @String.2)
  %vtpm.22 = bitcast %A* %vtpm.21 to %Object*
  ret %Object* %vtpm.22

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %A* @A_new() {
entry:
  %vtpm.27 = tail call i8* @malloc(i32 24)
  %malloc.null = icmp eq i8* %vtpm.27, null
  br i1 %malloc.null, label %abort, label %A_f.exit

A_f.exit:                                         ; preds = %entry
  %vtpm.29 = bitcast i8* %vtpm.27 to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.29, align 8
  %vtpm.30 = getelementptr i8, i8* %vtpm.27, i64 8
  %0 = bitcast i8* %vtpm.30 to %Object**
  store %Object* null, %Object** %0, align 8
  %vtpm.31 = getelementptr i8, i8* %vtpm.27, i64 16
  %1 = bitcast i8* %vtpm.31 to i32*
  store i32 0, i32* %1, align 4
  %vtpm.28 = bitcast i8* %vtpm.27 to %A*
  %2 = bitcast i8* %vtpm.27 to %IO*
  %vtpm.6.i = tail call %IO* @IO_out_string(%IO* nonnull %2, %String* nonnull @String.1)
  %vtpm.9.i = load i32, i32* %1, align 4
  %vtpm.13.i = load %_A_vtable*, %_A_vtable** %vtpm.29, align 8
  %vtpm.14.i = getelementptr %_A_vtable, %_A_vtable* %vtpm.13.i, i64 0, i32 8
  %tmp.1.i = load %A* (%A*, i32)*, %A* (%A*, i32)** %vtpm.14.i, align 8
  %vtpm.15.i = tail call %A* %tmp.1.i(%A* nonnull %vtpm.28, i32 %vtpm.9.i)
  %vtpm.19.i = load %_A_vtable*, %_A_vtable** %vtpm.29, align 8
  %vtpm.20.i = getelementptr %_A_vtable, %_A_vtable* %vtpm.19.i, i64 0, i32 7
  %tmp.2.i = load %A* (%A*, %String*)*, %A* (%A*, %String*)** %vtpm.20.i, align 8
  %vtpm.21.i = tail call %A* %tmp.2.i(%A* nonnull %vtpm.28, %String* nonnull @String.2)
  %3 = bitcast i8* %vtpm.30 to %A**
  store %A* %vtpm.21.i, %A** %3, align 8
  store i32 12, i32* %1, align 4
  ret %A* %vtpm.28

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Object* @B_f(%B* %self) {
entry:
  %vtpm.47 = icmp eq %B* %self, null
  br i1 %vtpm.47, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.48 = getelementptr %B, %B* %self, i64 0, i32 0
  %vtpm.49 = load %_B_vtable*, %_B_vtable** %vtpm.48, align 8
  %vtpm.50 = getelementptr %_B_vtable, %_B_vtable* %vtpm.49, i64 0, i32 7
  %tmp.0 = load %B* (%B*, %String*)*, %B* (%B*, %String*)** %vtpm.50, align 8
  %vtpm.51 = tail call %B* %tmp.0(%B* nonnull %self, %String* nonnull @String.4)
  %vtpm.53 = getelementptr %B, %B* %self, i64 0, i32 3
  %vtpm.54 = load i32, i32* %vtpm.53, align 4
  %vtpm.58 = load %_B_vtable*, %_B_vtable** %vtpm.48, align 8
  %vtpm.59 = getelementptr %_B_vtable, %_B_vtable* %vtpm.58, i64 0, i32 8
  %tmp.1 = load %B* (%B*, i32)*, %B* (%B*, i32)** %vtpm.59, align 8
  %vtpm.60 = tail call %B* %tmp.1(%B* nonnull %self, i32 %vtpm.54)
  %vtpm.64 = load %_B_vtable*, %_B_vtable** %vtpm.48, align 8
  %vtpm.65 = getelementptr %_B_vtable, %_B_vtable* %vtpm.64, i64 0, i32 7
  %tmp.2 = load %B* (%B*, %String*)*, %B* (%B*, %String*)** %vtpm.65, align 8
  %vtpm.66 = tail call %B* %tmp.2(%B* nonnull %self, %String* nonnull @String.2)
  %vtpm.67 = bitcast %B* %vtpm.66 to %Object*
  ret %Object* %vtpm.67

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %B* @B_new() {
entry:
  %vtpm.72 = tail call i8* @malloc(i32 24)
  %malloc.null = icmp eq i8* %vtpm.72, null
  br i1 %malloc.null, label %abort, label %B_f.exit

B_f.exit:                                         ; preds = %entry
  %vtpm.73 = bitcast i8* %vtpm.72 to %B*
  %vtpm.74 = bitcast i8* %vtpm.72 to %_B_vtable**
  store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.74, align 8
  %vtpm.75 = getelementptr i8, i8* %vtpm.72, i64 8
  %vtpm.76 = getelementptr i8, i8* %vtpm.72, i64 16
  %0 = bitcast i8* %vtpm.76 to i32*
  %vtpm.77 = getelementptr i8, i8* %vtpm.72, i64 20
  %1 = bitcast i8* %vtpm.77 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %vtpm.75, i8 0, i64 16, i1 false)
  %2 = bitcast i8* %vtpm.72 to %IO*
  %vtpm.51.i = tail call %IO* @IO_out_string(%IO* nonnull %2, %String* nonnull @String.4)
  %vtpm.54.i = load i32, i32* %1, align 4
  %vtpm.58.i = load %_B_vtable*, %_B_vtable** %vtpm.74, align 8
  %vtpm.59.i = getelementptr %_B_vtable, %_B_vtable* %vtpm.58.i, i64 0, i32 8
  %tmp.1.i = load %B* (%B*, i32)*, %B* (%B*, i32)** %vtpm.59.i, align 8
  %vtpm.60.i = tail call %B* %tmp.1.i(%B* nonnull %vtpm.73, i32 %vtpm.54.i)
  %vtpm.64.i = load %_B_vtable*, %_B_vtable** %vtpm.74, align 8
  %vtpm.65.i = getelementptr %_B_vtable, %_B_vtable* %vtpm.64.i, i64 0, i32 7
  %tmp.2.i = load %B* (%B*, %String*)*, %B* (%B*, %String*)** %vtpm.65.i, align 8
  %vtpm.66.i = tail call %B* %tmp.2.i(%B* nonnull %vtpm.73, %String* nonnull @String.2)
  %3 = bitcast i8* %vtpm.75 to %B**
  store %B* %vtpm.66.i, %B** %3, align 8
  store i32 12, i32* %0, align 4
  %vtpm.94 = load %_B_vtable*, %_B_vtable** %vtpm.74, align 8
  %vtpm.95 = getelementptr %_B_vtable, %_B_vtable* %vtpm.94, i64 0, i32 7
  %tmp.1 = load %B* (%B*, %String*)*, %B* (%B*, %String*)** %vtpm.95, align 8
  %vtpm.96 = tail call %B* %tmp.1(%B* nonnull %vtpm.73, %String* nonnull @String.3)
  %vtpm.99 = load i32, i32* %0, align 4
  %vtpm.103 = load %_B_vtable*, %_B_vtable** %vtpm.74, align 8
  %vtpm.104 = getelementptr %_B_vtable, %_B_vtable* %vtpm.103, i64 0, i32 8
  %tmp.2 = load %B* (%B*, i32)*, %B* (%B*, i32)** %vtpm.104, align 8
  %vtpm.105 = tail call %B* %tmp.2(%B* nonnull %vtpm.73, i32 %vtpm.99)
  %vtpm.109 = load %_B_vtable*, %_B_vtable** %vtpm.74, align 8
  %vtpm.110 = getelementptr %_B_vtable, %_B_vtable* %vtpm.109, i64 0, i32 7
  %tmp.3 = load %B* (%B*, %String*)*, %B* (%B*, %String*)** %vtpm.110, align 8
  %vtpm.111 = tail call %B* %tmp.3(%B* nonnull %vtpm.73, %String* nonnull @String.2)
  store i32 13, i32* %1, align 4
  ret %B* %vtpm.73

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Object* @Main_main(%Main* %self) {
entry:
  %vtpm.117 = icmp eq %Main* %self, null
  br i1 %vtpm.117, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.118 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.119 = load %_Main_vtable*, %_Main_vtable** %vtpm.118, align 8
  %vtpm.120 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.119, i64 0, i32 7
  %tmp.0 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.120, align 8
  %vtpm.121 = tail call %Main* %tmp.0(%Main* nonnull %self, %String* nonnull @String.5)
  %vtpm.27.i = tail call i8* @malloc(i32 24)
  %malloc.null.i = icmp eq i8* %vtpm.27.i, null
  br i1 %malloc.null.i, label %abort.i, label %A_new.exit

abort.i:                                          ; preds = %ok.0
  tail call void @abort()
  unreachable

A_new.exit:                                       ; preds = %ok.0
  %vtpm.29.i = bitcast i8* %vtpm.27.i to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.29.i, align 8
  %vtpm.30.i = getelementptr i8, i8* %vtpm.27.i, i64 8
  %0 = bitcast i8* %vtpm.30.i to %Object**
  store %Object* null, %Object** %0, align 8
  %vtpm.31.i = getelementptr i8, i8* %vtpm.27.i, i64 16
  %1 = bitcast i8* %vtpm.31.i to i32*
  store i32 0, i32* %1, align 4
  %vtpm.28.i = bitcast i8* %vtpm.27.i to %A*
  %2 = bitcast i8* %vtpm.27.i to %IO*
  %vtpm.6.i.i = tail call %IO* @IO_out_string(%IO* nonnull %2, %String* nonnull @String.1)
  %vtpm.9.i.i = load i32, i32* %1, align 4
  %vtpm.13.i.i = load %_A_vtable*, %_A_vtable** %vtpm.29.i, align 8
  %vtpm.14.i.i = getelementptr %_A_vtable, %_A_vtable* %vtpm.13.i.i, i64 0, i32 8
  %tmp.1.i.i = load %A* (%A*, i32)*, %A* (%A*, i32)** %vtpm.14.i.i, align 8
  %vtpm.15.i.i = tail call %A* %tmp.1.i.i(%A* nonnull %vtpm.28.i, i32 %vtpm.9.i.i)
  %vtpm.19.i.i = load %_A_vtable*, %_A_vtable** %vtpm.29.i, align 8
  %vtpm.20.i.i = getelementptr %_A_vtable, %_A_vtable* %vtpm.19.i.i, i64 0, i32 7
  %tmp.2.i.i = load %A* (%A*, %String*)*, %A* (%A*, %String*)** %vtpm.20.i.i, align 8
  %vtpm.21.i.i = tail call %A* %tmp.2.i.i(%A* nonnull %vtpm.28.i, %String* nonnull @String.2)
  %3 = bitcast i8* %vtpm.30.i to %A**
  store %A* %vtpm.21.i.i, %A** %3, align 8
  store i32 12, i32* %1, align 4
  %vtpm.126 = load %_Main_vtable*, %_Main_vtable** %vtpm.118, align 8
  %vtpm.127 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.126, i64 0, i32 7
  %tmp.1 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.127, align 8
  %vtpm.128 = tail call %Main* %tmp.1(%Main* nonnull %self, %String* nonnull @String.6)
  %vtpm.72.i = tail call i8* @malloc(i32 24)
  %malloc.null.i1 = icmp eq i8* %vtpm.72.i, null
  br i1 %malloc.null.i1, label %abort.i4, label %B_new.exit

abort.i4:                                         ; preds = %A_new.exit
  tail call void @abort()
  unreachable

B_new.exit:                                       ; preds = %A_new.exit
  %vtpm.73.i = bitcast i8* %vtpm.72.i to %B*
  %vtpm.74.i = bitcast i8* %vtpm.72.i to %_B_vtable**
  store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.74.i, align 8
  %vtpm.75.i = getelementptr i8, i8* %vtpm.72.i, i64 8
  %vtpm.76.i = getelementptr i8, i8* %vtpm.72.i, i64 16
  %4 = bitcast i8* %vtpm.76.i to i32*
  %vtpm.77.i = getelementptr i8, i8* %vtpm.72.i, i64 20
  %5 = bitcast i8* %vtpm.77.i to i32*
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %vtpm.75.i, i8 0, i64 16, i1 false)
  %6 = bitcast i8* %vtpm.72.i to %IO*
  %vtpm.51.i.i = tail call %IO* @IO_out_string(%IO* nonnull %6, %String* nonnull @String.4)
  %vtpm.54.i.i = load i32, i32* %5, align 4
  %vtpm.58.i.i = load %_B_vtable*, %_B_vtable** %vtpm.74.i, align 8
  %vtpm.59.i.i = getelementptr %_B_vtable, %_B_vtable* %vtpm.58.i.i, i64 0, i32 8
  %tmp.1.i.i2 = load %B* (%B*, i32)*, %B* (%B*, i32)** %vtpm.59.i.i, align 8
  %vtpm.60.i.i = tail call %B* %tmp.1.i.i2(%B* nonnull %vtpm.73.i, i32 %vtpm.54.i.i)
  %vtpm.64.i.i = load %_B_vtable*, %_B_vtable** %vtpm.74.i, align 8
  %vtpm.65.i.i = getelementptr %_B_vtable, %_B_vtable* %vtpm.64.i.i, i64 0, i32 7
  %tmp.2.i.i3 = load %B* (%B*, %String*)*, %B* (%B*, %String*)** %vtpm.65.i.i, align 8
  %vtpm.66.i.i = tail call %B* %tmp.2.i.i3(%B* nonnull %vtpm.73.i, %String* nonnull @String.2)
  %7 = bitcast i8* %vtpm.75.i to %B**
  store %B* %vtpm.66.i.i, %B** %7, align 8
  store i32 12, i32* %4, align 4
  %vtpm.94.i = load %_B_vtable*, %_B_vtable** %vtpm.74.i, align 8
  %vtpm.95.i = getelementptr %_B_vtable, %_B_vtable* %vtpm.94.i, i64 0, i32 7
  %tmp.1.i = load %B* (%B*, %String*)*, %B* (%B*, %String*)** %vtpm.95.i, align 8
  %vtpm.96.i = tail call %B* %tmp.1.i(%B* nonnull %vtpm.73.i, %String* nonnull @String.3)
  %vtpm.99.i = load i32, i32* %4, align 4
  %vtpm.103.i = load %_B_vtable*, %_B_vtable** %vtpm.74.i, align 8
  %vtpm.104.i = getelementptr %_B_vtable, %_B_vtable* %vtpm.103.i, i64 0, i32 8
  %tmp.2.i = load %B* (%B*, i32)*, %B* (%B*, i32)** %vtpm.104.i, align 8
  %vtpm.105.i = tail call %B* %tmp.2.i(%B* nonnull %vtpm.73.i, i32 %vtpm.99.i)
  %vtpm.109.i = load %_B_vtable*, %_B_vtable** %vtpm.74.i, align 8
  %vtpm.110.i = getelementptr %_B_vtable, %_B_vtable* %vtpm.109.i, i64 0, i32 7
  %tmp.3.i = load %B* (%B*, %String*)*, %B* (%B*, %String*)** %vtpm.110.i, align 8
  %vtpm.111.i = tail call %B* %tmp.3.i(%B* nonnull %vtpm.73.i, %String* nonnull @String.2)
  store i32 13, i32* %5, align 4
  %vtpm.130 = bitcast i8* %vtpm.72.i to %Object*
  ret %Object* %vtpm.130

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.135 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.135, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.136 = bitcast i8* %vtpm.135 to %Main*
  %vtpm.137 = bitcast i8* %vtpm.135 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.137, align 8
  ret %Main* %vtpm.136

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #0

attributes #0 = { argmemonly nocallback nofree nounwind willreturn writeonly }
