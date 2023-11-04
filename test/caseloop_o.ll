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
	%vtpm.143 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.143, i32 %vtpm.142 )
	%vtpm.145 = bitcast %Int* %vtpm.143 to i8*
	%vtpm.146 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.146, i32 17 )
	%vtpm.148 = bitcast %Int* %vtpm.146 to i8*
	%vtpm.149 = icmp eq i8* %vtpm.145, %vtpm.148
	%vtpm.150 = xor i1 %vtpm.149, true
	br i1 %vtpm.150, label %true.2, label %false.2

true.2:
	%vtpm.151 = load i32, i32* %vtpm.1
	%vtpm.152 = add i32 %vtpm.151, 1
	store i32 %vtpm.152, i32* %vtpm.1
	store i32 %vtpm.152, i32* %vtpm.22
	br label %end.2

false.2:
	store i32 0, i32* %vtpm.22
	br label %end.2

end.2:
	%vtpm.153 = load i32, i32* %vtpm.22
	store i32 0, i32* %vtpm.0
	br label %while.3

while.3:
	%vtpm.154 = load i32, i32* %vtpm.0
	%vtpm.155 = icmp slt i32 %vtpm.154, 10
	br i1 %vtpm.155, label %loop_body.3, label %loop_end.3

loop_body.3:
	%vtpm.156 = load %Object*, %Object** %vtpm.2
	%tmp.4 = icmp eq %Object* %vtpm.156, null
	br i1 %tmp.4, label %abort, label %ok.1

ok.1:
	%vtpm.157 = getelementptr %Object, %Object* %vtpm.156, i32 0, i32 0
	%vtpm.158 = load %_Object_vtable*, %_Object_vtable** %vtpm.157
	%vtpm.159 = getelementptr %_Object_vtable, %_Object_vtable* %vtpm.158, i32 0, i32 0
	%vtpm.160 = load i32, i32* %vtpm.159
	br label %case.hdr.4

case.hdr.4:
	br label %case.22.4

case.22.4:
	%vtpm.161 = icmp slt i32 %vtpm.160, 22
	br i1 %vtpm.161, label %br_exit.22.4, label %src_gte_br.22.4

src_gte_br.22.4:
	%vtpm.162 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.162, label %br_exit.22.4, label %src_lte_mc.22.4

src_lte_mc.22.4:
	%vtpm.163 = bitcast %Object* %vtpm.156 to %Q*
	store %Q* %vtpm.163, %Q** %vtpm.39
	%vtpm.164 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.164, i32 17 )
	store %Int* %vtpm.164, %Int** %tmp.1
	br label %case.exit.4

br_exit.22.4:
	br label %case.21.4

case.21.4:
	%vtpm.166 = icmp slt i32 %vtpm.160, 21
	br i1 %vtpm.166, label %br_exit.21.4, label %src_gte_br.21.4

src_gte_br.21.4:
	%vtpm.167 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.167, label %br_exit.21.4, label %src_lte_mc.21.4

src_lte_mc.21.4:
	%vtpm.168 = bitcast %Object* %vtpm.156 to %P*
	store %P* %vtpm.168, %P** %vtpm.38
	%vtpm.169 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.169, i32 16 )
	store %Int* %vtpm.169, %Int** %tmp.1
	br label %case.exit.4

br_exit.21.4:
	br label %case.20.4

case.20.4:
	%vtpm.171 = icmp slt i32 %vtpm.160, 20
	br i1 %vtpm.171, label %br_exit.20.4, label %src_gte_br.20.4

src_gte_br.20.4:
	%vtpm.172 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.172, label %br_exit.20.4, label %src_lte_mc.20.4

src_lte_mc.20.4:
	%vtpm.173 = bitcast %Object* %vtpm.156 to %O*
	store %O* %vtpm.173, %O** %vtpm.37
	%vtpm.174 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.174, i32 15 )
	store %Int* %vtpm.174, %Int** %tmp.1
	br label %case.exit.4

br_exit.20.4:
	br label %case.19.4

case.19.4:
	%vtpm.176 = icmp slt i32 %vtpm.160, 19
	br i1 %vtpm.176, label %br_exit.19.4, label %src_gte_br.19.4

src_gte_br.19.4:
	%vtpm.177 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.177, label %br_exit.19.4, label %src_lte_mc.19.4

src_lte_mc.19.4:
	%vtpm.178 = bitcast %Object* %vtpm.156 to %N*
	store %N* %vtpm.178, %N** %vtpm.36
	%vtpm.179 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.179, i32 14 )
	store %Int* %vtpm.179, %Int** %tmp.1
	br label %case.exit.4

br_exit.19.4:
	br label %case.18.4

case.18.4:
	%vtpm.181 = icmp slt i32 %vtpm.160, 18
	br i1 %vtpm.181, label %br_exit.18.4, label %src_gte_br.18.4

src_gte_br.18.4:
	%vtpm.182 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.182, label %br_exit.18.4, label %src_lte_mc.18.4

src_lte_mc.18.4:
	%vtpm.183 = bitcast %Object* %vtpm.156 to %M*
	store %M* %vtpm.183, %M** %vtpm.35
	%vtpm.184 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.184, i32 13 )
	store %Int* %vtpm.184, %Int** %tmp.1
	br label %case.exit.4

br_exit.18.4:
	br label %case.17.4

case.17.4:
	%vtpm.186 = icmp slt i32 %vtpm.160, 17
	br i1 %vtpm.186, label %br_exit.17.4, label %src_gte_br.17.4

src_gte_br.17.4:
	%vtpm.187 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.187, label %br_exit.17.4, label %src_lte_mc.17.4

src_lte_mc.17.4:
	%vtpm.188 = bitcast %Object* %vtpm.156 to %L*
	store %L* %vtpm.188, %L** %vtpm.34
	%vtpm.189 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.189, i32 12 )
	store %Int* %vtpm.189, %Int** %tmp.1
	br label %case.exit.4

br_exit.17.4:
	br label %case.16.4

case.16.4:
	%vtpm.191 = icmp slt i32 %vtpm.160, 16
	br i1 %vtpm.191, label %br_exit.16.4, label %src_gte_br.16.4

src_gte_br.16.4:
	%vtpm.192 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.192, label %br_exit.16.4, label %src_lte_mc.16.4

src_lte_mc.16.4:
	%vtpm.193 = bitcast %Object* %vtpm.156 to %K*
	store %K* %vtpm.193, %K** %vtpm.33
	%vtpm.194 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.194, i32 11 )
	store %Int* %vtpm.194, %Int** %tmp.1
	br label %case.exit.4

br_exit.16.4:
	br label %case.15.4

case.15.4:
	%vtpm.196 = icmp slt i32 %vtpm.160, 15
	br i1 %vtpm.196, label %br_exit.15.4, label %src_gte_br.15.4

src_gte_br.15.4:
	%vtpm.197 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.197, label %br_exit.15.4, label %src_lte_mc.15.4

src_lte_mc.15.4:
	%vtpm.198 = bitcast %Object* %vtpm.156 to %J*
	store %J* %vtpm.198, %J** %vtpm.32
	%vtpm.199 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.199, i32 10 )
	store %Int* %vtpm.199, %Int** %tmp.1
	br label %case.exit.4

br_exit.15.4:
	br label %case.14.4

case.14.4:
	%vtpm.201 = icmp slt i32 %vtpm.160, 14
	br i1 %vtpm.201, label %br_exit.14.4, label %src_gte_br.14.4

src_gte_br.14.4:
	%vtpm.202 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.202, label %br_exit.14.4, label %src_lte_mc.14.4

src_lte_mc.14.4:
	%vtpm.203 = bitcast %Object* %vtpm.156 to %I*
	store %I* %vtpm.203, %I** %vtpm.31
	%vtpm.204 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.204, i32 9 )
	store %Int* %vtpm.204, %Int** %tmp.1
	br label %case.exit.4

br_exit.14.4:
	br label %case.13.4

case.13.4:
	%vtpm.206 = icmp slt i32 %vtpm.160, 13
	br i1 %vtpm.206, label %br_exit.13.4, label %src_gte_br.13.4

src_gte_br.13.4:
	%vtpm.207 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.207, label %br_exit.13.4, label %src_lte_mc.13.4

src_lte_mc.13.4:
	%vtpm.208 = bitcast %Object* %vtpm.156 to %H*
	store %H* %vtpm.208, %H** %vtpm.30
	%vtpm.209 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.209, i32 8 )
	store %Int* %vtpm.209, %Int** %tmp.1
	br label %case.exit.4

br_exit.13.4:
	br label %case.12.4

case.12.4:
	%vtpm.211 = icmp slt i32 %vtpm.160, 12
	br i1 %vtpm.211, label %br_exit.12.4, label %src_gte_br.12.4

src_gte_br.12.4:
	%vtpm.212 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.212, label %br_exit.12.4, label %src_lte_mc.12.4

src_lte_mc.12.4:
	%vtpm.213 = bitcast %Object* %vtpm.156 to %G*
	store %G* %vtpm.213, %G** %vtpm.29
	%vtpm.214 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.214, i32 7 )
	store %Int* %vtpm.214, %Int** %tmp.1
	br label %case.exit.4

br_exit.12.4:
	br label %case.11.4

case.11.4:
	%vtpm.216 = icmp slt i32 %vtpm.160, 11
	br i1 %vtpm.216, label %br_exit.11.4, label %src_gte_br.11.4

src_gte_br.11.4:
	%vtpm.217 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.217, label %br_exit.11.4, label %src_lte_mc.11.4

src_lte_mc.11.4:
	%vtpm.218 = bitcast %Object* %vtpm.156 to %F*
	store %F* %vtpm.218, %F** %vtpm.28
	%vtpm.219 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.219, i32 6 )
	store %Int* %vtpm.219, %Int** %tmp.1
	br label %case.exit.4

br_exit.11.4:
	br label %case.10.4

case.10.4:
	%vtpm.221 = icmp slt i32 %vtpm.160, 10
	br i1 %vtpm.221, label %br_exit.10.4, label %src_gte_br.10.4

src_gte_br.10.4:
	%vtpm.222 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.222, label %br_exit.10.4, label %src_lte_mc.10.4

src_lte_mc.10.4:
	%vtpm.223 = bitcast %Object* %vtpm.156 to %E*
	store %E* %vtpm.223, %E** %vtpm.27
	%vtpm.224 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.224, i32 5 )
	store %Int* %vtpm.224, %Int** %tmp.1
	br label %case.exit.4

br_exit.10.4:
	br label %case.9.4

case.9.4:
	%vtpm.226 = icmp slt i32 %vtpm.160, 9
	br i1 %vtpm.226, label %br_exit.9.4, label %src_gte_br.9.4

src_gte_br.9.4:
	%vtpm.227 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.227, label %br_exit.9.4, label %src_lte_mc.9.4

src_lte_mc.9.4:
	%vtpm.228 = bitcast %Object* %vtpm.156 to %D*
	store %D* %vtpm.228, %D** %vtpm.26
	%vtpm.229 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.229, i32 4 )
	store %Int* %vtpm.229, %Int** %tmp.1
	br label %case.exit.4

br_exit.9.4:
	br label %case.8.4

case.8.4:
	%vtpm.231 = icmp slt i32 %vtpm.160, 8
	br i1 %vtpm.231, label %br_exit.8.4, label %src_gte_br.8.4

src_gte_br.8.4:
	%vtpm.232 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.232, label %br_exit.8.4, label %src_lte_mc.8.4

src_lte_mc.8.4:
	%vtpm.233 = bitcast %Object* %vtpm.156 to %C*
	store %C* %vtpm.233, %C** %vtpm.25
	%vtpm.234 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.234, i32 3 )
	store %Int* %vtpm.234, %Int** %tmp.1
	br label %case.exit.4

br_exit.8.4:
	br label %case.7.4

case.7.4:
	%vtpm.236 = icmp slt i32 %vtpm.160, 7
	br i1 %vtpm.236, label %br_exit.7.4, label %src_gte_br.7.4

src_gte_br.7.4:
	%vtpm.237 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.237, label %br_exit.7.4, label %src_lte_mc.7.4

src_lte_mc.7.4:
	%vtpm.238 = bitcast %Object* %vtpm.156 to %B*
	store %B* %vtpm.238, %B** %vtpm.24
	%vtpm.239 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.239, i32 2 )
	store %Int* %vtpm.239, %Int** %tmp.1
	br label %case.exit.4

br_exit.7.4:
	br label %case.6.4

case.6.4:
	%vtpm.241 = icmp slt i32 %vtpm.160, 6
	br i1 %vtpm.241, label %br_exit.6.4, label %src_gte_br.6.4

src_gte_br.6.4:
	%vtpm.242 = icmp sgt i32 %vtpm.160, 22
	br i1 %vtpm.242, label %br_exit.6.4, label %src_lte_mc.6.4

src_lte_mc.6.4:
	%vtpm.243 = bitcast %Object* %vtpm.156 to %A*
	store %A* %vtpm.243, %A** %vtpm.23
	%vtpm.244 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.244, i32 1 )
	store %Int* %vtpm.244, %Int** %tmp.1
	br label %case.exit.4

br_exit.6.4:
	br label %abort

case.exit.4:
	%tmp.5 = load %Int*, %Int** %tmp.1
	%vtpm.246 = getelementptr %Int, %Int* %tmp.5, i32 0, i32 1
	%vtpm.247 = load i32, i32* %vtpm.246
	store i32 %vtpm.247, i32* %vtpm.4
	%vtpm.248 = load i32, i32* %vtpm.0
	%vtpm.249 = add i32 %vtpm.248, 1
	store i32 %vtpm.249, i32* %vtpm.0
	br label %while.3

loop_end.3:
	%vtpm.250 = load i32, i32* %vtpm.4
	%vtpm.251 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.251, i32 %vtpm.250 )
	%vtpm.253 = bitcast %Int* %vtpm.251 to i8*
	%vtpm.254 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.254, i32 1 )
	%vtpm.256 = bitcast %Int* %vtpm.254 to i8*
	%vtpm.257 = icmp eq i8* %vtpm.253, %vtpm.256
	%vtpm.258 = xor i1 %vtpm.257, true
	br i1 %vtpm.258, label %true.5, label %false.5

true.5:
	%vtpm.259 = load i32, i32* %vtpm.1
	%vtpm.260 = add i32 %vtpm.259, 1
	store i32 %vtpm.260, i32* %vtpm.1
	store i32 %vtpm.260, i32* %vtpm.40
	br label %end.5

false.5:
	store i32 0, i32* %vtpm.40
	br label %end.5

end.5:
	%vtpm.261 = load i32, i32* %vtpm.40
	%vtpm.262 = load i32, i32* %vtpm.1
	%vtpm.263 = load %Main*, %Main** %vtpm.41
	%vtpm.264 = icmp eq %Main* %vtpm.263, null
	br i1 %vtpm.264, label %abort, label %ok.2

ok.2:
	%vtpm.265 = getelementptr %Main, %Main* %vtpm.263, i32 0, i32 0
	%vtpm.266 = load %_Main_vtable*, %_Main_vtable** %vtpm.265
	%vtpm.267 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.266, i32 0, i32 8
	%tmp.6 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.267
	%vtpm.268 = call %Main*(%Main*, i32 ) %tmp.6( %Main* %vtpm.263, i32 %vtpm.262 )
	%vtpm.269 = load %Main*, %Main** %vtpm.41
	%vtpm.270 = bitcast %Main* %vtpm.269 to %Object*
	ret %Object* %vtpm.270

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.272 = alloca %Main*
	%vtpm.273 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.274 = load i32, i32* %vtpm.273
	%vtpm.275 = call i8*(i32 ) @malloc( i32 %vtpm.274 )
	%vtpm.276 = bitcast i8* %vtpm.275 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.276, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.277 = getelementptr %Main, %Main* %vtpm.276, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.277
	store %Main* %vtpm.276, %Main** %vtpm.272
	ret %Main* %vtpm.276

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%vtpm.279 = alloca %A*
	%vtpm.280 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%vtpm.281 = load i32, i32* %vtpm.280
	%vtpm.282 = call i8*(i32 ) @malloc( i32 %vtpm.281 )
	%vtpm.283 = bitcast i8* %vtpm.282 to %A*
	%malloc.null = icmp eq %A* %vtpm.283, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.284 = getelementptr %A, %A* %vtpm.283, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.284
	store %A* %vtpm.283, %A** %vtpm.279
	ret %A* %vtpm.283

abort:
	call void @abort(  )
	unreachable
}

define %B* @B_new() {

entry:
	%vtpm.286 = alloca %B*
	%vtpm.287 = getelementptr %_B_vtable, %_B_vtable* @_B_vtable_prototype, i32 0, i32 1
	%vtpm.288 = load i32, i32* %vtpm.287
	%vtpm.289 = call i8*(i32 ) @malloc( i32 %vtpm.288 )
	%vtpm.290 = bitcast i8* %vtpm.289 to %B*
	%malloc.null = icmp eq %B* %vtpm.290, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.291 = getelementptr %B, %B* %vtpm.290, i32 0, i32 0
	store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.291
	store %B* %vtpm.290, %B** %vtpm.286
	ret %B* %vtpm.290

abort:
	call void @abort(  )
	unreachable
}

define %C* @C_new() {

entry:
	%vtpm.293 = alloca %C*
	%vtpm.294 = getelementptr %_C_vtable, %_C_vtable* @_C_vtable_prototype, i32 0, i32 1
	%vtpm.295 = load i32, i32* %vtpm.294
	%vtpm.296 = call i8*(i32 ) @malloc( i32 %vtpm.295 )
	%vtpm.297 = bitcast i8* %vtpm.296 to %C*
	%malloc.null = icmp eq %C* %vtpm.297, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.298 = getelementptr %C, %C* %vtpm.297, i32 0, i32 0
	store %_C_vtable* @_C_vtable_prototype, %_C_vtable** %vtpm.298
	store %C* %vtpm.297, %C** %vtpm.293
	ret %C* %vtpm.297

abort:
	call void @abort(  )
	unreachable
}

define %D* @D_new() {

entry:
	%vtpm.300 = alloca %D*
	%vtpm.301 = getelementptr %_D_vtable, %_D_vtable* @_D_vtable_prototype, i32 0, i32 1
	%vtpm.302 = load i32, i32* %vtpm.301
	%vtpm.303 = call i8*(i32 ) @malloc( i32 %vtpm.302 )
	%vtpm.304 = bitcast i8* %vtpm.303 to %D*
	%malloc.null = icmp eq %D* %vtpm.304, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.305 = getelementptr %D, %D* %vtpm.304, i32 0, i32 0
	store %_D_vtable* @_D_vtable_prototype, %_D_vtable** %vtpm.305
	store %D* %vtpm.304, %D** %vtpm.300
	ret %D* %vtpm.304

abort:
	call void @abort(  )
	unreachable
}

define %E* @E_new() {

entry:
	%vtpm.307 = alloca %E*
	%vtpm.308 = getelementptr %_E_vtable, %_E_vtable* @_E_vtable_prototype, i32 0, i32 1
	%vtpm.309 = load i32, i32* %vtpm.308
	%vtpm.310 = call i8*(i32 ) @malloc( i32 %vtpm.309 )
	%vtpm.311 = bitcast i8* %vtpm.310 to %E*
	%malloc.null = icmp eq %E* %vtpm.311, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.312 = getelementptr %E, %E* %vtpm.311, i32 0, i32 0
	store %_E_vtable* @_E_vtable_prototype, %_E_vtable** %vtpm.312
	store %E* %vtpm.311, %E** %vtpm.307
	ret %E* %vtpm.311

abort:
	call void @abort(  )
	unreachable
}

define %F* @F_new() {

entry:
	%vtpm.314 = alloca %F*
	%vtpm.315 = getelementptr %_F_vtable, %_F_vtable* @_F_vtable_prototype, i32 0, i32 1
	%vtpm.316 = load i32, i32* %vtpm.315
	%vtpm.317 = call i8*(i32 ) @malloc( i32 %vtpm.316 )
	%vtpm.318 = bitcast i8* %vtpm.317 to %F*
	%malloc.null = icmp eq %F* %vtpm.318, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.319 = getelementptr %F, %F* %vtpm.318, i32 0, i32 0
	store %_F_vtable* @_F_vtable_prototype, %_F_vtable** %vtpm.319
	store %F* %vtpm.318, %F** %vtpm.314
	ret %F* %vtpm.318

abort:
	call void @abort(  )
	unreachable
}

define %G* @G_new() {

entry:
	%vtpm.321 = alloca %G*
	%vtpm.322 = getelementptr %_G_vtable, %_G_vtable* @_G_vtable_prototype, i32 0, i32 1
	%vtpm.323 = load i32, i32* %vtpm.322
	%vtpm.324 = call i8*(i32 ) @malloc( i32 %vtpm.323 )
	%vtpm.325 = bitcast i8* %vtpm.324 to %G*
	%malloc.null = icmp eq %G* %vtpm.325, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.326 = getelementptr %G, %G* %vtpm.325, i32 0, i32 0
	store %_G_vtable* @_G_vtable_prototype, %_G_vtable** %vtpm.326
	store %G* %vtpm.325, %G** %vtpm.321
	ret %G* %vtpm.325

abort:
	call void @abort(  )
	unreachable
}

define %H* @H_new() {

entry:
	%vtpm.328 = alloca %H*
	%vtpm.329 = getelementptr %_H_vtable, %_H_vtable* @_H_vtable_prototype, i32 0, i32 1
	%vtpm.330 = load i32, i32* %vtpm.329
	%vtpm.331 = call i8*(i32 ) @malloc( i32 %vtpm.330 )
	%vtpm.332 = bitcast i8* %vtpm.331 to %H*
	%malloc.null = icmp eq %H* %vtpm.332, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.333 = getelementptr %H, %H* %vtpm.332, i32 0, i32 0
	store %_H_vtable* @_H_vtable_prototype, %_H_vtable** %vtpm.333
	store %H* %vtpm.332, %H** %vtpm.328
	ret %H* %vtpm.332

abort:
	call void @abort(  )
	unreachable
}

define %I* @I_new() {

entry:
	%vtpm.335 = alloca %I*
	%vtpm.336 = getelementptr %_I_vtable, %_I_vtable* @_I_vtable_prototype, i32 0, i32 1
	%vtpm.337 = load i32, i32* %vtpm.336
	%vtpm.338 = call i8*(i32 ) @malloc( i32 %vtpm.337 )
	%vtpm.339 = bitcast i8* %vtpm.338 to %I*
	%malloc.null = icmp eq %I* %vtpm.339, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.340 = getelementptr %I, %I* %vtpm.339, i32 0, i32 0
	store %_I_vtable* @_I_vtable_prototype, %_I_vtable** %vtpm.340
	store %I* %vtpm.339, %I** %vtpm.335
	ret %I* %vtpm.339

abort:
	call void @abort(  )
	unreachable
}

define %J* @J_new() {

entry:
	%vtpm.342 = alloca %J*
	%vtpm.343 = getelementptr %_J_vtable, %_J_vtable* @_J_vtable_prototype, i32 0, i32 1
	%vtpm.344 = load i32, i32* %vtpm.343
	%vtpm.345 = call i8*(i32 ) @malloc( i32 %vtpm.344 )
	%vtpm.346 = bitcast i8* %vtpm.345 to %J*
	%malloc.null = icmp eq %J* %vtpm.346, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.347 = getelementptr %J, %J* %vtpm.346, i32 0, i32 0
	store %_J_vtable* @_J_vtable_prototype, %_J_vtable** %vtpm.347
	store %J* %vtpm.346, %J** %vtpm.342
	ret %J* %vtpm.346

abort:
	call void @abort(  )
	unreachable
}

define %K* @K_new() {

entry:
	%vtpm.349 = alloca %K*
	%vtpm.350 = getelementptr %_K_vtable, %_K_vtable* @_K_vtable_prototype, i32 0, i32 1
	%vtpm.351 = load i32, i32* %vtpm.350
	%vtpm.352 = call i8*(i32 ) @malloc( i32 %vtpm.351 )
	%vtpm.353 = bitcast i8* %vtpm.352 to %K*
	%malloc.null = icmp eq %K* %vtpm.353, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.354 = getelementptr %K, %K* %vtpm.353, i32 0, i32 0
	store %_K_vtable* @_K_vtable_prototype, %_K_vtable** %vtpm.354
	store %K* %vtpm.353, %K** %vtpm.349
	ret %K* %vtpm.353

abort:
	call void @abort(  )
	unreachable
}

define %L* @L_new() {

entry:
	%vtpm.356 = alloca %L*
	%vtpm.357 = getelementptr %_L_vtable, %_L_vtable* @_L_vtable_prototype, i32 0, i32 1
	%vtpm.358 = load i32, i32* %vtpm.357
	%vtpm.359 = call i8*(i32 ) @malloc( i32 %vtpm.358 )
	%vtpm.360 = bitcast i8* %vtpm.359 to %L*
	%malloc.null = icmp eq %L* %vtpm.360, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.361 = getelementptr %L, %L* %vtpm.360, i32 0, i32 0
	store %_L_vtable* @_L_vtable_prototype, %_L_vtable** %vtpm.361
	store %L* %vtpm.360, %L** %vtpm.356
	ret %L* %vtpm.360

abort:
	call void @abort(  )
	unreachable
}

define %M* @M_new() {

entry:
	%vtpm.363 = alloca %M*
	%vtpm.364 = getelementptr %_M_vtable, %_M_vtable* @_M_vtable_prototype, i32 0, i32 1
	%vtpm.365 = load i32, i32* %vtpm.364
	%vtpm.366 = call i8*(i32 ) @malloc( i32 %vtpm.365 )
	%vtpm.367 = bitcast i8* %vtpm.366 to %M*
	%malloc.null = icmp eq %M* %vtpm.367, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.368 = getelementptr %M, %M* %vtpm.367, i32 0, i32 0
	store %_M_vtable* @_M_vtable_prototype, %_M_vtable** %vtpm.368
	store %M* %vtpm.367, %M** %vtpm.363
	ret %M* %vtpm.367

abort:
	call void @abort(  )
	unreachable
}

define %N* @N_new() {

entry:
	%vtpm.370 = alloca %N*
	%vtpm.371 = getelementptr %_N_vtable, %_N_vtable* @_N_vtable_prototype, i32 0, i32 1
	%vtpm.372 = load i32, i32* %vtpm.371
	%vtpm.373 = call i8*(i32 ) @malloc( i32 %vtpm.372 )
	%vtpm.374 = bitcast i8* %vtpm.373 to %N*
	%malloc.null = icmp eq %N* %vtpm.374, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.375 = getelementptr %N, %N* %vtpm.374, i32 0, i32 0
	store %_N_vtable* @_N_vtable_prototype, %_N_vtable** %vtpm.375
	store %N* %vtpm.374, %N** %vtpm.370
	ret %N* %vtpm.374

abort:
	call void @abort(  )
	unreachable
}

define %O* @O_new() {

entry:
	%vtpm.377 = alloca %O*
	%vtpm.378 = getelementptr %_O_vtable, %_O_vtable* @_O_vtable_prototype, i32 0, i32 1
	%vtpm.379 = load i32, i32* %vtpm.378
	%vtpm.380 = call i8*(i32 ) @malloc( i32 %vtpm.379 )
	%vtpm.381 = bitcast i8* %vtpm.380 to %O*
	%malloc.null = icmp eq %O* %vtpm.381, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.382 = getelementptr %O, %O* %vtpm.381, i32 0, i32 0
	store %_O_vtable* @_O_vtable_prototype, %_O_vtable** %vtpm.382
	store %O* %vtpm.381, %O** %vtpm.377
	ret %O* %vtpm.381

abort:
	call void @abort(  )
	unreachable
}

define %P* @P_new() {

entry:
	%vtpm.384 = alloca %P*
	%vtpm.385 = getelementptr %_P_vtable, %_P_vtable* @_P_vtable_prototype, i32 0, i32 1
	%vtpm.386 = load i32, i32* %vtpm.385
	%vtpm.387 = call i8*(i32 ) @malloc( i32 %vtpm.386 )
	%vtpm.388 = bitcast i8* %vtpm.387 to %P*
	%malloc.null = icmp eq %P* %vtpm.388, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.389 = getelementptr %P, %P* %vtpm.388, i32 0, i32 0
	store %_P_vtable* @_P_vtable_prototype, %_P_vtable** %vtpm.389
	store %P* %vtpm.388, %P** %vtpm.384
	ret %P* %vtpm.388

abort:
	call void @abort(  )
	unreachable
}

define %Q* @Q_new() {

entry:
	%vtpm.391 = alloca %Q*
	%vtpm.392 = getelementptr %_Q_vtable, %_Q_vtable* @_Q_vtable_prototype, i32 0, i32 1
	%vtpm.393 = load i32, i32* %vtpm.392
	%vtpm.394 = call i8*(i32 ) @malloc( i32 %vtpm.393 )
	%vtpm.395 = bitcast i8* %vtpm.394 to %Q*
	%malloc.null = icmp eq %Q* %vtpm.395, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.396 = getelementptr %Q, %Q* %vtpm.395, i32 0, i32 0
	store %_Q_vtable* @_Q_vtable_prototype, %_Q_vtable** %vtpm.396
	store %Q* %vtpm.395, %Q** %vtpm.391
	ret %Q* %vtpm.395

abort:
	call void @abort(  )
	unreachable
}

