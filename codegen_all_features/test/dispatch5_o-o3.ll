; ModuleID = 'dispatch5_o.ll'
source_filename = "dispatch5_o.ll"

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
%Main = type { %_Main_vtable*, %A*, %A*, %A*, %B*, %C* }
%A = type { %_A_vtable* }
%_A_vtable = type { i32, i32, i8*, %A* ()*, %Object* (%A*)*, %String* (%A*)*, %A* (%A*)*, i32 (%A*)* }
%B = type { %_B_vtable* }
%_B_vtable = type { i32, i32, i8*, %B* ()*, %Object* (%B*)*, %String* (%B*)*, %B* (%B*)*, i32 (%B*)* }
%C = type { %_C_vtable* }
%_C_vtable = type { i32, i32, i8*, %C* ()*, %Object* (%C*)*, %String* (%C*)*, %C* (%C*)*, i32 (%C*)* }

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
@_A_vtable_prototype = constant %_A_vtable { i32 6, i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0), %A* ()* @A_new, %Object* (%A*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%A*)*), %String* (%A*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%A*)*), %A* (%A*)* bitcast (%Object* (%Object*)* @Object_copy to %A* (%A*)*), i32 (%A*)* @A_f }
@str.B = internal constant [2 x i8] c"B\00"
@_B_vtable_prototype = constant %_B_vtable { i32 7, i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0), %B* ()* @B_new, %Object* (%B*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%B*)*), %String* (%B*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%B*)*), %B* (%B*)* bitcast (%Object* (%Object*)* @Object_copy to %B* (%B*)*), i32 (%B*)* bitcast (i32 (%A*)* @A_f to i32 (%B*)*) }
@str.C = internal constant [2 x i8] c"C\00"
@_C_vtable_prototype = constant %_C_vtable { i32 8, i32 ptrtoint (%C* getelementptr (%C, %C* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.C, i32 0, i32 0), %C* ()* @C_new, %Object* (%C*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%C*)*), %String* (%C*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%C*)*), %C* (%C*)* bitcast (%Object* (%Object*)* @Object_copy to %C* (%C*)*), i32 (%C*)* @C_f }
@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [15 x i8] c"dispatch5_o.cl\00"
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
  %main.obj = tail call %Main* @Main_new()
  %main.retval = tail call %Main* @Main_main(%Main* %main.obj)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %Main* @Main_main(%Main* %self) {
entry:
  %vtpm.2 = getelementptr %Main, %Main* %self, i64 0, i32 1
  %vtpm.3 = load %A*, %A** %vtpm.2, align 8
  %vtpm.4 = icmp eq %A* %vtpm.3, null
  br i1 %vtpm.4, label %abort, label %ok.1

ok.1:                                             ; preds = %entry
  %vtpm.5 = getelementptr %A, %A* %vtpm.3, i64 0, i32 0
  %vtpm.6 = load %_A_vtable*, %_A_vtable** %vtpm.5, align 8
  %vtpm.7 = getelementptr %_A_vtable, %_A_vtable* %vtpm.6, i64 0, i32 7
  %tmp.0 = load i32 (%A*)*, i32 (%A*)** %vtpm.7, align 8
  %vtpm.8 = tail call i32 %tmp.0(%A* nonnull %vtpm.3)
  %vtpm.11 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.12 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.13 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.12, i64 0, i32 8
  %tmp.1 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.13, align 8
  %vtpm.14 = tail call %Main* %tmp.1(%Main* nonnull %self, i32 %vtpm.8)
  %vtpm.16 = getelementptr %Main, %Main* %self, i64 0, i32 2
  %vtpm.17 = load %A*, %A** %vtpm.16, align 8
  %vtpm.18 = icmp eq %A* %vtpm.17, null
  br i1 %vtpm.18, label %abort, label %ok.2

ok.2:                                             ; preds = %ok.1
  %vtpm.19 = getelementptr %A, %A* %vtpm.17, i64 0, i32 0
  %vtpm.20 = load %_A_vtable*, %_A_vtable** %vtpm.19, align 8
  %vtpm.21 = getelementptr %_A_vtable, %_A_vtable* %vtpm.20, i64 0, i32 7
  %tmp.2 = load i32 (%A*)*, i32 (%A*)** %vtpm.21, align 8
  %vtpm.22 = tail call i32 %tmp.2(%A* nonnull %vtpm.17)
  %vtpm.26 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.27 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.26, i64 0, i32 8
  %tmp.3 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.27, align 8
  %vtpm.28 = tail call %Main* %tmp.3(%Main* nonnull %self, i32 %vtpm.22)
  %vtpm.30 = getelementptr %Main, %Main* %self, i64 0, i32 3
  %vtpm.31 = load %A*, %A** %vtpm.30, align 8
  %vtpm.32 = icmp eq %A* %vtpm.31, null
  br i1 %vtpm.32, label %abort, label %ok.4

ok.4:                                             ; preds = %ok.2
  %vtpm.33 = getelementptr %A, %A* %vtpm.31, i64 0, i32 0
  %vtpm.34 = load %_A_vtable*, %_A_vtable** %vtpm.33, align 8
  %vtpm.35 = getelementptr %_A_vtable, %_A_vtable* %vtpm.34, i64 0, i32 7
  %tmp.4 = load i32 (%A*)*, i32 (%A*)** %vtpm.35, align 8
  %vtpm.36 = tail call i32 %tmp.4(%A* nonnull %vtpm.31)
  %vtpm.40 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.41 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.40, i64 0, i32 8
  %tmp.5 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.41, align 8
  %vtpm.42 = tail call %Main* %tmp.5(%Main* nonnull %self, i32 %vtpm.36)
  %vtpm.44 = getelementptr %Main, %Main* %self, i64 0, i32 5
  %vtpm.45 = load %C*, %C** %vtpm.44, align 8
  %vtpm.46 = icmp eq %C* %vtpm.45, null
  br i1 %vtpm.46, label %abort, label %ok.6

ok.6:                                             ; preds = %ok.4
  %vtpm.47 = getelementptr %C, %C* %vtpm.45, i64 0, i32 0
  %vtpm.48 = load %_C_vtable*, %_C_vtable** %vtpm.47, align 8
  %vtpm.49 = getelementptr %_C_vtable, %_C_vtable* %vtpm.48, i64 0, i32 7
  %tmp.6 = load i32 (%C*)*, i32 (%C*)** %vtpm.49, align 8
  %vtpm.50 = tail call i32 %tmp.6(%C* nonnull %vtpm.45)
  %vtpm.54 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.55 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.54, i64 0, i32 8
  %tmp.7 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.55, align 8
  %vtpm.56 = tail call %Main* %tmp.7(%Main* nonnull %self, i32 %vtpm.50)
  %vtpm.59 = load %C*, %C** %vtpm.44, align 8
  %vtpm.60 = icmp eq %C* %vtpm.59, null
  br i1 %vtpm.60, label %abort, label %ok.8

ok.8:                                             ; preds = %ok.6
  %vtpm.66 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.67 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.66, i64 0, i32 8
  %tmp.9 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.67, align 8
  %vtpm.68 = tail call %Main* %tmp.9(%Main* nonnull %self, i32 6)
  %vtpm.71 = load %C*, %C** %vtpm.44, align 8
  %vtpm.72 = icmp eq %C* %vtpm.71, null
  br i1 %vtpm.72, label %abort, label %ok.10

ok.10:                                            ; preds = %ok.8
  %vtpm.79 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.80 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.79, i64 0, i32 8
  %tmp.11 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.80, align 8
  %vtpm.81 = tail call %Main* %tmp.11(%Main* nonnull %self, i32 5)
  %vtpm.84 = load %C*, %C** %vtpm.44, align 8
  %vtpm.85 = icmp eq %C* %vtpm.84, null
  br i1 %vtpm.85, label %abort, label %ok.12

ok.12:                                            ; preds = %ok.10
  %vtpm.92 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.93 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.92, i64 0, i32 8
  %tmp.13 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.93, align 8
  %vtpm.94 = tail call %Main* %tmp.13(%Main* nonnull %self, i32 5)
  %vtpm.96 = getelementptr %Main, %Main* %self, i64 0, i32 4
  %vtpm.97 = load %B*, %B** %vtpm.96, align 8
  %vtpm.98 = icmp eq %B* %vtpm.97, null
  br i1 %vtpm.98, label %abort, label %ok.14

ok.14:                                            ; preds = %ok.12
  %vtpm.99 = getelementptr %B, %B* %vtpm.97, i64 0, i32 0
  %vtpm.100 = load %_B_vtable*, %_B_vtable** %vtpm.99, align 8
  %vtpm.101 = getelementptr %_B_vtable, %_B_vtable* %vtpm.100, i64 0, i32 7
  %tmp.14 = load i32 (%B*)*, i32 (%B*)** %vtpm.101, align 8
  %vtpm.102 = tail call i32 %tmp.14(%B* nonnull %vtpm.97)
  %vtpm.106 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.107 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.106, i64 0, i32 8
  %tmp.15 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.107, align 8
  %vtpm.108 = tail call %Main* %tmp.15(%Main* nonnull %self, i32 %vtpm.102)
  %vtpm.111 = load %B*, %B** %vtpm.96, align 8
  %vtpm.112 = icmp eq %B* %vtpm.111, null
  br i1 %vtpm.112, label %abort, label %ok.16

ok.16:                                            ; preds = %ok.14
  %vtpm.118 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.119 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.118, i64 0, i32 8
  %tmp.17 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.119, align 8
  %vtpm.120 = tail call %Main* %tmp.17(%Main* nonnull %self, i32 5)
  %vtpm.123 = load %B*, %B** %vtpm.96, align 8
  %vtpm.124 = icmp eq %B* %vtpm.123, null
  br i1 %vtpm.124, label %abort, label %ok.18

ok.18:                                            ; preds = %ok.16
  %vtpm.131 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.132 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.131, i64 0, i32 8
  %tmp.19 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.132, align 8
  %vtpm.133 = tail call %Main* %tmp.19(%Main* nonnull %self, i32 5)
  %vtpm.136 = load %A*, %A** %vtpm.2, align 8
  %vtpm.137 = icmp eq %A* %vtpm.136, null
  br i1 %vtpm.137, label %abort, label %ok.20

ok.20:                                            ; preds = %ok.18
  %vtpm.143 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.144 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.143, i64 0, i32 8
  %tmp.21 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.144, align 8
  %vtpm.145 = tail call %Main* %tmp.21(%Main* nonnull %self, i32 5)
  ret %Main* %vtpm.145

abort:                                            ; preds = %ok.18, %ok.16, %ok.14, %ok.12, %ok.10, %ok.8, %ok.6, %ok.4, %ok.2, %ok.1, %entry
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.150 = tail call i8* @malloc(i32 48)
  %malloc.null = icmp eq i8* %vtpm.150, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.152 = bitcast i8* %vtpm.150 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.152, align 8
  %vtpm.153 = getelementptr i8, i8* %vtpm.150, i64 8
  %vtpm.154 = getelementptr i8, i8* %vtpm.150, i64 16
  %vtpm.155 = getelementptr i8, i8* %vtpm.150, i64 24
  %vtpm.156 = getelementptr i8, i8* %vtpm.150, i64 32
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(40) %vtpm.153, i8 0, i64 40, i1 false)
  %vtpm.186.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.186.i, null
  br i1 %malloc.null.i, label %abort.i, label %A_new.exit

abort.i:                                          ; preds = %okay
  tail call void @abort()
  unreachable

A_new.exit:                                       ; preds = %okay
  %vtpm.188.i = bitcast i8* %vtpm.186.i to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.188.i, align 8
  %0 = bitcast i8* %vtpm.153 to i8**
  store i8* %vtpm.186.i, i8** %0, align 8
  %vtpm.193.i = tail call i8* @malloc(i32 8)
  %malloc.null.i1 = icmp eq i8* %vtpm.193.i, null
  br i1 %malloc.null.i1, label %abort.i2, label %B_new.exit

abort.i2:                                         ; preds = %A_new.exit
  tail call void @abort()
  unreachable

B_new.exit:                                       ; preds = %A_new.exit
  %vtpm.195.i = bitcast i8* %vtpm.193.i to %_B_vtable**
  store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.195.i, align 8
  %1 = bitcast i8* %vtpm.154 to i8**
  store i8* %vtpm.193.i, i8** %1, align 8
  %vtpm.202.i = tail call i8* @malloc(i32 8)
  %malloc.null.i3 = icmp eq i8* %vtpm.202.i, null
  br i1 %malloc.null.i3, label %abort.i4, label %C_new.exit

abort.i4:                                         ; preds = %B_new.exit
  tail call void @abort()
  unreachable

C_new.exit:                                       ; preds = %B_new.exit
  %vtpm.204.i = bitcast i8* %vtpm.202.i to %_C_vtable**
  store %_C_vtable* @_C_vtable_prototype, %_C_vtable** %vtpm.204.i, align 8
  %2 = bitcast i8* %vtpm.155 to i8**
  store i8* %vtpm.202.i, i8** %2, align 8
  %vtpm.193.i5 = tail call i8* @malloc(i32 8)
  %malloc.null.i6 = icmp eq i8* %vtpm.193.i5, null
  br i1 %malloc.null.i6, label %abort.i9, label %B_new.exit10

abort.i9:                                         ; preds = %C_new.exit
  tail call void @abort()
  unreachable

B_new.exit10:                                     ; preds = %C_new.exit
  %vtpm.195.i8 = bitcast i8* %vtpm.193.i5 to %_B_vtable**
  store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.195.i8, align 8
  %3 = bitcast i8* %vtpm.156 to i8**
  store i8* %vtpm.193.i5, i8** %3, align 8
  %vtpm.202.i11 = tail call i8* @malloc(i32 8)
  %malloc.null.i12 = icmp eq i8* %vtpm.202.i11, null
  br i1 %malloc.null.i12, label %abort.i15, label %C_new.exit16

abort.i15:                                        ; preds = %B_new.exit10
  tail call void @abort()
  unreachable

C_new.exit16:                                     ; preds = %B_new.exit10
  %vtpm.157 = getelementptr i8, i8* %vtpm.150, i64 40
  %vtpm.151 = bitcast i8* %vtpm.150 to %Main*
  %vtpm.204.i14 = bitcast i8* %vtpm.202.i11 to %_C_vtable**
  store %_C_vtable* @_C_vtable_prototype, %_C_vtable** %vtpm.204.i14, align 8
  %4 = bitcast i8* %vtpm.157 to i8**
  store i8* %vtpm.202.i11, i8** %4, align 8
  ret %Main* %vtpm.151

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @A_f(%A* nocapture readnone %self) #0 {
entry:
  ret i32 5
}

define %A* @A_new() {
entry:
  %vtpm.186 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.186, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.187 = bitcast i8* %vtpm.186 to %A*
  %vtpm.188 = bitcast i8* %vtpm.186 to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.188, align 8
  ret %A* %vtpm.187

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %B* @B_new() {
entry:
  %vtpm.193 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.193, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.194 = bitcast i8* %vtpm.193 to %B*
  %vtpm.195 = bitcast i8* %vtpm.193 to %_B_vtable**
  store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.195, align 8
  ret %B* %vtpm.194

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @C_f(%C* nocapture readnone %self) #0 {
entry:
  ret i32 6
}

define %C* @C_new() {
entry:
  %vtpm.202 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.202, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.203 = bitcast i8* %vtpm.202 to %C*
  %vtpm.204 = bitcast i8* %vtpm.202 to %_C_vtable**
  store %_C_vtable* @_C_vtable_prototype, %_C_vtable** %vtpm.204, align 8
  ret %C* %vtpm.203

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #1 = { argmemonly nocallback nofree nounwind willreturn writeonly }
