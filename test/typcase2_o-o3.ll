; ModuleID = 'typcase2_o.ll'
source_filename = "typcase2_o.ll"

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
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %Main* (%Main*, %String*)*, %Main* (%Main*, i32)*, %String* (%Main*)*, i32 (%Main*)*, i32 (%Main*)*, i32 (%Main*)* }
%Main = type { %_Main_vtable*, %Gamma* }
%Gamma = type { %_Gamma_vtable* }
%_Gamma_vtable = type { i32, i32, i8*, %Gamma* ()*, %Object* (%Gamma*)*, %String* (%Gamma*)*, %Gamma* (%Gamma*)* }
%_Beta_vtable = type { i32, i32, i8*, %Beta* ()*, %Object* (%Beta*)*, %String* (%Beta*)*, %Beta* (%Beta*)* }
%Beta = type { %_Beta_vtable* }
%_Alpha_vtable = type { i32, i32, i8*, %Alpha* ()*, %Object* (%Alpha*)*, %String* (%Alpha*)*, %Alpha* (%Alpha*)* }
%Alpha = type { %_Alpha_vtable* }

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
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %Main* (%Main*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Main* (%Main*, %String*)*), %Main* (%Main*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Main* (%Main*, i32)*), %String* (%Main*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Main*)*), i32 (%Main*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Main*)*), i32 (%Main*)* @Main_func, i32 (%Main*)* @Main_main }
@str.Gamma = internal constant [6 x i8] c"Gamma\00"
@_Gamma_vtable_prototype = constant %_Gamma_vtable { i32 6, i32 ptrtoint (%Gamma* getelementptr (%Gamma, %Gamma* null, i32 1) to i32), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.Gamma, i32 0, i32 0), %Gamma* ()* @Gamma_new, %Object* (%Gamma*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Gamma*)*), %String* (%Gamma*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Gamma*)*), %Gamma* (%Gamma*)* bitcast (%Object* (%Object*)* @Object_copy to %Gamma* (%Gamma*)*) }
@str.Beta = internal constant [5 x i8] c"Beta\00"
@_Beta_vtable_prototype = constant %_Beta_vtable { i32 7, i32 ptrtoint (%Beta* getelementptr (%Beta, %Beta* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Beta, i32 0, i32 0), %Beta* ()* @Beta_new, %Object* (%Beta*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Beta*)*), %String* (%Beta*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Beta*)*), %Beta* (%Beta*)* bitcast (%Object* (%Object*)* @Object_copy to %Beta* (%Beta*)*) }
@str.Alpha = internal constant [6 x i8] c"Alpha\00"
@_Alpha_vtable_prototype = constant %_Alpha_vtable { i32 8, i32 ptrtoint (%Alpha* getelementptr (%Alpha, %Alpha* null, i32 1) to i32), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.Alpha, i32 0, i32 0), %Alpha* ()* @Alpha_new, %Object* (%Alpha*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Alpha*)*), %String* (%Alpha*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Alpha*)*), %Alpha* (%Alpha*)* bitcast (%Object* (%Object*)* @Object_copy to %Alpha* (%Alpha*)*) }
@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [14 x i8] c"typcase2_o.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.0, i32 0, i32 0) }

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
  %vtpm.51.i = tail call i8* @malloc(i32 16)
  %malloc.null.i = icmp eq i8* %vtpm.51.i, null
  br i1 %malloc.null.i, label %abort.i, label %okay.i

okay.i:                                           ; preds = %entry
  %vtpm.53.i = bitcast i8* %vtpm.51.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.53.i, align 8
  %vtpm.54.i = getelementptr i8, i8* %vtpm.51.i, i64 8
  %0 = bitcast i8* %vtpm.54.i to %Gamma**
  store %Gamma* null, %Gamma** %0, align 8
  %vtpm.78.i.i = tail call i8* @malloc(i32 8)
  %malloc.null.i.i = icmp eq i8* %vtpm.78.i.i, null
  br i1 %malloc.null.i.i, label %abort.i.i, label %Main_main.exit

abort.i.i:                                        ; preds = %okay.i
  tail call void @abort()
  unreachable

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_main.exit:                                   ; preds = %okay.i
  %vtpm.52.i = bitcast i8* %vtpm.51.i to %Main*
  %vtpm.80.i.i = bitcast i8* %vtpm.78.i.i to %_Alpha_vtable**
  store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.80.i.i, align 8
  %1 = bitcast i8* %vtpm.54.i to i8**
  store i8* %vtpm.78.i.i, i8** %1, align 8
  %vtpm.38.i = load %_Main_vtable*, %_Main_vtable** %vtpm.53.i, align 8
  %vtpm.39.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.38.i, i64 0, i32 11
  %tmp.0.i = load i32 (%Main*)*, i32 (%Main*)** %vtpm.39.i, align 8
  %vtpm.40.i = tail call i32 %tmp.0.i(%Main* nonnull %vtpm.52.i)
  %vtpm.44.i = load %_Main_vtable*, %_Main_vtable** %vtpm.53.i, align 8
  %vtpm.45.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.44.i, i64 0, i32 8
  %tmp.1.i = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.45.i, align 8
  %vtpm.46.i = tail call %Main* %tmp.1.i(%Main* nonnull %vtpm.52.i, i32 %vtpm.40.i)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define i32 @Main_func(%Main* nocapture readonly %self) {
entry:
  %vtpm.6 = getelementptr %Main, %Main* %self, i64 0, i32 1
  %vtpm.7 = load %Gamma*, %Gamma** %vtpm.6, align 8
  %tmp.1 = icmp eq %Gamma* %vtpm.7, null
  br i1 %tmp.1, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.8 = getelementptr %Gamma, %Gamma* %vtpm.7, i64 0, i32 0
  %vtpm.9 = load %_Gamma_vtable*, %_Gamma_vtable** %vtpm.8, align 8
  %vtpm.10 = getelementptr %_Gamma_vtable, %_Gamma_vtable* %vtpm.9, i64 0, i32 0
  %vtpm.11 = load i32, i32* %vtpm.10, align 4
  %.not = icmp eq i32 %vtpm.11, 8
  br i1 %.not, label %src_lte_mc.8.0, label %case.7.0

src_lte_mc.8.0:                                   ; preds = %ok.0
  %vtpm.15 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.15, i32 2)
  br label %case.exit.0

case.7.0:                                         ; preds = %ok.0
  %0 = add i32 %vtpm.11, -9
  %1 = icmp ult i32 %0, -2
  br i1 %1, label %case.6.0, label %src_lte_mc.7.0

src_lte_mc.7.0:                                   ; preds = %case.7.0
  %vtpm.20 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.20, i32 1)
  br label %case.exit.0

case.6.0:                                         ; preds = %case.7.0
  %.not4 = icmp eq i32 %0, -3
  br i1 %.not4, label %src_lte_mc.6.0, label %case.0.0

src_lte_mc.6.0:                                   ; preds = %case.6.0
  %vtpm.24 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.24, i32 3)
  br label %case.exit.0

case.0.0:                                         ; preds = %case.6.0
  %2 = icmp ugt i32 %vtpm.11, 8
  br i1 %2, label %abort, label %src_lte_mc.0.0

src_lte_mc.0.0:                                   ; preds = %case.0.0
  %vtpm.29 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.29, i32 0)
  br label %case.exit.0

case.exit.0:                                      ; preds = %src_lte_mc.0.0, %src_lte_mc.6.0, %src_lte_mc.7.0, %src_lte_mc.8.0
  %tmp.0.0 = phi %Int* [ %vtpm.29, %src_lte_mc.0.0 ], [ %vtpm.24, %src_lte_mc.6.0 ], [ %vtpm.20, %src_lte_mc.7.0 ], [ %vtpm.15, %src_lte_mc.8.0 ]
  %vtpm.31 = getelementptr %Int, %Int* %tmp.0.0, i64 0, i32 1
  %vtpm.32 = load i32, i32* %vtpm.31, align 4
  ret i32 %vtpm.32

abort:                                            ; preds = %case.0.0, %entry
  tail call void @abort()
  unreachable
}

define i32 @Main_main(%Main* %self) {
entry:
  %vtpm.36 = icmp eq %Main* %self, null
  br i1 %vtpm.36, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.37 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.38 = load %_Main_vtable*, %_Main_vtable** %vtpm.37, align 8
  %vtpm.39 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.38, i64 0, i32 11
  %tmp.0 = load i32 (%Main*)*, i32 (%Main*)** %vtpm.39, align 8
  %vtpm.40 = tail call i32 %tmp.0(%Main* nonnull %self)
  %vtpm.44 = load %_Main_vtable*, %_Main_vtable** %vtpm.37, align 8
  %vtpm.45 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.44, i64 0, i32 8
  %tmp.1 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.45, align 8
  %vtpm.46 = tail call %Main* %tmp.1(%Main* nonnull %self, i32 %vtpm.40)
  ret i32 0

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.51 = tail call i8* @malloc(i32 16)
  %malloc.null = icmp eq i8* %vtpm.51, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.53 = bitcast i8* %vtpm.51 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.53, align 8
  %vtpm.54 = getelementptr i8, i8* %vtpm.51, i64 8
  %0 = bitcast i8* %vtpm.54 to %Gamma**
  store %Gamma* null, %Gamma** %0, align 8
  %vtpm.78.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.78.i, null
  br i1 %malloc.null.i, label %abort.i, label %Alpha_new.exit

abort.i:                                          ; preds = %okay
  tail call void @abort()
  unreachable

Alpha_new.exit:                                   ; preds = %okay
  %vtpm.52 = bitcast i8* %vtpm.51 to %Main*
  %vtpm.80.i = bitcast i8* %vtpm.78.i to %_Alpha_vtable**
  store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.80.i, align 8
  %1 = bitcast i8* %vtpm.54 to i8**
  store i8* %vtpm.78.i, i8** %1, align 8
  ret %Main* %vtpm.52

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Gamma* @Gamma_new() {
entry:
  %vtpm.64 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.64, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.65 = bitcast i8* %vtpm.64 to %Gamma*
  %vtpm.66 = bitcast i8* %vtpm.64 to %_Gamma_vtable**
  store %_Gamma_vtable* @_Gamma_vtable_prototype, %_Gamma_vtable** %vtpm.66, align 8
  ret %Gamma* %vtpm.65

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Beta* @Beta_new() {
entry:
  %vtpm.71 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.71, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.72 = bitcast i8* %vtpm.71 to %Beta*
  %vtpm.73 = bitcast i8* %vtpm.71 to %_Beta_vtable**
  store %_Beta_vtable* @_Beta_vtable_prototype, %_Beta_vtable** %vtpm.73, align 8
  ret %Beta* %vtpm.72

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Alpha* @Alpha_new() {
entry:
  %vtpm.78 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.78, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.79 = bitcast i8* %vtpm.78 to %Alpha*
  %vtpm.80 = bitcast i8* %vtpm.78 to %_Alpha_vtable**
  store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.80, align 8
  ret %Alpha* %vtpm.79

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}
