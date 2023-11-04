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
	%A* (%A*) *,
	%A* (%A*) *
}

@_A_vtable_prototype = constant %_A_vtable {
	i32 5,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%A*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A*) *),
	%String* (%A*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A*) *),
	%A* (%A*) * bitcast (%Object* (%Object*) * @Object_copy to %A* (%A*) *),
	%A* (%A*) * @A_me
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
	%B* (%B*) *,
	%B* (%B*) *
}

@_B_vtable_prototype = constant %_B_vtable {
	i32 6,
	i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0),
	%B* () * @B_new,
	%Object* (%B*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%B*) *),
	%String* (%B*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%B*) *),
	%B* (%B*) * bitcast (%Object* (%Object*) * @Object_copy to %B* (%B*) *),
	%B* (%B*) * bitcast (%A* (%A*) * @A_me to %B* (%B*) *)
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
	%String* (%Main*) *
}

@_Main_vtable_prototype = constant %_Main_vtable {
	i32 7,
	i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
	%Main* () * @Main_new,
	%Object* (%Main*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Main*) *),
	%String* (%Main*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Main*) *),
	%Main* (%Main*) * bitcast (%Object* (%Object*) * @Object_copy to %Main* (%Main*) *),
	%String* (%Main*) * @Main_main
}

@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.0 = internal constant [12 x i8] c"selftype.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([12 x i8], [12 x i8]* @global_str.0, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main* @Main_new(  )
	%main.retval = call %String*(%Main* ) @Main_main( %Main* %main.obj )
	ret i32 0
}

declare %Object* @Object_new()
declare %Int* @Int_new()
declare %Bool* @Bool_new()
declare %String* @String_new()
declare %IO* @IO_new()
define %A* @A_me(%A* %self) {

entry:
	%vtpm.0 = alloca %A*
	store %A* %self, %A** %vtpm.0
	%vtpm.1 = load %A*, %A** %vtpm.0
	ret %A* %vtpm.1

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%vtpm.3 = alloca %A*
	%vtpm.4 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%vtpm.5 = load i32, i32* %vtpm.4
	%vtpm.6 = call i8*(i32 ) @malloc( i32 %vtpm.5 )
	%vtpm.7 = bitcast i8* %vtpm.6 to %A*
	%malloc.null = icmp eq %A* %vtpm.7, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.8 = getelementptr %A, %A* %vtpm.7, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.8
	store %A* %vtpm.7, %A** %vtpm.3
	ret %A* %vtpm.7

abort:
	call void @abort(  )
	unreachable
}

define %B* @B_new() {

entry:
	%vtpm.10 = alloca %B*
	%vtpm.11 = getelementptr %_B_vtable, %_B_vtable* @_B_vtable_prototype, i32 0, i32 1
	%vtpm.12 = load i32, i32* %vtpm.11
	%vtpm.13 = call i8*(i32 ) @malloc( i32 %vtpm.12 )
	%vtpm.14 = bitcast i8* %vtpm.13 to %B*
	%malloc.null = icmp eq %B* %vtpm.14, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.15 = getelementptr %B, %B* %vtpm.14, i32 0, i32 0
	store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.15
	store %B* %vtpm.14, %B** %vtpm.10
	ret %B* %vtpm.14

abort:
	call void @abort(  )
	unreachable
}

define %String* @Main_main(%Main* %self) {

entry:
	%vtpm.17 = alloca %Main*
	store %Main* %self, %Main** %vtpm.17
	%vtpm.18 = call %B* @B_new(  )
	%vtpm.19 = icmp eq %B* %vtpm.18, null
	br i1 %vtpm.19, label %abort, label %ok.0

ok.0:
	%vtpm.20 = getelementptr %B, %B* %vtpm.18, i32 0, i32 0
	%vtpm.21 = load %_B_vtable*, %_B_vtable** %vtpm.20
	%vtpm.22 = getelementptr %_B_vtable, %_B_vtable* %vtpm.21, i32 0, i32 7
	%tmp.0 = load %B* (%B*) *, %B* (%B*) ** %vtpm.22
	%vtpm.23 = call %B*(%B* ) %tmp.0( %B* %vtpm.18 )
	%vtpm.24 = icmp eq %B* %vtpm.23, null
	br i1 %vtpm.24, label %abort, label %ok.1

ok.1:
	%vtpm.25 = getelementptr %B, %B* %vtpm.23, i32 0, i32 0
	%vtpm.26 = load %_B_vtable*, %_B_vtable** %vtpm.25
	%vtpm.27 = getelementptr %_B_vtable, %_B_vtable* %vtpm.26, i32 0, i32 5
	%tmp.1 = load %String* (%B*) *, %String* (%B*) ** %vtpm.27
	%vtpm.28 = call %String*(%B* ) %tmp.1( %B* %vtpm.23 )
	ret %String* %vtpm.28

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.30 = alloca %Main*
	%vtpm.31 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.32 = load i32, i32* %vtpm.31
	%vtpm.33 = call i8*(i32 ) @malloc( i32 %vtpm.32 )
	%vtpm.34 = bitcast i8* %vtpm.33 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.34, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.35 = getelementptr %Main, %Main* %vtpm.34, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.35
	store %Main* %vtpm.34, %Main** %vtpm.30
	ret %Main* %vtpm.34

abort:
	call void @abort(  )
	unreachable
}

