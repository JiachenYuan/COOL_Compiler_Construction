; ModuleID = 'caseloop_o.ll'
source_filename = "caseloop_o.ll"

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
%_C_vtable = type { i32, i32, i8*, %C* ()*, %Object* (%C*)*, %String* (%C*)*, %C* (%C*)* }
%C = type { %_C_vtable* }
%_D_vtable = type { i32, i32, i8*, %D* ()*, %Object* (%D*)*, %String* (%D*)*, %D* (%D*)* }
%D = type { %_D_vtable* }
%_E_vtable = type { i32, i32, i8*, %E* ()*, %Object* (%E*)*, %String* (%E*)*, %E* (%E*)* }
%E = type { %_E_vtable* }
%_F_vtable = type { i32, i32, i8*, %F* ()*, %Object* (%F*)*, %String* (%F*)*, %F* (%F*)* }
%F = type { %_F_vtable* }
%_G_vtable = type { i32, i32, i8*, %G* ()*, %Object* (%G*)*, %String* (%G*)*, %G* (%G*)* }
%G = type { %_G_vtable* }
%_H_vtable = type { i32, i32, i8*, %H* ()*, %Object* (%H*)*, %String* (%H*)*, %H* (%H*)* }
%H = type { %_H_vtable* }
%_I_vtable = type { i32, i32, i8*, %I* ()*, %Object* (%I*)*, %String* (%I*)*, %I* (%I*)* }
%I = type { %_I_vtable* }
%_J_vtable = type { i32, i32, i8*, %J* ()*, %Object* (%J*)*, %String* (%J*)*, %J* (%J*)* }
%J = type { %_J_vtable* }
%_K_vtable = type { i32, i32, i8*, %K* ()*, %Object* (%K*)*, %String* (%K*)*, %K* (%K*)* }
%K = type { %_K_vtable* }
%_L_vtable = type { i32, i32, i8*, %L* ()*, %Object* (%L*)*, %String* (%L*)*, %L* (%L*)* }
%L = type { %_L_vtable* }
%_M_vtable = type { i32, i32, i8*, %M* ()*, %Object* (%M*)*, %String* (%M*)*, %M* (%M*)* }
%M = type { %_M_vtable* }
%_N_vtable = type { i32, i32, i8*, %N* ()*, %Object* (%N*)*, %String* (%N*)*, %N* (%N*)* }
%N = type { %_N_vtable* }
%_O_vtable = type { i32, i32, i8*, %O* ()*, %Object* (%O*)*, %String* (%O*)*, %O* (%O*)* }
%O = type { %_O_vtable* }
%_P_vtable = type { i32, i32, i8*, %P* ()*, %Object* (%P*)*, %String* (%P*)*, %P* (%P*)* }
%P = type { %_P_vtable* }
%_Q_vtable = type { i32, i32, i8*, %Q* ()*, %Object* (%Q*)*, %String* (%Q*)*, %Q* (%Q*)* }
%Q = type { %_Q_vtable* }

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
@str.C = internal constant [2 x i8] c"C\00"
@_C_vtable_prototype = constant %_C_vtable { i32 8, i32 ptrtoint (%C* getelementptr (%C, %C* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.C, i32 0, i32 0), %C* ()* @C_new, %Object* (%C*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%C*)*), %String* (%C*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%C*)*), %C* (%C*)* bitcast (%Object* (%Object*)* @Object_copy to %C* (%C*)*) }
@str.D = internal constant [2 x i8] c"D\00"
@_D_vtable_prototype = constant %_D_vtable { i32 9, i32 ptrtoint (%D* getelementptr (%D, %D* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.D, i32 0, i32 0), %D* ()* @D_new, %Object* (%D*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%D*)*), %String* (%D*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%D*)*), %D* (%D*)* bitcast (%Object* (%Object*)* @Object_copy to %D* (%D*)*) }
@str.E = internal constant [2 x i8] c"E\00"
@_E_vtable_prototype = constant %_E_vtable { i32 10, i32 ptrtoint (%E* getelementptr (%E, %E* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.E, i32 0, i32 0), %E* ()* @E_new, %Object* (%E*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%E*)*), %String* (%E*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%E*)*), %E* (%E*)* bitcast (%Object* (%Object*)* @Object_copy to %E* (%E*)*) }
@str.F = internal constant [2 x i8] c"F\00"
@_F_vtable_prototype = constant %_F_vtable { i32 11, i32 ptrtoint (%F* getelementptr (%F, %F* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.F, i32 0, i32 0), %F* ()* @F_new, %Object* (%F*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%F*)*), %String* (%F*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%F*)*), %F* (%F*)* bitcast (%Object* (%Object*)* @Object_copy to %F* (%F*)*) }
@str.G = internal constant [2 x i8] c"G\00"
@_G_vtable_prototype = constant %_G_vtable { i32 12, i32 ptrtoint (%G* getelementptr (%G, %G* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.G, i32 0, i32 0), %G* ()* @G_new, %Object* (%G*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%G*)*), %String* (%G*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%G*)*), %G* (%G*)* bitcast (%Object* (%Object*)* @Object_copy to %G* (%G*)*) }
@str.H = internal constant [2 x i8] c"H\00"
@_H_vtable_prototype = constant %_H_vtable { i32 13, i32 ptrtoint (%H* getelementptr (%H, %H* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.H, i32 0, i32 0), %H* ()* @H_new, %Object* (%H*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%H*)*), %String* (%H*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%H*)*), %H* (%H*)* bitcast (%Object* (%Object*)* @Object_copy to %H* (%H*)*) }
@str.I = internal constant [2 x i8] c"I\00"
@_I_vtable_prototype = constant %_I_vtable { i32 14, i32 ptrtoint (%I* getelementptr (%I, %I* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.I, i32 0, i32 0), %I* ()* @I_new, %Object* (%I*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%I*)*), %String* (%I*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%I*)*), %I* (%I*)* bitcast (%Object* (%Object*)* @Object_copy to %I* (%I*)*) }
@str.J = internal constant [2 x i8] c"J\00"
@_J_vtable_prototype = constant %_J_vtable { i32 15, i32 ptrtoint (%J* getelementptr (%J, %J* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.J, i32 0, i32 0), %J* ()* @J_new, %Object* (%J*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%J*)*), %String* (%J*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%J*)*), %J* (%J*)* bitcast (%Object* (%Object*)* @Object_copy to %J* (%J*)*) }
@str.K = internal constant [2 x i8] c"K\00"
@_K_vtable_prototype = constant %_K_vtable { i32 16, i32 ptrtoint (%K* getelementptr (%K, %K* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.K, i32 0, i32 0), %K* ()* @K_new, %Object* (%K*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%K*)*), %String* (%K*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%K*)*), %K* (%K*)* bitcast (%Object* (%Object*)* @Object_copy to %K* (%K*)*) }
@str.L = internal constant [2 x i8] c"L\00"
@_L_vtable_prototype = constant %_L_vtable { i32 17, i32 ptrtoint (%L* getelementptr (%L, %L* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.L, i32 0, i32 0), %L* ()* @L_new, %Object* (%L*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%L*)*), %String* (%L*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%L*)*), %L* (%L*)* bitcast (%Object* (%Object*)* @Object_copy to %L* (%L*)*) }
@str.M = internal constant [2 x i8] c"M\00"
@_M_vtable_prototype = constant %_M_vtable { i32 18, i32 ptrtoint (%M* getelementptr (%M, %M* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.M, i32 0, i32 0), %M* ()* @M_new, %Object* (%M*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%M*)*), %String* (%M*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%M*)*), %M* (%M*)* bitcast (%Object* (%Object*)* @Object_copy to %M* (%M*)*) }
@str.N = internal constant [2 x i8] c"N\00"
@_N_vtable_prototype = constant %_N_vtable { i32 19, i32 ptrtoint (%N* getelementptr (%N, %N* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.N, i32 0, i32 0), %N* ()* @N_new, %Object* (%N*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%N*)*), %String* (%N*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%N*)*), %N* (%N*)* bitcast (%Object* (%Object*)* @Object_copy to %N* (%N*)*) }
@str.O = internal constant [2 x i8] c"O\00"
@_O_vtable_prototype = constant %_O_vtable { i32 20, i32 ptrtoint (%O* getelementptr (%O, %O* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.O, i32 0, i32 0), %O* ()* @O_new, %Object* (%O*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%O*)*), %String* (%O*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%O*)*), %O* (%O*)* bitcast (%Object* (%Object*)* @Object_copy to %O* (%O*)*) }
@str.P = internal constant [2 x i8] c"P\00"
@_P_vtable_prototype = constant %_P_vtable { i32 21, i32 ptrtoint (%P* getelementptr (%P, %P* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.P, i32 0, i32 0), %P* ()* @P_new, %Object* (%P*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%P*)*), %String* (%P*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%P*)*), %P* (%P*)* bitcast (%Object* (%Object*)* @Object_copy to %P* (%P*)*) }
@str.Q = internal constant [2 x i8] c"Q\00"
@_Q_vtable_prototype = constant %_Q_vtable { i32 22, i32 ptrtoint (%Q* getelementptr (%Q, %Q* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.Q, i32 0, i32 0), %Q* ()* @Q_new, %Object* (%Q*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Q*)*), %String* (%Q*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Q*)*), %Q* (%Q*)* bitcast (%Object* (%Object*)* @Object_copy to %Q* (%Q*)*) }
@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [14 x i8] c"caseloop_o.cl\00"
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
  %vtpm.275.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.275.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.276.i = bitcast i8* %vtpm.275.i to %Main*
  %vtpm.277.i = bitcast i8* %vtpm.275.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.277.i, align 8
  %main.retval = tail call %Object* @Main_main(%Main* nonnull %vtpm.276.i)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %Object* @Main_main(%Main* %self) {
entry:
  %vtpm.282.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.282.i, null
  br i1 %malloc.null.i, label %abort.i, label %A_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

A_new.exit:                                       ; preds = %entry
  %vtpm.284.i = bitcast i8* %vtpm.282.i to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.284.i, align 8
  %vtpm.394.i = tail call i8* @malloc(i32 8)
  %malloc.null.i41 = icmp eq i8* %vtpm.394.i, null
  br i1 %malloc.null.i41, label %abort.i42, label %Q_new.exit

abort.i42:                                        ; preds = %A_new.exit
  tail call void @abort()
  unreachable

Q_new.exit:                                       ; preds = %A_new.exit
  %vtpm.396.i = bitcast i8* %vtpm.394.i to %_Q_vtable**
  store %_Q_vtable* @_Q_vtable_prototype, %_Q_vtable** %vtpm.396.i, align 8
  %vtpm.49 = bitcast i8* %vtpm.394.i to %_Object_vtable**
  br label %ok.0

ok.0:                                             ; preds = %Q_new.exit, %case.exit.1
  %vtpm.0.062 = phi i32 [ 0, %Q_new.exit ], [ %vtpm.141, %case.exit.1 ]
  %vtpm.50 = load %_Object_vtable*, %_Object_vtable** %vtpm.49, align 8
  %vtpm.51 = getelementptr %_Object_vtable, %_Object_vtable* %vtpm.50, i64 0, i32 0
  %vtpm.52 = load i32, i32* %vtpm.51, align 4
  %.not40 = icmp eq i32 %vtpm.52, 22
  br i1 %.not40, label %src_lte_mc.22.1, label %case.21.1

src_lte_mc.22.1:                                  ; preds = %ok.0
  %vtpm.56 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.56, i32 17)
  br label %case.exit.1

case.21.1:                                        ; preds = %ok.0
  %0 = add i32 %vtpm.52, -23
  %1 = icmp ult i32 %0, -2
  br i1 %1, label %case.20.1, label %src_lte_mc.21.1

src_lte_mc.21.1:                                  ; preds = %case.21.1
  %vtpm.61 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.61, i32 16)
  br label %case.exit.1

case.20.1:                                        ; preds = %case.21.1
  %.not51 = icmp eq i32 %0, -3
  br i1 %.not51, label %src_lte_mc.20.1, label %case.19.1

src_lte_mc.20.1:                                  ; preds = %case.20.1
  %vtpm.66 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.66, i32 15)
  br label %case.exit.1

case.19.1:                                        ; preds = %case.20.1
  %2 = icmp ult i32 %0, -4
  br i1 %2, label %case.18.1, label %src_lte_mc.19.1

src_lte_mc.19.1:                                  ; preds = %case.19.1
  %vtpm.71 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.71, i32 14)
  br label %case.exit.1

case.18.1:                                        ; preds = %case.19.1
  %.not52 = icmp eq i32 %0, -5
  br i1 %.not52, label %src_lte_mc.18.1, label %case.17.1

src_lte_mc.18.1:                                  ; preds = %case.18.1
  %vtpm.76 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.76, i32 13)
  br label %case.exit.1

case.17.1:                                        ; preds = %case.18.1
  %3 = icmp ult i32 %0, -6
  br i1 %3, label %case.16.1, label %src_lte_mc.17.1

src_lte_mc.17.1:                                  ; preds = %case.17.1
  %vtpm.81 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.81, i32 12)
  br label %case.exit.1

case.16.1:                                        ; preds = %case.17.1
  %.not53 = icmp eq i32 %0, -7
  br i1 %.not53, label %src_lte_mc.16.1, label %case.15.1

src_lte_mc.16.1:                                  ; preds = %case.16.1
  %vtpm.86 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.86, i32 11)
  br label %case.exit.1

case.15.1:                                        ; preds = %case.16.1
  %4 = icmp ult i32 %0, -8
  br i1 %4, label %case.14.1, label %src_lte_mc.15.1

src_lte_mc.15.1:                                  ; preds = %case.15.1
  %vtpm.91 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.91, i32 10)
  br label %case.exit.1

case.14.1:                                        ; preds = %case.15.1
  %.not54 = icmp eq i32 %0, -9
  br i1 %.not54, label %src_lte_mc.14.1, label %case.13.1

src_lte_mc.14.1:                                  ; preds = %case.14.1
  %vtpm.96 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.96, i32 9)
  br label %case.exit.1

case.13.1:                                        ; preds = %case.14.1
  %5 = icmp ult i32 %0, -10
  br i1 %5, label %case.12.1, label %src_lte_mc.13.1

src_lte_mc.13.1:                                  ; preds = %case.13.1
  %vtpm.101 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.101, i32 8)
  br label %case.exit.1

case.12.1:                                        ; preds = %case.13.1
  %.not55 = icmp eq i32 %0, -11
  br i1 %.not55, label %src_lte_mc.12.1, label %case.11.1

src_lte_mc.12.1:                                  ; preds = %case.12.1
  %vtpm.106 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.106, i32 7)
  br label %case.exit.1

case.11.1:                                        ; preds = %case.12.1
  %6 = icmp ult i32 %0, -12
  br i1 %6, label %case.10.1, label %src_lte_mc.11.1

src_lte_mc.11.1:                                  ; preds = %case.11.1
  %vtpm.111 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.111, i32 6)
  br label %case.exit.1

case.10.1:                                        ; preds = %case.11.1
  %.not56 = icmp eq i32 %0, -13
  br i1 %.not56, label %src_lte_mc.10.1, label %case.9.1

src_lte_mc.10.1:                                  ; preds = %case.10.1
  %vtpm.116 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.116, i32 5)
  br label %case.exit.1

case.9.1:                                         ; preds = %case.10.1
  %7 = icmp ult i32 %0, -14
  br i1 %7, label %case.8.1, label %src_lte_mc.9.1

src_lte_mc.9.1:                                   ; preds = %case.9.1
  %vtpm.121 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.121, i32 4)
  br label %case.exit.1

case.8.1:                                         ; preds = %case.9.1
  %.not57 = icmp eq i32 %0, -15
  br i1 %.not57, label %src_lte_mc.8.1, label %case.7.1

src_lte_mc.8.1:                                   ; preds = %case.8.1
  %vtpm.126 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.126, i32 3)
  br label %case.exit.1

case.7.1:                                         ; preds = %case.8.1
  %8 = icmp ult i32 %0, -16
  br i1 %8, label %case.6.1, label %src_lte_mc.7.1

src_lte_mc.7.1:                                   ; preds = %case.7.1
  %vtpm.131 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.131, i32 2)
  br label %case.exit.1

case.6.1:                                         ; preds = %case.7.1
  %.not58 = icmp eq i32 %0, -17
  br i1 %.not58, label %src_lte_mc.6.1, label %abort

src_lte_mc.6.1:                                   ; preds = %case.6.1
  %vtpm.136 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.136, i32 1)
  br label %case.exit.1

case.exit.1:                                      ; preds = %src_lte_mc.6.1, %src_lte_mc.7.1, %src_lte_mc.8.1, %src_lte_mc.9.1, %src_lte_mc.10.1, %src_lte_mc.11.1, %src_lte_mc.12.1, %src_lte_mc.13.1, %src_lte_mc.14.1, %src_lte_mc.15.1, %src_lte_mc.16.1, %src_lte_mc.17.1, %src_lte_mc.18.1, %src_lte_mc.19.1, %src_lte_mc.20.1, %src_lte_mc.21.1, %src_lte_mc.22.1
  %tmp.0.0 = phi %Int* [ %vtpm.136, %src_lte_mc.6.1 ], [ %vtpm.131, %src_lte_mc.7.1 ], [ %vtpm.126, %src_lte_mc.8.1 ], [ %vtpm.121, %src_lte_mc.9.1 ], [ %vtpm.116, %src_lte_mc.10.1 ], [ %vtpm.111, %src_lte_mc.11.1 ], [ %vtpm.106, %src_lte_mc.12.1 ], [ %vtpm.101, %src_lte_mc.13.1 ], [ %vtpm.96, %src_lte_mc.14.1 ], [ %vtpm.91, %src_lte_mc.15.1 ], [ %vtpm.86, %src_lte_mc.16.1 ], [ %vtpm.81, %src_lte_mc.17.1 ], [ %vtpm.76, %src_lte_mc.18.1 ], [ %vtpm.71, %src_lte_mc.19.1 ], [ %vtpm.66, %src_lte_mc.20.1 ], [ %vtpm.61, %src_lte_mc.21.1 ], [ %vtpm.56, %src_lte_mc.22.1 ]
  %vtpm.141 = add nuw nsw i32 %vtpm.0.062, 1
  %vtpm.47 = icmp ult i32 %vtpm.0.062, 99
  br i1 %vtpm.47, label %ok.0, label %loop_end.0

loop_end.0:                                       ; preds = %case.exit.1
  %vtpm.138 = getelementptr %Int, %Int* %tmp.0.0, i64 0, i32 1
  %vtpm.139 = load i32, i32* %vtpm.138, align 4
  %vtpm.143 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.143, i32 %vtpm.139)
  %vtpm.146 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.146, i32 17)
  %vtpm.157 = bitcast i8* %vtpm.282.i to %_Object_vtable**
  br label %ok.1

ok.1:                                             ; preds = %loop_end.0, %case.exit.4
  %vtpm.0.163 = phi i32 [ 0, %loop_end.0 ], [ %vtpm.249, %case.exit.4 ]
  %vtpm.158 = load %_Object_vtable*, %_Object_vtable** %vtpm.157, align 8
  %vtpm.159 = getelementptr %_Object_vtable, %_Object_vtable* %vtpm.158, i64 0, i32 0
  %vtpm.160 = load i32, i32* %vtpm.159, align 4
  %.not = icmp eq i32 %vtpm.160, 22
  br i1 %.not, label %src_lte_mc.22.4, label %case.21.4

src_lte_mc.22.4:                                  ; preds = %ok.1
  %vtpm.164 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.164, i32 17)
  br label %case.exit.4

case.21.4:                                        ; preds = %ok.1
  %9 = add i32 %vtpm.160, -23
  %10 = icmp ult i32 %9, -2
  br i1 %10, label %case.20.4, label %src_lte_mc.21.4

src_lte_mc.21.4:                                  ; preds = %case.21.4
  %vtpm.169 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.169, i32 16)
  br label %case.exit.4

case.20.4:                                        ; preds = %case.21.4
  %.not43 = icmp eq i32 %9, -3
  br i1 %.not43, label %src_lte_mc.20.4, label %case.19.4

src_lte_mc.20.4:                                  ; preds = %case.20.4
  %vtpm.174 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.174, i32 15)
  br label %case.exit.4

case.19.4:                                        ; preds = %case.20.4
  %11 = icmp ult i32 %9, -4
  br i1 %11, label %case.18.4, label %src_lte_mc.19.4

src_lte_mc.19.4:                                  ; preds = %case.19.4
  %vtpm.179 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.179, i32 14)
  br label %case.exit.4

case.18.4:                                        ; preds = %case.19.4
  %.not44 = icmp eq i32 %9, -5
  br i1 %.not44, label %src_lte_mc.18.4, label %case.17.4

src_lte_mc.18.4:                                  ; preds = %case.18.4
  %vtpm.184 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.184, i32 13)
  br label %case.exit.4

case.17.4:                                        ; preds = %case.18.4
  %12 = icmp ult i32 %9, -6
  br i1 %12, label %case.16.4, label %src_lte_mc.17.4

src_lte_mc.17.4:                                  ; preds = %case.17.4
  %vtpm.189 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.189, i32 12)
  br label %case.exit.4

case.16.4:                                        ; preds = %case.17.4
  %.not45 = icmp eq i32 %9, -7
  br i1 %.not45, label %src_lte_mc.16.4, label %case.15.4

src_lte_mc.16.4:                                  ; preds = %case.16.4
  %vtpm.194 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.194, i32 11)
  br label %case.exit.4

case.15.4:                                        ; preds = %case.16.4
  %13 = icmp ult i32 %9, -8
  br i1 %13, label %case.14.4, label %src_lte_mc.15.4

src_lte_mc.15.4:                                  ; preds = %case.15.4
  %vtpm.199 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.199, i32 10)
  br label %case.exit.4

case.14.4:                                        ; preds = %case.15.4
  %.not46 = icmp eq i32 %9, -9
  br i1 %.not46, label %src_lte_mc.14.4, label %case.13.4

src_lte_mc.14.4:                                  ; preds = %case.14.4
  %vtpm.204 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.204, i32 9)
  br label %case.exit.4

case.13.4:                                        ; preds = %case.14.4
  %14 = icmp ult i32 %9, -10
  br i1 %14, label %case.12.4, label %src_lte_mc.13.4

src_lte_mc.13.4:                                  ; preds = %case.13.4
  %vtpm.209 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.209, i32 8)
  br label %case.exit.4

case.12.4:                                        ; preds = %case.13.4
  %.not47 = icmp eq i32 %9, -11
  br i1 %.not47, label %src_lte_mc.12.4, label %case.11.4

src_lte_mc.12.4:                                  ; preds = %case.12.4
  %vtpm.214 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.214, i32 7)
  br label %case.exit.4

case.11.4:                                        ; preds = %case.12.4
  %15 = icmp ult i32 %9, -12
  br i1 %15, label %case.10.4, label %src_lte_mc.11.4

src_lte_mc.11.4:                                  ; preds = %case.11.4
  %vtpm.219 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.219, i32 6)
  br label %case.exit.4

case.10.4:                                        ; preds = %case.11.4
  %.not48 = icmp eq i32 %9, -13
  br i1 %.not48, label %src_lte_mc.10.4, label %case.9.4

src_lte_mc.10.4:                                  ; preds = %case.10.4
  %vtpm.224 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.224, i32 5)
  br label %case.exit.4

case.9.4:                                         ; preds = %case.10.4
  %16 = icmp ult i32 %9, -14
  br i1 %16, label %case.8.4, label %src_lte_mc.9.4

src_lte_mc.9.4:                                   ; preds = %case.9.4
  %vtpm.229 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.229, i32 4)
  br label %case.exit.4

case.8.4:                                         ; preds = %case.9.4
  %.not49 = icmp eq i32 %9, -15
  br i1 %.not49, label %src_lte_mc.8.4, label %case.7.4

src_lte_mc.8.4:                                   ; preds = %case.8.4
  %vtpm.234 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.234, i32 3)
  br label %case.exit.4

case.7.4:                                         ; preds = %case.8.4
  %17 = icmp ult i32 %9, -16
  br i1 %17, label %case.6.4, label %src_lte_mc.7.4

src_lte_mc.7.4:                                   ; preds = %case.7.4
  %vtpm.239 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.239, i32 2)
  br label %case.exit.4

case.6.4:                                         ; preds = %case.7.4
  %.not50 = icmp eq i32 %9, -17
  br i1 %.not50, label %src_lte_mc.6.4, label %abort

src_lte_mc.6.4:                                   ; preds = %case.6.4
  %vtpm.244 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.244, i32 1)
  br label %case.exit.4

case.exit.4:                                      ; preds = %src_lte_mc.6.4, %src_lte_mc.7.4, %src_lte_mc.8.4, %src_lte_mc.9.4, %src_lte_mc.10.4, %src_lte_mc.11.4, %src_lte_mc.12.4, %src_lte_mc.13.4, %src_lte_mc.14.4, %src_lte_mc.15.4, %src_lte_mc.16.4, %src_lte_mc.17.4, %src_lte_mc.18.4, %src_lte_mc.19.4, %src_lte_mc.20.4, %src_lte_mc.21.4, %src_lte_mc.22.4
  %tmp.1.0 = phi %Int* [ %vtpm.244, %src_lte_mc.6.4 ], [ %vtpm.239, %src_lte_mc.7.4 ], [ %vtpm.234, %src_lte_mc.8.4 ], [ %vtpm.229, %src_lte_mc.9.4 ], [ %vtpm.224, %src_lte_mc.10.4 ], [ %vtpm.219, %src_lte_mc.11.4 ], [ %vtpm.214, %src_lte_mc.12.4 ], [ %vtpm.209, %src_lte_mc.13.4 ], [ %vtpm.204, %src_lte_mc.14.4 ], [ %vtpm.199, %src_lte_mc.15.4 ], [ %vtpm.194, %src_lte_mc.16.4 ], [ %vtpm.189, %src_lte_mc.17.4 ], [ %vtpm.184, %src_lte_mc.18.4 ], [ %vtpm.179, %src_lte_mc.19.4 ], [ %vtpm.174, %src_lte_mc.20.4 ], [ %vtpm.169, %src_lte_mc.21.4 ], [ %vtpm.164, %src_lte_mc.22.4 ]
  %vtpm.249 = add nuw nsw i32 %vtpm.0.163, 1
  %vtpm.155 = icmp ult i32 %vtpm.0.163, 9
  br i1 %vtpm.155, label %ok.1, label %loop_end.3

loop_end.3:                                       ; preds = %case.exit.4
  %vtpm.246 = getelementptr %Int, %Int* %tmp.1.0, i64 0, i32 1
  %vtpm.247 = load i32, i32* %vtpm.246, align 4
  %vtpm.251 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.251, i32 %vtpm.247)
  %vtpm.254 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.254, i32 1)
  %vtpm.264 = icmp eq %Main* %self, null
  br i1 %vtpm.264, label %abort, label %ok.2

ok.2:                                             ; preds = %loop_end.3
  %vtpm.257.not = icmp eq %Int* %vtpm.251, %vtpm.254
  %vtpm.149.not = icmp ne %Int* %vtpm.143, %vtpm.146
  %. = zext i1 %vtpm.149.not to i32
  %vtpm.260 = select i1 %vtpm.149.not, i32 2, i32 1
  %vtpm.1.1 = select i1 %vtpm.257.not, i32 %., i32 %vtpm.260
  %vtpm.265 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.266 = load %_Main_vtable*, %_Main_vtable** %vtpm.265, align 8
  %vtpm.267 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.266, i64 0, i32 8
  %tmp.6 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.267, align 8
  %vtpm.268 = tail call %Main* %tmp.6(%Main* nonnull %self, i32 %vtpm.1.1)
  %vtpm.270 = bitcast %Main* %self to %Object*
  ret %Object* %vtpm.270

abort:                                            ; preds = %case.6.1, %case.6.4, %loop_end.3
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.275 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.275, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.276 = bitcast i8* %vtpm.275 to %Main*
  %vtpm.277 = bitcast i8* %vtpm.275 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.277, align 8
  ret %Main* %vtpm.276

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %A* @A_new() {
entry:
  %vtpm.282 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.282, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.283 = bitcast i8* %vtpm.282 to %A*
  %vtpm.284 = bitcast i8* %vtpm.282 to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.284, align 8
  ret %A* %vtpm.283

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %B* @B_new() {
entry:
  %vtpm.289 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.289, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.290 = bitcast i8* %vtpm.289 to %B*
  %vtpm.291 = bitcast i8* %vtpm.289 to %_B_vtable**
  store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.291, align 8
  ret %B* %vtpm.290

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %C* @C_new() {
entry:
  %vtpm.296 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.296, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.297 = bitcast i8* %vtpm.296 to %C*
  %vtpm.298 = bitcast i8* %vtpm.296 to %_C_vtable**
  store %_C_vtable* @_C_vtable_prototype, %_C_vtable** %vtpm.298, align 8
  ret %C* %vtpm.297

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %D* @D_new() {
entry:
  %vtpm.303 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.303, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.304 = bitcast i8* %vtpm.303 to %D*
  %vtpm.305 = bitcast i8* %vtpm.303 to %_D_vtable**
  store %_D_vtable* @_D_vtable_prototype, %_D_vtable** %vtpm.305, align 8
  ret %D* %vtpm.304

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %E* @E_new() {
entry:
  %vtpm.310 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.310, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.311 = bitcast i8* %vtpm.310 to %E*
  %vtpm.312 = bitcast i8* %vtpm.310 to %_E_vtable**
  store %_E_vtable* @_E_vtable_prototype, %_E_vtable** %vtpm.312, align 8
  ret %E* %vtpm.311

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %F* @F_new() {
entry:
  %vtpm.317 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.317, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.318 = bitcast i8* %vtpm.317 to %F*
  %vtpm.319 = bitcast i8* %vtpm.317 to %_F_vtable**
  store %_F_vtable* @_F_vtable_prototype, %_F_vtable** %vtpm.319, align 8
  ret %F* %vtpm.318

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %G* @G_new() {
entry:
  %vtpm.324 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.324, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.325 = bitcast i8* %vtpm.324 to %G*
  %vtpm.326 = bitcast i8* %vtpm.324 to %_G_vtable**
  store %_G_vtable* @_G_vtable_prototype, %_G_vtable** %vtpm.326, align 8
  ret %G* %vtpm.325

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %H* @H_new() {
entry:
  %vtpm.331 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.331, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.332 = bitcast i8* %vtpm.331 to %H*
  %vtpm.333 = bitcast i8* %vtpm.331 to %_H_vtable**
  store %_H_vtable* @_H_vtable_prototype, %_H_vtable** %vtpm.333, align 8
  ret %H* %vtpm.332

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %I* @I_new() {
entry:
  %vtpm.338 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.338, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.339 = bitcast i8* %vtpm.338 to %I*
  %vtpm.340 = bitcast i8* %vtpm.338 to %_I_vtable**
  store %_I_vtable* @_I_vtable_prototype, %_I_vtable** %vtpm.340, align 8
  ret %I* %vtpm.339

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %J* @J_new() {
entry:
  %vtpm.345 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.345, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.346 = bitcast i8* %vtpm.345 to %J*
  %vtpm.347 = bitcast i8* %vtpm.345 to %_J_vtable**
  store %_J_vtable* @_J_vtable_prototype, %_J_vtable** %vtpm.347, align 8
  ret %J* %vtpm.346

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %K* @K_new() {
entry:
  %vtpm.352 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.352, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.353 = bitcast i8* %vtpm.352 to %K*
  %vtpm.354 = bitcast i8* %vtpm.352 to %_K_vtable**
  store %_K_vtable* @_K_vtable_prototype, %_K_vtable** %vtpm.354, align 8
  ret %K* %vtpm.353

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %L* @L_new() {
entry:
  %vtpm.359 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.359, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.360 = bitcast i8* %vtpm.359 to %L*
  %vtpm.361 = bitcast i8* %vtpm.359 to %_L_vtable**
  store %_L_vtable* @_L_vtable_prototype, %_L_vtable** %vtpm.361, align 8
  ret %L* %vtpm.360

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %M* @M_new() {
entry:
  %vtpm.366 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.366, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.367 = bitcast i8* %vtpm.366 to %M*
  %vtpm.368 = bitcast i8* %vtpm.366 to %_M_vtable**
  store %_M_vtable* @_M_vtable_prototype, %_M_vtable** %vtpm.368, align 8
  ret %M* %vtpm.367

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %N* @N_new() {
entry:
  %vtpm.373 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.373, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.374 = bitcast i8* %vtpm.373 to %N*
  %vtpm.375 = bitcast i8* %vtpm.373 to %_N_vtable**
  store %_N_vtable* @_N_vtable_prototype, %_N_vtable** %vtpm.375, align 8
  ret %N* %vtpm.374

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %O* @O_new() {
entry:
  %vtpm.380 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.380, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.381 = bitcast i8* %vtpm.380 to %O*
  %vtpm.382 = bitcast i8* %vtpm.380 to %_O_vtable**
  store %_O_vtable* @_O_vtable_prototype, %_O_vtable** %vtpm.382, align 8
  ret %O* %vtpm.381

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %P* @P_new() {
entry:
  %vtpm.387 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.387, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.388 = bitcast i8* %vtpm.387 to %P*
  %vtpm.389 = bitcast i8* %vtpm.387 to %_P_vtable**
  store %_P_vtable* @_P_vtable_prototype, %_P_vtable** %vtpm.389, align 8
  ret %P* %vtpm.388

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Q* @Q_new() {
entry:
  %vtpm.394 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.394, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.395 = bitcast i8* %vtpm.394 to %Q*
  %vtpm.396 = bitcast i8* %vtpm.394 to %_Q_vtable**
  store %_Q_vtable* @_Q_vtable_prototype, %_Q_vtable** %vtpm.396, align 8
  ret %Q* %vtpm.395

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}
