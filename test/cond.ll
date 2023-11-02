declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
declare %Object* @Object_abort(%Object*)
declare %String* @Object_type_name(%Object*)
declare %Object* @Object_copy(%Object*)
declare %Object* @Object_new()
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
declare %Int* @Int_new()
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
declare %Bool* @Bool_new()
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
declare %String* @String_new()
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
declare %IO* @IO_new()
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

declare %A* @A_new()
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
	i32 5,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%A*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A*) *),
	%String* (%A*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A*) *),
	%A* (%A*) * bitcast (%Object* (%Object*) * @Object_copy to %A* (%A*) *)
}

declare %B* @B_new()
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
	i32 6,
	i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0),
	%B* () * @B_new,
	%Object* (%B*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%B*) *),
	%String* (%B*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%B*) *),
	%B* (%B*) * bitcast (%Object* (%Object*) * @Object_copy to %B* (%B*) *)
}

declare i1 @Main_main(%Main*)
declare %Main* @Main_new()
@str.Main = internal constant [5 x i8] c"Main\00"
%Main = type {
	%_Main_vtable*,
	%A*,
	%B*
}

%_Main_vtable = type {
	i32,
	i32,
	i8*,
	%Main* () *,
	%Object* (%Main*) *,
	%String* (%Main*) *,
	%Main* (%Main*) *,
	i1 (%Main*) *
}

@_Main_vtable_prototype = constant %_Main_vtable {
	i32 7,
	i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
	%Main* () * @Main_new,
	%Object* (%Main*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Main*) *),
	%String* (%Main*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Main*) *),
	%Main* (%Main*) * bitcast (%Object* (%Object*) * @Object_copy to %Main* (%Main*) *),
	i1 (%Main*) * @Main_main
}

@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.0 = internal constant [8 x i8] c"cond.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @global_str.0, i32 0, i32 0)
}

@.str = internal constant [25 x i8] c"Main.main() returned %d\0A\00"
define i32 @main() {

entry:
	%vtpm.0 = call i32 @Main_main(  )
define i1 @Main_main(%Main* %self) {

entry:
	%vtpm.1 = alloca %A*
	%vtpm.2 = alloca %Object*
	%vtpm.3 = alloca %Main*
	store %Main* %self, %Main** %vtpm.3
	br i1 true, label %true.0, label %false.0

true.0:
	%vtpm.4 = load %Main*, %Main** %vtpm.3
	%vtpm.5 = getelementptr %Main, %Main* %vtpm.4, i32 0, i32 1
	%vtpm.6 = load %A*, %A** %vtpm.5
	store %A* %vtpm.6, %A** %vtpm.1
	br label %end.0

false.0:
	%vtpm.7 = load %Main*, %Main** %vtpm.3
	%vtpm.8 = getelementptr %Main, %Main* %vtpm.7, i32 0, i32 2
	%vtpm.9 = load %B*, %B** %vtpm.8
	%vtpm.10 = bitcast %B* %vtpm.9 to %A*
	store %A* %vtpm.10, %A** %vtpm.1
	br label %end.0

end.0:
	%vtpm.11 = load %A*, %A** %vtpm.1
	br i1 false, label %true.1, label %false.1

true.1:
	%vtpm.12 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.12, i32 1 )
	%vtpm.14 = bitcast %Int* %vtpm.12 to %Object*
	store %Object* %vtpm.14, %Object** %vtpm.2
	br label %end.1

false.1:
	%vtpm.15 = call %Bool* @Bool_new(  )
	call void(%Bool*, i1 ) @Bool_init( %Bool* %vtpm.15, i1 true )
	%vtpm.17 = bitcast %Bool* %vtpm.15 to %Object*
	store %Object* %vtpm.17, %Object** %vtpm.2
	br label %end.1

end.1:
	%vtpm.18 = load %Object*, %Object** %vtpm.2
	ret i1 true

abort:
	call void @abort(  )
	unreachable
}

