declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
declare %Object* @Object_abort(%Object*)
declare %String* @Object_type_name(%Object*)
declare %Object* @Object_copy(%Object*)
@str.Object = internal constant [7 x i8] c"Object\00"
%Object = type {
	%_Object_vtable*
}

%_Object_vtable = type {
	i32,
	i32,
	i8*,
	%Object* () *,
	%Object* (%Object*) *,
	%String* (%Object*) *,
	%Object* (%Object*) *
}

@_Object_vtable_prototype = constant %_Object_vtable {
	i32 0,
	i32 ptrtoint (%Object* getelementptr (%Object, %Object* null, i32 1) to i32),
	i8* getelementptr ([7 x i8], [7 x i8]* @str.Object, i32 0, i32 0),
	%Object* () * @Object_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy
}

declare void @Int_init(%Int*, i32)
@str.Int = internal constant [4 x i8] c"Int\00"
%Int = type {
	%_Int_vtable*,
	i32
}

%_Int_vtable = type {
	i32,
	i32,
	i8*,
	%Int* () *,
	%Object* (%Int*) *,
	%String* (%Int*) *,
	%Int* (%Int*) *
}

@_Int_vtable_prototype = constant %_Int_vtable {
	i32 1,
	i32 ptrtoint (%Int* getelementptr (%Int, %Int* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Int, i32 0, i32 0),
	%Int* () * @Int_new,
	%Object* (%Int*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Int*) *),
	%String* (%Int*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Int*) *),
	%Int* (%Int*) * bitcast (%Object* (%Object*) * @Object_copy to %Int* (%Int*) *)
}

declare void @Bool_init(%Bool*, i1)
@str.Bool = internal constant [5 x i8] c"Bool\00"
%Bool = type {
	%_Bool_vtable*,
	i1
}

%_Bool_vtable = type {
	i32,
	i32,
	i8*,
	%Bool* () *,
	%Object* (%Bool*) *,
	%String* (%Bool*) *,
	%Bool* (%Bool*) *
}

@_Bool_vtable_prototype = constant %_Bool_vtable {
	i32 2,
	i32 ptrtoint (%Bool* getelementptr (%Bool, %Bool* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Bool, i32 0, i32 0),
	%Bool* () * @Bool_new,
	%Object* (%Bool*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bool*) *),
	%String* (%Bool*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bool*) *),
	%Bool* (%Bool*) * bitcast (%Object* (%Object*) * @Object_copy to %Bool* (%Bool*) *)
}

declare i32 @String_length(%String*)
declare %String* @String_concat(%String*, %String*)
declare %String* @String_substr(%String*, i32, i32)
@str.String = internal constant [7 x i8] c"String\00"
%String = type {
	%_String_vtable*,
	i8*
}

%_String_vtable = type {
	i32,
	i32,
	i8*,
	%String* () *,
	%Object* (%String*) *,
	%String* (%String*) *,
	%String* (%String*) *,
	i32 (%String*) *,
	%String* (%String*,%String*) *,
	%String* (%String*,i32,i32) *
}

@_String_vtable_prototype = constant %_String_vtable {
	i32 3,
	i32 ptrtoint (%String* getelementptr (%String, %String* null, i32 1) to i32),
	i8* getelementptr ([7 x i8], [7 x i8]* @str.String, i32 0, i32 0),
	%String* () * @String_new,
	%Object* (%String*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%String*) *),
	%String* (%String*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%String*) *),
	%String* (%String*) * bitcast (%Object* (%Object*) * @Object_copy to %String* (%String*) *),
	i32 (%String*) * @String_length,
	%String* (%String*,%String*) * @String_concat,
	%String* (%String*,i32,i32) * @String_substr
}

declare %IO* @IO_out_string(%IO*, %String*)
declare %IO* @IO_out_int(%IO*, i32)
declare %String* @IO_in_string(%IO*)
declare i32 @IO_in_int(%IO*)
@str.IO = internal constant [3 x i8] c"IO\00"
%IO = type {
	%_IO_vtable*
}

%_IO_vtable = type {
	i32,
	i32,
	i8*,
	%IO* () *,
	%Object* (%IO*) *,
	%String* (%IO*) *,
	%IO* (%IO*) *,
	%IO* (%IO*,%String*) *,
	%IO* (%IO*,i32) *,
	%String* (%IO*) *,
	i32 (%IO*) *
}

@_IO_vtable_prototype = constant %_IO_vtable {
	i32 4,
	i32 ptrtoint (%IO* getelementptr (%IO, %IO* null, i32 1) to i32),
	i8* getelementptr ([3 x i8], [3 x i8]* @str.IO, i32 0, i32 0),
	%IO* () * @IO_new,
	%Object* (%IO*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%IO*) *),
	%String* (%IO*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%IO*) *),
	%IO* (%IO*) * bitcast (%Object* (%Object*) * @Object_copy to %IO* (%IO*) *),
	%IO* (%IO*,%String*) * @IO_out_string,
	%IO* (%IO*,i32) * @IO_out_int,
	%String* (%IO*) * @IO_in_string,
	i32 (%IO*) * @IO_in_int
}

@str.Main = internal constant [5 x i8] c"Main\00"
%Main = type {
	%_Main_vtable*
}

%_Main_vtable = type {
	i32,
	i32,
	i8*,
	%Main* () *,
	%Object* (%Main*) *,
	%String* (%Main*) *,
	%Main* (%Main*) *,
	%Main* (%Main*,%String*) *,
	%Main* (%Main*,i32) *,
	%String* (%Main*) *,
	i32 (%Main*) *,
	%Object* (%Main*) *
}

@_Main_vtable_prototype = constant %_Main_vtable {
	i32 5,
	i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
	%Main* () * @Main_new,
	%Object* (%Main*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Main*) *),
	%String* (%Main*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Main*) *),
	%Main* (%Main*) * bitcast (%Object* (%Object*) * @Object_copy to %Main* (%Main*) *),
	%Main* (%Main*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Main* (%Main*,%String*) *),
	%Main* (%Main*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Main* (%Main*,i32) *),
	%String* (%Main*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Main*) *),
	i32 (%Main*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Main*) *),
	%Object* (%Main*) * @Main_main
}

@str.A = internal constant [2 x i8] c"A\00"
%A = type {
	%_A_vtable*
}

%_A_vtable = type {
	i32,
	i32,
	i8*,
	%A* () *,
	%Object* (%A*) *,
	%String* (%A*) *,
	%A* (%A*) *
}

@_A_vtable_prototype = constant %_A_vtable {
	i32 6,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%A*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A*) *),
	%String* (%A*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A*) *),
	%A* (%A*) * bitcast (%Object* (%Object*) * @Object_copy to %A* (%A*) *)
}

@str.B = internal constant [2 x i8] c"B\00"
%B = type {
	%_B_vtable*
}

%_B_vtable = type {
	i32,
	i32,
	i8*,
	%B* () *,
	%Object* (%B*) *,
	%String* (%B*) *,
	%B* (%B*) *
}

@_B_vtable_prototype = constant %_B_vtable {
	i32 7,
	i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0),
	%B* () * @B_new,
	%Object* (%B*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%B*) *),
	%String* (%B*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%B*) *),
	%B* (%B*) * bitcast (%Object* (%Object*) * @Object_copy to %B* (%B*) *)
}

@str.C = internal constant [2 x i8] c"C\00"
%C = type {
	%_C_vtable*
}

%_C_vtable = type {
	i32,
	i32,
	i8*,
	%C* () *,
	%Object* (%C*) *,
	%String* (%C*) *,
	%C* (%C*) *
}

@_C_vtable_prototype = constant %_C_vtable {
	i32 8,
	i32 ptrtoint (%C* getelementptr (%C, %C* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.C, i32 0, i32 0),
	%C* () * @C_new,
	%Object* (%C*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%C*) *),
	%String* (%C*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%C*) *),
	%C* (%C*) * bitcast (%Object* (%Object*) * @Object_copy to %C* (%C*) *)
}

@str.D = internal constant [2 x i8] c"D\00"
%D = type {
	%_D_vtable*
}

%_D_vtable = type {
	i32,
	i32,
	i8*,
	%D* () *,
	%Object* (%D*) *,
	%String* (%D*) *,
	%D* (%D*) *
}

@_D_vtable_prototype = constant %_D_vtable {
	i32 9,
	i32 ptrtoint (%D* getelementptr (%D, %D* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.D, i32 0, i32 0),
	%D* () * @D_new,
	%Object* (%D*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%D*) *),
	%String* (%D*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%D*) *),
	%D* (%D*) * bitcast (%Object* (%Object*) * @Object_copy to %D* (%D*) *)
}

@str.E = internal constant [2 x i8] c"E\00"
%E = type {
	%_E_vtable*
}

%_E_vtable = type {
	i32,
	i32,
	i8*,
	%E* () *,
	%Object* (%E*) *,
	%String* (%E*) *,
	%E* (%E*) *
}

@_E_vtable_prototype = constant %_E_vtable {
	i32 10,
	i32 ptrtoint (%E* getelementptr (%E, %E* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.E, i32 0, i32 0),
	%E* () * @E_new,
	%Object* (%E*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%E*) *),
	%String* (%E*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%E*) *),
	%E* (%E*) * bitcast (%Object* (%Object*) * @Object_copy to %E* (%E*) *)
}

@str.F = internal constant [2 x i8] c"F\00"
%F = type {
	%_F_vtable*
}

%_F_vtable = type {
	i32,
	i32,
	i8*,
	%F* () *,
	%Object* (%F*) *,
	%String* (%F*) *,
	%F* (%F*) *
}

@_F_vtable_prototype = constant %_F_vtable {
	i32 11,
	i32 ptrtoint (%F* getelementptr (%F, %F* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.F, i32 0, i32 0),
	%F* () * @F_new,
	%Object* (%F*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%F*) *),
	%String* (%F*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%F*) *),
	%F* (%F*) * bitcast (%Object* (%Object*) * @Object_copy to %F* (%F*) *)
}

@str.G = internal constant [2 x i8] c"G\00"
%G = type {
	%_G_vtable*
}

%_G_vtable = type {
	i32,
	i32,
	i8*,
	%G* () *,
	%Object* (%G*) *,
	%String* (%G*) *,
	%G* (%G*) *
}

@_G_vtable_prototype = constant %_G_vtable {
	i32 12,
	i32 ptrtoint (%G* getelementptr (%G, %G* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.G, i32 0, i32 0),
	%G* () * @G_new,
	%Object* (%G*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%G*) *),
	%String* (%G*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%G*) *),
	%G* (%G*) * bitcast (%Object* (%Object*) * @Object_copy to %G* (%G*) *)
}

@str.H = internal constant [2 x i8] c"H\00"
%H = type {
	%_H_vtable*
}

%_H_vtable = type {
	i32,
	i32,
	i8*,
	%H* () *,
	%Object* (%H*) *,
	%String* (%H*) *,
	%H* (%H*) *
}

@_H_vtable_prototype = constant %_H_vtable {
	i32 13,
	i32 ptrtoint (%H* getelementptr (%H, %H* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.H, i32 0, i32 0),
	%H* () * @H_new,
	%Object* (%H*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%H*) *),
	%String* (%H*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%H*) *),
	%H* (%H*) * bitcast (%Object* (%Object*) * @Object_copy to %H* (%H*) *)
}

@str.I = internal constant [2 x i8] c"I\00"
%I = type {
	%_I_vtable*
}

%_I_vtable = type {
	i32,
	i32,
	i8*,
	%I* () *,
	%Object* (%I*) *,
	%String* (%I*) *,
	%I* (%I*) *
}

@_I_vtable_prototype = constant %_I_vtable {
	i32 14,
	i32 ptrtoint (%I* getelementptr (%I, %I* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.I, i32 0, i32 0),
	%I* () * @I_new,
	%Object* (%I*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%I*) *),
	%String* (%I*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%I*) *),
	%I* (%I*) * bitcast (%Object* (%Object*) * @Object_copy to %I* (%I*) *)
}

@str.J = internal constant [2 x i8] c"J\00"
%J = type {
	%_J_vtable*
}

%_J_vtable = type {
	i32,
	i32,
	i8*,
	%J* () *,
	%Object* (%J*) *,
	%String* (%J*) *,
	%J* (%J*) *
}

@_J_vtable_prototype = constant %_J_vtable {
	i32 15,
	i32 ptrtoint (%J* getelementptr (%J, %J* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.J, i32 0, i32 0),
	%J* () * @J_new,
	%Object* (%J*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%J*) *),
	%String* (%J*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%J*) *),
	%J* (%J*) * bitcast (%Object* (%Object*) * @Object_copy to %J* (%J*) *)
}

@str.K = internal constant [2 x i8] c"K\00"
%K = type {
	%_K_vtable*
}

%_K_vtable = type {
	i32,
	i32,
	i8*,
	%K* () *,
	%Object* (%K*) *,
	%String* (%K*) *,
	%K* (%K*) *
}

@_K_vtable_prototype = constant %_K_vtable {
	i32 16,
	i32 ptrtoint (%K* getelementptr (%K, %K* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.K, i32 0, i32 0),
	%K* () * @K_new,
	%Object* (%K*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%K*) *),
	%String* (%K*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%K*) *),
	%K* (%K*) * bitcast (%Object* (%Object*) * @Object_copy to %K* (%K*) *)
}

@str.L = internal constant [2 x i8] c"L\00"
%L = type {
	%_L_vtable*
}

%_L_vtable = type {
	i32,
	i32,
	i8*,
	%L* () *,
	%Object* (%L*) *,
	%String* (%L*) *,
	%L* (%L*) *
}

@_L_vtable_prototype = constant %_L_vtable {
	i32 17,
	i32 ptrtoint (%L* getelementptr (%L, %L* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.L, i32 0, i32 0),
	%L* () * @L_new,
	%Object* (%L*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%L*) *),
	%String* (%L*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%L*) *),
	%L* (%L*) * bitcast (%Object* (%Object*) * @Object_copy to %L* (%L*) *)
}

@str.M = internal constant [2 x i8] c"M\00"
%M = type {
	%_M_vtable*
}

%_M_vtable = type {
	i32,
	i32,
	i8*,
	%M* () *,
	%Object* (%M*) *,
	%String* (%M*) *,
	%M* (%M*) *
}

@_M_vtable_prototype = constant %_M_vtable {
	i32 18,
	i32 ptrtoint (%M* getelementptr (%M, %M* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.M, i32 0, i32 0),
	%M* () * @M_new,
	%Object* (%M*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%M*) *),
	%String* (%M*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%M*) *),
	%M* (%M*) * bitcast (%Object* (%Object*) * @Object_copy to %M* (%M*) *)
}

@str.N = internal constant [2 x i8] c"N\00"
%N = type {
	%_N_vtable*
}

%_N_vtable = type {
	i32,
	i32,
	i8*,
	%N* () *,
	%Object* (%N*) *,
	%String* (%N*) *,
	%N* (%N*) *
}

@_N_vtable_prototype = constant %_N_vtable {
	i32 19,
	i32 ptrtoint (%N* getelementptr (%N, %N* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.N, i32 0, i32 0),
	%N* () * @N_new,
	%Object* (%N*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%N*) *),
	%String* (%N*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%N*) *),
	%N* (%N*) * bitcast (%Object* (%Object*) * @Object_copy to %N* (%N*) *)
}

@str.O = internal constant [2 x i8] c"O\00"
%O = type {
	%_O_vtable*
}

%_O_vtable = type {
	i32,
	i32,
	i8*,
	%O* () *,
	%Object* (%O*) *,
	%String* (%O*) *,
	%O* (%O*) *
}

@_O_vtable_prototype = constant %_O_vtable {
	i32 20,
	i32 ptrtoint (%O* getelementptr (%O, %O* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.O, i32 0, i32 0),
	%O* () * @O_new,
	%Object* (%O*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%O*) *),
	%String* (%O*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%O*) *),
	%O* (%O*) * bitcast (%Object* (%Object*) * @Object_copy to %O* (%O*) *)
}

@str.P = internal constant [2 x i8] c"P\00"
%P = type {
	%_P_vtable*
}

%_P_vtable = type {
	i32,
	i32,
	i8*,
	%P* () *,
	%Object* (%P*) *,
	%String* (%P*) *,
	%P* (%P*) *
}

@_P_vtable_prototype = constant %_P_vtable {
	i32 21,
	i32 ptrtoint (%P* getelementptr (%P, %P* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.P, i32 0, i32 0),
	%P* () * @P_new,
	%Object* (%P*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%P*) *),
	%String* (%P*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%P*) *),
	%P* (%P*) * bitcast (%Object* (%Object*) * @Object_copy to %P* (%P*) *)
}

@str.Q = internal constant [2 x i8] c"Q\00"
%Q = type {
	%_Q_vtable*
}

%_Q_vtable = type {
	i32,
	i32,
	i8*,
	%Q* () *,
	%Object* (%Q*) *,
	%String* (%Q*) *,
	%Q* (%Q*) *
}

@_Q_vtable_prototype = constant %_Q_vtable {
	i32 22,
	i32 ptrtoint (%Q* getelementptr (%Q, %Q* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.Q, i32 0, i32 0),
	%Q* () * @Q_new,
	%Object* (%Q*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Q*) *),
	%String* (%Q*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Q*) *),
	%Q* (%Q*) * bitcast (%Object* (%Object*) * @Object_copy to %Q* (%Q*) *)
}

@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.0 = internal constant [14 x i8] c"caseloop_o.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.0, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main* @Main_new(  )
	%main.retval = call %Object*(%Main* ) @Main_main( %Main* %main.obj )
	ret i32 0
}

declare %Object* @Object_new()
declare %Int* @Int_new()
declare %Bool* @Bool_new()
declare %String* @String_new()
declare %IO* @IO_new()
define %Object* @Main_main(%Main* %self) {

entry:
	%vtpm.0 = alloca i32
	%vtpm.1 = alloca i32
	%vtpm.2 = alloca %Object*
	%vtpm.3 = alloca %Object*
	%vtpm.4 = alloca i32
	%tmp.0 = alloca %Int*
	%vtpm.5 = alloca %A*
	%vtpm.6 = alloca %B*
	%vtpm.7 = alloca %C*
	%vtpm.8 = alloca %D*
	%vtpm.9 = alloca %E*
	%vtpm.10 = alloca %F*
	%vtpm.11 = alloca %G*
	%vtpm.12 = alloca %H*
	%vtpm.13 = alloca %I*
	%vtpm.14 = alloca %J*
	%vtpm.15 = alloca %K*
	%vtpm.16 = alloca %L*
	%vtpm.17 = alloca %M*
	%vtpm.18 = alloca %N*
	%vtpm.19 = alloca %O*
	%vtpm.20 = alloca %P*
	%vtpm.21 = alloca %Q*
	%vtpm.22 = alloca i32
	%tmp.1 = alloca %Int*
	%vtpm.23 = alloca %A*
	%vtpm.24 = alloca %B*
	%vtpm.25 = alloca %C*
	%vtpm.26 = alloca %D*
	%vtpm.27 = alloca %E*
	%vtpm.28 = alloca %F*
	%vtpm.29 = alloca %G*
	%vtpm.30 = alloca %H*
	%vtpm.31 = alloca %I*
	%vtpm.32 = alloca %J*
	%vtpm.33 = alloca %K*
	%vtpm.34 = alloca %L*
	%vtpm.35 = alloca %M*
	%vtpm.36 = alloca %N*
	%vtpm.37 = alloca %O*
	%vtpm.38 = alloca %P*
	%vtpm.39 = alloca %Q*
	%vtpm.40 = alloca i32
	%vtpm.41 = alloca %Main*
	store %Main* %self, %Main** %vtpm.41
	store i32 0, i32* %vtpm.0
	store i32 0, i32* %vtpm.1
	%vtpm.42 = call %A* @A_new(  )
	%vtpm.43 = bitcast %A* %vtpm.42 to %Object*
	store %Object* %vtpm.43, %Object** %vtpm.2
	%vtpm.44 = call %Q* @Q_new(  )
	%vtpm.45 = bitcast %Q* %vtpm.44 to %Object*
	store %Object* %vtpm.45, %Object** %vtpm.3
	store i32 0, i32* %vtpm.4
	br label %while.0

while.0:
	%vtpm.46 = load i32, i32* %vtpm.0
	%vtpm.47 = icmp slt i32 %vtpm.46, 100
	br i1 %vtpm.47, label %loop_body.0, label %loop_end.0

loop_body.0:
	%vtpm.48 = load %Object*, %Object** %vtpm.3
	%tmp.2 = icmp eq %Object* %vtpm.48, null
	br i1 %tmp.2, label %abort, label %ok.0

ok.0:
	%vtpm.49 = getelementptr %Object, %Object* %vtpm.48, i32 0, i32 0
	%vtpm.50 = load %_Object_vtable*, %_Object_vtable** %vtpm.49
	%vtpm.51 = getelementptr %_Object_vtable, %_Object_vtable* %vtpm.50, i32 0, i32 0
	%vtpm.52 = load i32, i32* %vtpm.51
	br label %case.hdr.1

case.hdr.1:
	br label %case.22.1

case.22.1:
	%vtpm.53 = icmp slt i32 %vtpm.52, 22
	br i1 %vtpm.53, label %br_exit.22.1, label %src_gte_br.22.1

src_gte_br.22.1:
	%vtpm.54 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.54, label %br_exit.22.1, label %src_lte_mc.22.1

src_lte_mc.22.1:
	%vtpm.55 = bitcast %Object* %vtpm.48 to %Q*
	store %Q* %vtpm.55, %Q** %vtpm.21
	%vtpm.56 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.56, i32 17 )
	store %Int* %vtpm.56, %Int** %tmp.0
	br label %case.exit.1

br_exit.22.1:
	br label %case.21.1

case.21.1:
	%vtpm.58 = icmp slt i32 %vtpm.52, 21
	br i1 %vtpm.58, label %br_exit.21.1, label %src_gte_br.21.1

src_gte_br.21.1:
	%vtpm.59 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.59, label %br_exit.21.1, label %src_lte_mc.21.1

src_lte_mc.21.1:
	%vtpm.60 = bitcast %Object* %vtpm.48 to %P*
	store %P* %vtpm.60, %P** %vtpm.20
	%vtpm.61 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.61, i32 16 )
	store %Int* %vtpm.61, %Int** %tmp.0
	br label %case.exit.1

br_exit.21.1:
	br label %case.20.1

case.20.1:
	%vtpm.63 = icmp slt i32 %vtpm.52, 20
	br i1 %vtpm.63, label %br_exit.20.1, label %src_gte_br.20.1

src_gte_br.20.1:
	%vtpm.64 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.64, label %br_exit.20.1, label %src_lte_mc.20.1

src_lte_mc.20.1:
	%vtpm.65 = bitcast %Object* %vtpm.48 to %O*
	store %O* %vtpm.65, %O** %vtpm.19
	%vtpm.66 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.66, i32 15 )
	store %Int* %vtpm.66, %Int** %tmp.0
	br label %case.exit.1

br_exit.20.1:
	br label %case.19.1

case.19.1:
	%vtpm.68 = icmp slt i32 %vtpm.52, 19
	br i1 %vtpm.68, label %br_exit.19.1, label %src_gte_br.19.1

src_gte_br.19.1:
	%vtpm.69 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.69, label %br_exit.19.1, label %src_lte_mc.19.1

src_lte_mc.19.1:
	%vtpm.70 = bitcast %Object* %vtpm.48 to %N*
	store %N* %vtpm.70, %N** %vtpm.18
	%vtpm.71 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.71, i32 14 )
	store %Int* %vtpm.71, %Int** %tmp.0
	br label %case.exit.1

br_exit.19.1:
	br label %case.18.1

case.18.1:
	%vtpm.73 = icmp slt i32 %vtpm.52, 18
	br i1 %vtpm.73, label %br_exit.18.1, label %src_gte_br.18.1

src_gte_br.18.1:
	%vtpm.74 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.74, label %br_exit.18.1, label %src_lte_mc.18.1

src_lte_mc.18.1:
	%vtpm.75 = bitcast %Object* %vtpm.48 to %M*
	store %M* %vtpm.75, %M** %vtpm.17
	%vtpm.76 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.76, i32 13 )
	store %Int* %vtpm.76, %Int** %tmp.0
	br label %case.exit.1

br_exit.18.1:
	br label %case.17.1

case.17.1:
	%vtpm.78 = icmp slt i32 %vtpm.52, 17
	br i1 %vtpm.78, label %br_exit.17.1, label %src_gte_br.17.1

src_gte_br.17.1:
	%vtpm.79 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.79, label %br_exit.17.1, label %src_lte_mc.17.1

src_lte_mc.17.1:
	%vtpm.80 = bitcast %Object* %vtpm.48 to %L*
	store %L* %vtpm.80, %L** %vtpm.16
	%vtpm.81 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.81, i32 12 )
	store %Int* %vtpm.81, %Int** %tmp.0
	br label %case.exit.1

br_exit.17.1:
	br label %case.16.1

case.16.1:
	%vtpm.83 = icmp slt i32 %vtpm.52, 16
	br i1 %vtpm.83, label %br_exit.16.1, label %src_gte_br.16.1

src_gte_br.16.1:
	%vtpm.84 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.84, label %br_exit.16.1, label %src_lte_mc.16.1

src_lte_mc.16.1:
	%vtpm.85 = bitcast %Object* %vtpm.48 to %K*
	store %K* %vtpm.85, %K** %vtpm.15
	%vtpm.86 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.86, i32 11 )
	store %Int* %vtpm.86, %Int** %tmp.0
	br label %case.exit.1

br_exit.16.1:
	br label %case.15.1

case.15.1:
	%vtpm.88 = icmp slt i32 %vtpm.52, 15
	br i1 %vtpm.88, label %br_exit.15.1, label %src_gte_br.15.1

src_gte_br.15.1:
	%vtpm.89 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.89, label %br_exit.15.1, label %src_lte_mc.15.1

src_lte_mc.15.1:
	%vtpm.90 = bitcast %Object* %vtpm.48 to %J*
	store %J* %vtpm.90, %J** %vtpm.14
	%vtpm.91 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.91, i32 10 )
	store %Int* %vtpm.91, %Int** %tmp.0
	br label %case.exit.1

br_exit.15.1:
	br label %case.14.1

case.14.1:
	%vtpm.93 = icmp slt i32 %vtpm.52, 14
	br i1 %vtpm.93, label %br_exit.14.1, label %src_gte_br.14.1

src_gte_br.14.1:
	%vtpm.94 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.94, label %br_exit.14.1, label %src_lte_mc.14.1

src_lte_mc.14.1:
	%vtpm.95 = bitcast %Object* %vtpm.48 to %I*
	store %I* %vtpm.95, %I** %vtpm.13
	%vtpm.96 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.96, i32 9 )
	store %Int* %vtpm.96, %Int** %tmp.0
	br label %case.exit.1

br_exit.14.1:
	br label %case.13.1

case.13.1:
	%vtpm.98 = icmp slt i32 %vtpm.52, 13
	br i1 %vtpm.98, label %br_exit.13.1, label %src_gte_br.13.1

src_gte_br.13.1:
	%vtpm.99 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.99, label %br_exit.13.1, label %src_lte_mc.13.1

src_lte_mc.13.1:
	%vtpm.100 = bitcast %Object* %vtpm.48 to %H*
	store %H* %vtpm.100, %H** %vtpm.12
	%vtpm.101 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.101, i32 8 )
	store %Int* %vtpm.101, %Int** %tmp.0
	br label %case.exit.1

br_exit.13.1:
	br label %case.12.1

case.12.1:
	%vtpm.103 = icmp slt i32 %vtpm.52, 12
	br i1 %vtpm.103, label %br_exit.12.1, label %src_gte_br.12.1

src_gte_br.12.1:
	%vtpm.104 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.104, label %br_exit.12.1, label %src_lte_mc.12.1

src_lte_mc.12.1:
	%vtpm.105 = bitcast %Object* %vtpm.48 to %G*
	store %G* %vtpm.105, %G** %vtpm.11
	%vtpm.106 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.106, i32 7 )
	store %Int* %vtpm.106, %Int** %tmp.0
	br label %case.exit.1

br_exit.12.1:
	br label %case.11.1

case.11.1:
	%vtpm.108 = icmp slt i32 %vtpm.52, 11
	br i1 %vtpm.108, label %br_exit.11.1, label %src_gte_br.11.1

src_gte_br.11.1:
	%vtpm.109 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.109, label %br_exit.11.1, label %src_lte_mc.11.1

src_lte_mc.11.1:
	%vtpm.110 = bitcast %Object* %vtpm.48 to %F*
	store %F* %vtpm.110, %F** %vtpm.10
	%vtpm.111 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.111, i32 6 )
	store %Int* %vtpm.111, %Int** %tmp.0
	br label %case.exit.1

br_exit.11.1:
	br label %case.10.1

case.10.1:
	%vtpm.113 = icmp slt i32 %vtpm.52, 10
	br i1 %vtpm.113, label %br_exit.10.1, label %src_gte_br.10.1

src_gte_br.10.1:
	%vtpm.114 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.114, label %br_exit.10.1, label %src_lte_mc.10.1

src_lte_mc.10.1:
	%vtpm.115 = bitcast %Object* %vtpm.48 to %E*
	store %E* %vtpm.115, %E** %vtpm.9
	%vtpm.116 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.116, i32 5 )
	store %Int* %vtpm.116, %Int** %tmp.0
	br label %case.exit.1

br_exit.10.1:
	br label %case.9.1

case.9.1:
	%vtpm.118 = icmp slt i32 %vtpm.52, 9
	br i1 %vtpm.118, label %br_exit.9.1, label %src_gte_br.9.1

src_gte_br.9.1:
	%vtpm.119 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.119, label %br_exit.9.1, label %src_lte_mc.9.1

src_lte_mc.9.1:
	%vtpm.120 = bitcast %Object* %vtpm.48 to %D*
	store %D* %vtpm.120, %D** %vtpm.8
	%vtpm.121 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.121, i32 4 )
	store %Int* %vtpm.121, %Int** %tmp.0
	br label %case.exit.1

br_exit.9.1:
	br label %case.8.1

case.8.1:
	%vtpm.123 = icmp slt i32 %vtpm.52, 8
	br i1 %vtpm.123, label %br_exit.8.1, label %src_gte_br.8.1

src_gte_br.8.1:
	%vtpm.124 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.124, label %br_exit.8.1, label %src_lte_mc.8.1

src_lte_mc.8.1:
	%vtpm.125 = bitcast %Object* %vtpm.48 to %C*
	store %C* %vtpm.125, %C** %vtpm.7
	%vtpm.126 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.126, i32 3 )
	store %Int* %vtpm.126, %Int** %tmp.0
	br label %case.exit.1

br_exit.8.1:
	br label %case.7.1

case.7.1:
	%vtpm.128 = icmp slt i32 %vtpm.52, 7
	br i1 %vtpm.128, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%vtpm.129 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.129, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	%vtpm.130 = bitcast %Object* %vtpm.48 to %B*
	store %B* %vtpm.130, %B** %vtpm.6
	%vtpm.131 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.131, i32 2 )
	store %Int* %vtpm.131, %Int** %tmp.0
	br label %case.exit.1

br_exit.7.1:
	br label %case.6.1

case.6.1:
	%vtpm.133 = icmp slt i32 %vtpm.52, 6
	br i1 %vtpm.133, label %br_exit.6.1, label %src_gte_br.6.1

src_gte_br.6.1:
	%vtpm.134 = icmp sgt i32 %vtpm.52, 22
	br i1 %vtpm.134, label %br_exit.6.1, label %src_lte_mc.6.1

src_lte_mc.6.1:
	%vtpm.135 = bitcast %Object* %vtpm.48 to %A*
	store %A* %vtpm.135, %A** %vtpm.5
	%vtpm.136 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.136, i32 1 )
	store %Int* %vtpm.136, %Int** %tmp.0
	br label %case.exit.1

br_exit.6.1:
	br label %abort

case.exit.1:
	%tmp.3 = load %Int*, %Int** %tmp.0
	%vtpm.138 = getelementptr %Int, %Int* %tmp.3, i32 0, i32 1
	%vtpm.139 = load i32, i32* %vtpm.138
	store i32 %vtpm.139, i32* %vtpm.4
	%vtpm.140 = load i32, i32* %vtpm.0
	%vtpm.141 = add i32 %vtpm.140, 1
	store i32 %vtpm.141, i32* %vtpm.0
	br label %while.0

loop_end.0:
	%vtpm.142 = load i32, i32* %vtpm.4
	%vtpm.143 = icmp eq i32 %vtpm.142, 17
	%vtpm.144 = xor i1 %vtpm.143, true
	br i1 %vtpm.144, label %true.2, label %false.2

true.2:
	%vtpm.145 = load i32, i32* %vtpm.1
	%vtpm.146 = add i32 %vtpm.145, 1
	store i32 %vtpm.146, i32* %vtpm.1
	store i32 %vtpm.146, i32* %vtpm.22
	br label %end.2

false.2:
	store i32 0, i32* %vtpm.22
	br label %end.2

end.2:
	%vtpm.147 = load i32, i32* %vtpm.22
	store i32 0, i32* %vtpm.0
	br label %while.3

while.3:
	%vtpm.148 = load i32, i32* %vtpm.0
	%vtpm.149 = icmp slt i32 %vtpm.148, 10
	br i1 %vtpm.149, label %loop_body.3, label %loop_end.3

loop_body.3:
	%vtpm.150 = load %Object*, %Object** %vtpm.2
	%tmp.4 = icmp eq %Object* %vtpm.150, null
	br i1 %tmp.4, label %abort, label %ok.1

ok.1:
	%vtpm.151 = getelementptr %Object, %Object* %vtpm.150, i32 0, i32 0
	%vtpm.152 = load %_Object_vtable*, %_Object_vtable** %vtpm.151
	%vtpm.153 = getelementptr %_Object_vtable, %_Object_vtable* %vtpm.152, i32 0, i32 0
	%vtpm.154 = load i32, i32* %vtpm.153
	br label %case.hdr.4

case.hdr.4:
	br label %case.22.4

case.22.4:
	%vtpm.155 = icmp slt i32 %vtpm.154, 22
	br i1 %vtpm.155, label %br_exit.22.4, label %src_gte_br.22.4

src_gte_br.22.4:
	%vtpm.156 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.156, label %br_exit.22.4, label %src_lte_mc.22.4

src_lte_mc.22.4:
	%vtpm.157 = bitcast %Object* %vtpm.150 to %Q*
	store %Q* %vtpm.157, %Q** %vtpm.39
	%vtpm.158 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.158, i32 17 )
	store %Int* %vtpm.158, %Int** %tmp.1
	br label %case.exit.4

br_exit.22.4:
	br label %case.21.4

case.21.4:
	%vtpm.160 = icmp slt i32 %vtpm.154, 21
	br i1 %vtpm.160, label %br_exit.21.4, label %src_gte_br.21.4

src_gte_br.21.4:
	%vtpm.161 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.161, label %br_exit.21.4, label %src_lte_mc.21.4

src_lte_mc.21.4:
	%vtpm.162 = bitcast %Object* %vtpm.150 to %P*
	store %P* %vtpm.162, %P** %vtpm.38
	%vtpm.163 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.163, i32 16 )
	store %Int* %vtpm.163, %Int** %tmp.1
	br label %case.exit.4

br_exit.21.4:
	br label %case.20.4

case.20.4:
	%vtpm.165 = icmp slt i32 %vtpm.154, 20
	br i1 %vtpm.165, label %br_exit.20.4, label %src_gte_br.20.4

src_gte_br.20.4:
	%vtpm.166 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.166, label %br_exit.20.4, label %src_lte_mc.20.4

src_lte_mc.20.4:
	%vtpm.167 = bitcast %Object* %vtpm.150 to %O*
	store %O* %vtpm.167, %O** %vtpm.37
	%vtpm.168 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.168, i32 15 )
	store %Int* %vtpm.168, %Int** %tmp.1
	br label %case.exit.4

br_exit.20.4:
	br label %case.19.4

case.19.4:
	%vtpm.170 = icmp slt i32 %vtpm.154, 19
	br i1 %vtpm.170, label %br_exit.19.4, label %src_gte_br.19.4

src_gte_br.19.4:
	%vtpm.171 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.171, label %br_exit.19.4, label %src_lte_mc.19.4

src_lte_mc.19.4:
	%vtpm.172 = bitcast %Object* %vtpm.150 to %N*
	store %N* %vtpm.172, %N** %vtpm.36
	%vtpm.173 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.173, i32 14 )
	store %Int* %vtpm.173, %Int** %tmp.1
	br label %case.exit.4

br_exit.19.4:
	br label %case.18.4

case.18.4:
	%vtpm.175 = icmp slt i32 %vtpm.154, 18
	br i1 %vtpm.175, label %br_exit.18.4, label %src_gte_br.18.4

src_gte_br.18.4:
	%vtpm.176 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.176, label %br_exit.18.4, label %src_lte_mc.18.4

src_lte_mc.18.4:
	%vtpm.177 = bitcast %Object* %vtpm.150 to %M*
	store %M* %vtpm.177, %M** %vtpm.35
	%vtpm.178 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.178, i32 13 )
	store %Int* %vtpm.178, %Int** %tmp.1
	br label %case.exit.4

br_exit.18.4:
	br label %case.17.4

case.17.4:
	%vtpm.180 = icmp slt i32 %vtpm.154, 17
	br i1 %vtpm.180, label %br_exit.17.4, label %src_gte_br.17.4

src_gte_br.17.4:
	%vtpm.181 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.181, label %br_exit.17.4, label %src_lte_mc.17.4

src_lte_mc.17.4:
	%vtpm.182 = bitcast %Object* %vtpm.150 to %L*
	store %L* %vtpm.182, %L** %vtpm.34
	%vtpm.183 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.183, i32 12 )
	store %Int* %vtpm.183, %Int** %tmp.1
	br label %case.exit.4

br_exit.17.4:
	br label %case.16.4

case.16.4:
	%vtpm.185 = icmp slt i32 %vtpm.154, 16
	br i1 %vtpm.185, label %br_exit.16.4, label %src_gte_br.16.4

src_gte_br.16.4:
	%vtpm.186 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.186, label %br_exit.16.4, label %src_lte_mc.16.4

src_lte_mc.16.4:
	%vtpm.187 = bitcast %Object* %vtpm.150 to %K*
	store %K* %vtpm.187, %K** %vtpm.33
	%vtpm.188 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.188, i32 11 )
	store %Int* %vtpm.188, %Int** %tmp.1
	br label %case.exit.4

br_exit.16.4:
	br label %case.15.4

case.15.4:
	%vtpm.190 = icmp slt i32 %vtpm.154, 15
	br i1 %vtpm.190, label %br_exit.15.4, label %src_gte_br.15.4

src_gte_br.15.4:
	%vtpm.191 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.191, label %br_exit.15.4, label %src_lte_mc.15.4

src_lte_mc.15.4:
	%vtpm.192 = bitcast %Object* %vtpm.150 to %J*
	store %J* %vtpm.192, %J** %vtpm.32
	%vtpm.193 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.193, i32 10 )
	store %Int* %vtpm.193, %Int** %tmp.1
	br label %case.exit.4

br_exit.15.4:
	br label %case.14.4

case.14.4:
	%vtpm.195 = icmp slt i32 %vtpm.154, 14
	br i1 %vtpm.195, label %br_exit.14.4, label %src_gte_br.14.4

src_gte_br.14.4:
	%vtpm.196 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.196, label %br_exit.14.4, label %src_lte_mc.14.4

src_lte_mc.14.4:
	%vtpm.197 = bitcast %Object* %vtpm.150 to %I*
	store %I* %vtpm.197, %I** %vtpm.31
	%vtpm.198 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.198, i32 9 )
	store %Int* %vtpm.198, %Int** %tmp.1
	br label %case.exit.4

br_exit.14.4:
	br label %case.13.4

case.13.4:
	%vtpm.200 = icmp slt i32 %vtpm.154, 13
	br i1 %vtpm.200, label %br_exit.13.4, label %src_gte_br.13.4

src_gte_br.13.4:
	%vtpm.201 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.201, label %br_exit.13.4, label %src_lte_mc.13.4

src_lte_mc.13.4:
	%vtpm.202 = bitcast %Object* %vtpm.150 to %H*
	store %H* %vtpm.202, %H** %vtpm.30
	%vtpm.203 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.203, i32 8 )
	store %Int* %vtpm.203, %Int** %tmp.1
	br label %case.exit.4

br_exit.13.4:
	br label %case.12.4

case.12.4:
	%vtpm.205 = icmp slt i32 %vtpm.154, 12
	br i1 %vtpm.205, label %br_exit.12.4, label %src_gte_br.12.4

src_gte_br.12.4:
	%vtpm.206 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.206, label %br_exit.12.4, label %src_lte_mc.12.4

src_lte_mc.12.4:
	%vtpm.207 = bitcast %Object* %vtpm.150 to %G*
	store %G* %vtpm.207, %G** %vtpm.29
	%vtpm.208 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.208, i32 7 )
	store %Int* %vtpm.208, %Int** %tmp.1
	br label %case.exit.4

br_exit.12.4:
	br label %case.11.4

case.11.4:
	%vtpm.210 = icmp slt i32 %vtpm.154, 11
	br i1 %vtpm.210, label %br_exit.11.4, label %src_gte_br.11.4

src_gte_br.11.4:
	%vtpm.211 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.211, label %br_exit.11.4, label %src_lte_mc.11.4

src_lte_mc.11.4:
	%vtpm.212 = bitcast %Object* %vtpm.150 to %F*
	store %F* %vtpm.212, %F** %vtpm.28
	%vtpm.213 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.213, i32 6 )
	store %Int* %vtpm.213, %Int** %tmp.1
	br label %case.exit.4

br_exit.11.4:
	br label %case.10.4

case.10.4:
	%vtpm.215 = icmp slt i32 %vtpm.154, 10
	br i1 %vtpm.215, label %br_exit.10.4, label %src_gte_br.10.4

src_gte_br.10.4:
	%vtpm.216 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.216, label %br_exit.10.4, label %src_lte_mc.10.4

src_lte_mc.10.4:
	%vtpm.217 = bitcast %Object* %vtpm.150 to %E*
	store %E* %vtpm.217, %E** %vtpm.27
	%vtpm.218 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.218, i32 5 )
	store %Int* %vtpm.218, %Int** %tmp.1
	br label %case.exit.4

br_exit.10.4:
	br label %case.9.4

case.9.4:
	%vtpm.220 = icmp slt i32 %vtpm.154, 9
	br i1 %vtpm.220, label %br_exit.9.4, label %src_gte_br.9.4

src_gte_br.9.4:
	%vtpm.221 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.221, label %br_exit.9.4, label %src_lte_mc.9.4

src_lte_mc.9.4:
	%vtpm.222 = bitcast %Object* %vtpm.150 to %D*
	store %D* %vtpm.222, %D** %vtpm.26
	%vtpm.223 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.223, i32 4 )
	store %Int* %vtpm.223, %Int** %tmp.1
	br label %case.exit.4

br_exit.9.4:
	br label %case.8.4

case.8.4:
	%vtpm.225 = icmp slt i32 %vtpm.154, 8
	br i1 %vtpm.225, label %br_exit.8.4, label %src_gte_br.8.4

src_gte_br.8.4:
	%vtpm.226 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.226, label %br_exit.8.4, label %src_lte_mc.8.4

src_lte_mc.8.4:
	%vtpm.227 = bitcast %Object* %vtpm.150 to %C*
	store %C* %vtpm.227, %C** %vtpm.25
	%vtpm.228 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.228, i32 3 )
	store %Int* %vtpm.228, %Int** %tmp.1
	br label %case.exit.4

br_exit.8.4:
	br label %case.7.4

case.7.4:
	%vtpm.230 = icmp slt i32 %vtpm.154, 7
	br i1 %vtpm.230, label %br_exit.7.4, label %src_gte_br.7.4

src_gte_br.7.4:
	%vtpm.231 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.231, label %br_exit.7.4, label %src_lte_mc.7.4

src_lte_mc.7.4:
	%vtpm.232 = bitcast %Object* %vtpm.150 to %B*
	store %B* %vtpm.232, %B** %vtpm.24
	%vtpm.233 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.233, i32 2 )
	store %Int* %vtpm.233, %Int** %tmp.1
	br label %case.exit.4

br_exit.7.4:
	br label %case.6.4

case.6.4:
	%vtpm.235 = icmp slt i32 %vtpm.154, 6
	br i1 %vtpm.235, label %br_exit.6.4, label %src_gte_br.6.4

src_gte_br.6.4:
	%vtpm.236 = icmp sgt i32 %vtpm.154, 22
	br i1 %vtpm.236, label %br_exit.6.4, label %src_lte_mc.6.4

src_lte_mc.6.4:
	%vtpm.237 = bitcast %Object* %vtpm.150 to %A*
	store %A* %vtpm.237, %A** %vtpm.23
	%vtpm.238 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.238, i32 1 )
	store %Int* %vtpm.238, %Int** %tmp.1
	br label %case.exit.4

br_exit.6.4:
	br label %abort

case.exit.4:
	%tmp.5 = load %Int*, %Int** %tmp.1
	%vtpm.240 = getelementptr %Int, %Int* %tmp.5, i32 0, i32 1
	%vtpm.241 = load i32, i32* %vtpm.240
	store i32 %vtpm.241, i32* %vtpm.4
	%vtpm.242 = load i32, i32* %vtpm.0
	%vtpm.243 = add i32 %vtpm.242, 1
	store i32 %vtpm.243, i32* %vtpm.0
	br label %while.3

loop_end.3:
	%vtpm.244 = load i32, i32* %vtpm.4
	%vtpm.245 = icmp eq i32 %vtpm.244, 1
	%vtpm.246 = xor i1 %vtpm.245, true
	br i1 %vtpm.246, label %true.5, label %false.5

true.5:
	%vtpm.247 = load i32, i32* %vtpm.1
	%vtpm.248 = add i32 %vtpm.247, 1
	store i32 %vtpm.248, i32* %vtpm.1
	store i32 %vtpm.248, i32* %vtpm.40
	br label %end.5

false.5:
	store i32 0, i32* %vtpm.40
	br label %end.5

end.5:
	%vtpm.249 = load i32, i32* %vtpm.40
	%vtpm.250 = load i32, i32* %vtpm.1
	%vtpm.251 = load %Main*, %Main** %vtpm.41
	%vtpm.252 = icmp eq %Main* %vtpm.251, null
	br i1 %vtpm.252, label %abort, label %ok.2

ok.2:
	%vtpm.253 = getelementptr %Main, %Main* %vtpm.251, i32 0, i32 0
	%vtpm.254 = load %_Main_vtable*, %_Main_vtable** %vtpm.253
	%vtpm.255 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.254, i32 0, i32 8
	%tmp.6 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.255
	%vtpm.256 = call %Main*(%Main*, i32 ) %tmp.6( %Main* %vtpm.251, i32 %vtpm.250 )
	%vtpm.257 = load %Main*, %Main** %vtpm.41
	%vtpm.258 = bitcast %Main* %vtpm.257 to %Object*
	ret %Object* %vtpm.258

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.260 = alloca %Main*
	%vtpm.261 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.262 = load i32, i32* %vtpm.261
	%vtpm.263 = call i8*(i32 ) @malloc( i32 %vtpm.262 )
	%vtpm.264 = bitcast i8* %vtpm.263 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.264, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.265 = getelementptr %Main, %Main* %vtpm.264, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.265
	store %Main* %vtpm.264, %Main** %vtpm.260
	ret %Main* %vtpm.264

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%vtpm.267 = alloca %A*
	%vtpm.268 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%vtpm.269 = load i32, i32* %vtpm.268
	%vtpm.270 = call i8*(i32 ) @malloc( i32 %vtpm.269 )
	%vtpm.271 = bitcast i8* %vtpm.270 to %A*
	%malloc.null = icmp eq %A* %vtpm.271, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.272 = getelementptr %A, %A* %vtpm.271, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.272
	store %A* %vtpm.271, %A** %vtpm.267
	ret %A* %vtpm.271

abort:
	call void @abort(  )
	unreachable
}

define %B* @B_new() {

entry:
	%vtpm.274 = alloca %B*
	%vtpm.275 = getelementptr %_B_vtable, %_B_vtable* @_B_vtable_prototype, i32 0, i32 1
	%vtpm.276 = load i32, i32* %vtpm.275
	%vtpm.277 = call i8*(i32 ) @malloc( i32 %vtpm.276 )
	%vtpm.278 = bitcast i8* %vtpm.277 to %B*
	%malloc.null = icmp eq %B* %vtpm.278, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.279 = getelementptr %B, %B* %vtpm.278, i32 0, i32 0
	store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.279
	store %B* %vtpm.278, %B** %vtpm.274
	ret %B* %vtpm.278

abort:
	call void @abort(  )
	unreachable
}

define %C* @C_new() {

entry:
	%vtpm.281 = alloca %C*
	%vtpm.282 = getelementptr %_C_vtable, %_C_vtable* @_C_vtable_prototype, i32 0, i32 1
	%vtpm.283 = load i32, i32* %vtpm.282
	%vtpm.284 = call i8*(i32 ) @malloc( i32 %vtpm.283 )
	%vtpm.285 = bitcast i8* %vtpm.284 to %C*
	%malloc.null = icmp eq %C* %vtpm.285, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.286 = getelementptr %C, %C* %vtpm.285, i32 0, i32 0
	store %_C_vtable* @_C_vtable_prototype, %_C_vtable** %vtpm.286
	store %C* %vtpm.285, %C** %vtpm.281
	ret %C* %vtpm.285

abort:
	call void @abort(  )
	unreachable
}

define %D* @D_new() {

entry:
	%vtpm.288 = alloca %D*
	%vtpm.289 = getelementptr %_D_vtable, %_D_vtable* @_D_vtable_prototype, i32 0, i32 1
	%vtpm.290 = load i32, i32* %vtpm.289
	%vtpm.291 = call i8*(i32 ) @malloc( i32 %vtpm.290 )
	%vtpm.292 = bitcast i8* %vtpm.291 to %D*
	%malloc.null = icmp eq %D* %vtpm.292, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.293 = getelementptr %D, %D* %vtpm.292, i32 0, i32 0
	store %_D_vtable* @_D_vtable_prototype, %_D_vtable** %vtpm.293
	store %D* %vtpm.292, %D** %vtpm.288
	ret %D* %vtpm.292

abort:
	call void @abort(  )
	unreachable
}

define %E* @E_new() {

entry:
	%vtpm.295 = alloca %E*
	%vtpm.296 = getelementptr %_E_vtable, %_E_vtable* @_E_vtable_prototype, i32 0, i32 1
	%vtpm.297 = load i32, i32* %vtpm.296
	%vtpm.298 = call i8*(i32 ) @malloc( i32 %vtpm.297 )
	%vtpm.299 = bitcast i8* %vtpm.298 to %E*
	%malloc.null = icmp eq %E* %vtpm.299, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.300 = getelementptr %E, %E* %vtpm.299, i32 0, i32 0
	store %_E_vtable* @_E_vtable_prototype, %_E_vtable** %vtpm.300
	store %E* %vtpm.299, %E** %vtpm.295
	ret %E* %vtpm.299

abort:
	call void @abort(  )
	unreachable
}

define %F* @F_new() {

entry:
	%vtpm.302 = alloca %F*
	%vtpm.303 = getelementptr %_F_vtable, %_F_vtable* @_F_vtable_prototype, i32 0, i32 1
	%vtpm.304 = load i32, i32* %vtpm.303
	%vtpm.305 = call i8*(i32 ) @malloc( i32 %vtpm.304 )
	%vtpm.306 = bitcast i8* %vtpm.305 to %F*
	%malloc.null = icmp eq %F* %vtpm.306, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.307 = getelementptr %F, %F* %vtpm.306, i32 0, i32 0
	store %_F_vtable* @_F_vtable_prototype, %_F_vtable** %vtpm.307
	store %F* %vtpm.306, %F** %vtpm.302
	ret %F* %vtpm.306

abort:
	call void @abort(  )
	unreachable
}

define %G* @G_new() {

entry:
	%vtpm.309 = alloca %G*
	%vtpm.310 = getelementptr %_G_vtable, %_G_vtable* @_G_vtable_prototype, i32 0, i32 1
	%vtpm.311 = load i32, i32* %vtpm.310
	%vtpm.312 = call i8*(i32 ) @malloc( i32 %vtpm.311 )
	%vtpm.313 = bitcast i8* %vtpm.312 to %G*
	%malloc.null = icmp eq %G* %vtpm.313, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.314 = getelementptr %G, %G* %vtpm.313, i32 0, i32 0
	store %_G_vtable* @_G_vtable_prototype, %_G_vtable** %vtpm.314
	store %G* %vtpm.313, %G** %vtpm.309
	ret %G* %vtpm.313

abort:
	call void @abort(  )
	unreachable
}

define %H* @H_new() {

entry:
	%vtpm.316 = alloca %H*
	%vtpm.317 = getelementptr %_H_vtable, %_H_vtable* @_H_vtable_prototype, i32 0, i32 1
	%vtpm.318 = load i32, i32* %vtpm.317
	%vtpm.319 = call i8*(i32 ) @malloc( i32 %vtpm.318 )
	%vtpm.320 = bitcast i8* %vtpm.319 to %H*
	%malloc.null = icmp eq %H* %vtpm.320, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.321 = getelementptr %H, %H* %vtpm.320, i32 0, i32 0
	store %_H_vtable* @_H_vtable_prototype, %_H_vtable** %vtpm.321
	store %H* %vtpm.320, %H** %vtpm.316
	ret %H* %vtpm.320

abort:
	call void @abort(  )
	unreachable
}

define %I* @I_new() {

entry:
	%vtpm.323 = alloca %I*
	%vtpm.324 = getelementptr %_I_vtable, %_I_vtable* @_I_vtable_prototype, i32 0, i32 1
	%vtpm.325 = load i32, i32* %vtpm.324
	%vtpm.326 = call i8*(i32 ) @malloc( i32 %vtpm.325 )
	%vtpm.327 = bitcast i8* %vtpm.326 to %I*
	%malloc.null = icmp eq %I* %vtpm.327, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.328 = getelementptr %I, %I* %vtpm.327, i32 0, i32 0
	store %_I_vtable* @_I_vtable_prototype, %_I_vtable** %vtpm.328
	store %I* %vtpm.327, %I** %vtpm.323
	ret %I* %vtpm.327

abort:
	call void @abort(  )
	unreachable
}

define %J* @J_new() {

entry:
	%vtpm.330 = alloca %J*
	%vtpm.331 = getelementptr %_J_vtable, %_J_vtable* @_J_vtable_prototype, i32 0, i32 1
	%vtpm.332 = load i32, i32* %vtpm.331
	%vtpm.333 = call i8*(i32 ) @malloc( i32 %vtpm.332 )
	%vtpm.334 = bitcast i8* %vtpm.333 to %J*
	%malloc.null = icmp eq %J* %vtpm.334, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.335 = getelementptr %J, %J* %vtpm.334, i32 0, i32 0
	store %_J_vtable* @_J_vtable_prototype, %_J_vtable** %vtpm.335
	store %J* %vtpm.334, %J** %vtpm.330
	ret %J* %vtpm.334

abort:
	call void @abort(  )
	unreachable
}

define %K* @K_new() {

entry:
	%vtpm.337 = alloca %K*
	%vtpm.338 = getelementptr %_K_vtable, %_K_vtable* @_K_vtable_prototype, i32 0, i32 1
	%vtpm.339 = load i32, i32* %vtpm.338
	%vtpm.340 = call i8*(i32 ) @malloc( i32 %vtpm.339 )
	%vtpm.341 = bitcast i8* %vtpm.340 to %K*
	%malloc.null = icmp eq %K* %vtpm.341, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.342 = getelementptr %K, %K* %vtpm.341, i32 0, i32 0
	store %_K_vtable* @_K_vtable_prototype, %_K_vtable** %vtpm.342
	store %K* %vtpm.341, %K** %vtpm.337
	ret %K* %vtpm.341

abort:
	call void @abort(  )
	unreachable
}

define %L* @L_new() {

entry:
	%vtpm.344 = alloca %L*
	%vtpm.345 = getelementptr %_L_vtable, %_L_vtable* @_L_vtable_prototype, i32 0, i32 1
	%vtpm.346 = load i32, i32* %vtpm.345
	%vtpm.347 = call i8*(i32 ) @malloc( i32 %vtpm.346 )
	%vtpm.348 = bitcast i8* %vtpm.347 to %L*
	%malloc.null = icmp eq %L* %vtpm.348, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.349 = getelementptr %L, %L* %vtpm.348, i32 0, i32 0
	store %_L_vtable* @_L_vtable_prototype, %_L_vtable** %vtpm.349
	store %L* %vtpm.348, %L** %vtpm.344
	ret %L* %vtpm.348

abort:
	call void @abort(  )
	unreachable
}

define %M* @M_new() {

entry:
	%vtpm.351 = alloca %M*
	%vtpm.352 = getelementptr %_M_vtable, %_M_vtable* @_M_vtable_prototype, i32 0, i32 1
	%vtpm.353 = load i32, i32* %vtpm.352
	%vtpm.354 = call i8*(i32 ) @malloc( i32 %vtpm.353 )
	%vtpm.355 = bitcast i8* %vtpm.354 to %M*
	%malloc.null = icmp eq %M* %vtpm.355, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.356 = getelementptr %M, %M* %vtpm.355, i32 0, i32 0
	store %_M_vtable* @_M_vtable_prototype, %_M_vtable** %vtpm.356
	store %M* %vtpm.355, %M** %vtpm.351
	ret %M* %vtpm.355

abort:
	call void @abort(  )
	unreachable
}

define %N* @N_new() {

entry:
	%vtpm.358 = alloca %N*
	%vtpm.359 = getelementptr %_N_vtable, %_N_vtable* @_N_vtable_prototype, i32 0, i32 1
	%vtpm.360 = load i32, i32* %vtpm.359
	%vtpm.361 = call i8*(i32 ) @malloc( i32 %vtpm.360 )
	%vtpm.362 = bitcast i8* %vtpm.361 to %N*
	%malloc.null = icmp eq %N* %vtpm.362, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.363 = getelementptr %N, %N* %vtpm.362, i32 0, i32 0
	store %_N_vtable* @_N_vtable_prototype, %_N_vtable** %vtpm.363
	store %N* %vtpm.362, %N** %vtpm.358
	ret %N* %vtpm.362

abort:
	call void @abort(  )
	unreachable
}

define %O* @O_new() {

entry:
	%vtpm.365 = alloca %O*
	%vtpm.366 = getelementptr %_O_vtable, %_O_vtable* @_O_vtable_prototype, i32 0, i32 1
	%vtpm.367 = load i32, i32* %vtpm.366
	%vtpm.368 = call i8*(i32 ) @malloc( i32 %vtpm.367 )
	%vtpm.369 = bitcast i8* %vtpm.368 to %O*
	%malloc.null = icmp eq %O* %vtpm.369, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.370 = getelementptr %O, %O* %vtpm.369, i32 0, i32 0
	store %_O_vtable* @_O_vtable_prototype, %_O_vtable** %vtpm.370
	store %O* %vtpm.369, %O** %vtpm.365
	ret %O* %vtpm.369

abort:
	call void @abort(  )
	unreachable
}

define %P* @P_new() {

entry:
	%vtpm.372 = alloca %P*
	%vtpm.373 = getelementptr %_P_vtable, %_P_vtable* @_P_vtable_prototype, i32 0, i32 1
	%vtpm.374 = load i32, i32* %vtpm.373
	%vtpm.375 = call i8*(i32 ) @malloc( i32 %vtpm.374 )
	%vtpm.376 = bitcast i8* %vtpm.375 to %P*
	%malloc.null = icmp eq %P* %vtpm.376, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.377 = getelementptr %P, %P* %vtpm.376, i32 0, i32 0
	store %_P_vtable* @_P_vtable_prototype, %_P_vtable** %vtpm.377
	store %P* %vtpm.376, %P** %vtpm.372
	ret %P* %vtpm.376

abort:
	call void @abort(  )
	unreachable
}

define %Q* @Q_new() {

entry:
	%vtpm.379 = alloca %Q*
	%vtpm.380 = getelementptr %_Q_vtable, %_Q_vtable* @_Q_vtable_prototype, i32 0, i32 1
	%vtpm.381 = load i32, i32* %vtpm.380
	%vtpm.382 = call i8*(i32 ) @malloc( i32 %vtpm.381 )
	%vtpm.383 = bitcast i8* %vtpm.382 to %Q*
	%malloc.null = icmp eq %Q* %vtpm.383, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.384 = getelementptr %Q, %Q* %vtpm.383, i32 0, i32 0
	store %_Q_vtable* @_Q_vtable_prototype, %_Q_vtable** %vtpm.384
	store %Q* %vtpm.383, %Q** %vtpm.379
	ret %Q* %vtpm.383

abort:
	call void @abort(  )
	unreachable
}

