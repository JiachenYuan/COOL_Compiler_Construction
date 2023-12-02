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
	%_A_vtable*,
	i32
}

%_A_vtable = type {
	i32,
	i32,
	i8*,
	%A* () *,
	%Object* (%A*) *,
	%String* (%A*) *,
	%A* (%A*) *,
	i32 (%A*) *,
	%A* (%A*,i32) *
}

@_A_vtable_prototype = constant %_A_vtable {
	i32 6,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%A*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A*) *),
	%String* (%A*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A*) *),
	%A* (%A*) * bitcast (%Object* (%Object*) * @Object_copy to %A* (%A*) *),
	i32 (%A*) * @A_getAnswerToAll,
	%A* (%A*,i32) * @A_setAnswerToAll
}

@global_str.2 = internal constant [14 x i8] c"<basic class>\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.2, i32 0, i32 0)
}

@global_str.1 = internal constant [2 x i8] c" \00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.0 = internal constant [11 x i8] c"copy_o2.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([11 x i8], [11 x i8]* @global_str.0, i32 0, i32 0)
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
	%vtpm.0 = alloca %A*
	%vtpm.1 = alloca %A*
	%vtpm.2 = alloca %Main*
	store %Main* %self, %Main** %vtpm.2
	%vtpm.3 = call %A* @A_new(  )
	store %A* %vtpm.3, %A** %vtpm.0
	store %A* null, %A** %vtpm.1
	%vtpm.4 = load %A*, %A** %vtpm.0
	%vtpm.5 = icmp eq %A* %vtpm.4, null
	br i1 %vtpm.5, label %abort, label %ok.0

ok.0:
	%vtpm.6 = getelementptr %A, %A* %vtpm.4, i32 0, i32 0
	%vtpm.7 = load %_A_vtable*, %_A_vtable** %vtpm.6
	%vtpm.8 = getelementptr %_A_vtable, %_A_vtable* %vtpm.7, i32 0, i32 6
	%tmp.0 = load %A* (%A*) *, %A* (%A*) ** %vtpm.8
	%vtpm.9 = call %A*(%A* ) %tmp.0( %A* %vtpm.4 )
	store %A* %vtpm.9, %A** %vtpm.1
	%vtpm.10 = load %A*, %A** %vtpm.1
	%vtpm.11 = icmp eq %A* %vtpm.10, null
	br i1 %vtpm.11, label %abort, label %ok.1

ok.1:
	%vtpm.12 = getelementptr %A, %A* %vtpm.10, i32 0, i32 0
	%vtpm.13 = load %_A_vtable*, %_A_vtable** %vtpm.12
	%vtpm.14 = getelementptr %_A_vtable, %_A_vtable* %vtpm.13, i32 0, i32 8
	%tmp.1 = load %A* (%A*,i32) *, %A* (%A*,i32) ** %vtpm.14
	%vtpm.15 = call %A*(%A*, i32 ) %tmp.1( %A* %vtpm.10, i32 21 )
	%vtpm.16 = load %A*, %A** %vtpm.0
	%vtpm.17 = icmp eq %A* %vtpm.16, null
	br i1 %vtpm.17, label %abort, label %ok.2

ok.2:
	%vtpm.18 = getelementptr %A, %A* %vtpm.16, i32 0, i32 0
	%vtpm.19 = load %_A_vtable*, %_A_vtable** %vtpm.18
	%vtpm.20 = getelementptr %_A_vtable, %_A_vtable* %vtpm.19, i32 0, i32 7
	%tmp.2 = load i32 (%A*) *, i32 (%A*) ** %vtpm.20
	%vtpm.21 = call i32(%A* ) %tmp.2( %A* %vtpm.16 )
	%vtpm.22 = load %Main*, %Main** %vtpm.2
	%vtpm.23 = icmp eq %Main* %vtpm.22, null
	br i1 %vtpm.23, label %abort, label %ok.3

ok.3:
	%vtpm.24 = getelementptr %Main, %Main* %vtpm.22, i32 0, i32 0
	%vtpm.25 = load %_Main_vtable*, %_Main_vtable** %vtpm.24
	%vtpm.26 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.25, i32 0, i32 8
	%tmp.3 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.26
	%vtpm.27 = call %Main*(%Main*, i32 ) %tmp.3( %Main* %vtpm.22, i32 %vtpm.21 )
	%vtpm.28 = load %Main*, %Main** %vtpm.2
	%vtpm.29 = icmp eq %Main* %vtpm.28, null
	br i1 %vtpm.29, label %abort, label %ok.4

ok.4:
	%vtpm.30 = getelementptr %Main, %Main* %vtpm.28, i32 0, i32 0
	%vtpm.31 = load %_Main_vtable*, %_Main_vtable** %vtpm.30
	%vtpm.32 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.31, i32 0, i32 7
	%tmp.4 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.32
	%vtpm.33 = call %Main*(%Main*, %String* ) %tmp.4( %Main* %vtpm.28, %String* @String.1 )
	%vtpm.34 = load %A*, %A** %vtpm.1
	%vtpm.35 = icmp eq %A* %vtpm.34, null
	br i1 %vtpm.35, label %abort, label %ok.5

ok.5:
	%vtpm.36 = getelementptr %A, %A* %vtpm.34, i32 0, i32 0
	%vtpm.37 = load %_A_vtable*, %_A_vtable** %vtpm.36
	%vtpm.38 = getelementptr %_A_vtable, %_A_vtable* %vtpm.37, i32 0, i32 7
	%tmp.5 = load i32 (%A*) *, i32 (%A*) ** %vtpm.38
	%vtpm.39 = call i32(%A* ) %tmp.5( %A* %vtpm.34 )
	%vtpm.40 = load %Main*, %Main** %vtpm.2
	%vtpm.41 = icmp eq %Main* %vtpm.40, null
	br i1 %vtpm.41, label %abort, label %ok.6

ok.6:
	%vtpm.42 = getelementptr %Main, %Main* %vtpm.40, i32 0, i32 0
	%vtpm.43 = load %_Main_vtable*, %_Main_vtable** %vtpm.42
	%vtpm.44 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.43, i32 0, i32 8
	%tmp.6 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.44
	%vtpm.45 = call %Main*(%Main*, i32 ) %tmp.6( %Main* %vtpm.40, i32 %vtpm.39 )
	%vtpm.46 = bitcast %Main* %vtpm.45 to %Object*
	ret %Object* %vtpm.46

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.48 = alloca %Main*
	%vtpm.49 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.50 = load i32, i32* %vtpm.49
	%vtpm.51 = call i8*(i32 ) @malloc( i32 %vtpm.50 )
	%vtpm.52 = bitcast i8* %vtpm.51 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.52, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.53 = getelementptr %Main, %Main* %vtpm.52, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.53
	store %Main* %vtpm.52, %Main** %vtpm.48
	ret %Main* %vtpm.52

abort:
	call void @abort(  )
	unreachable
}

define i32 @A_getAnswerToAll(%A* %self) {

entry:
	%vtpm.55 = alloca %A*
	store %A* %self, %A** %vtpm.55
	%vtpm.56 = load %A*, %A** %vtpm.55
	%vtpm.57 = getelementptr %A, %A* %vtpm.56, i32 0, i32 1
	%vtpm.58 = load i32, i32* %vtpm.57
	ret i32 %vtpm.58

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_setAnswerToAll(%A* %self, i32 %myAns) {

entry:
	%vtpm.60 = alloca %A*
	%vtpm.61 = alloca i32
	store %A* %self, %A** %vtpm.60
	store i32 %myAns, i32* %vtpm.61
	%vtpm.62 = load i32, i32* %vtpm.61
	%vtpm.63 = load %A*, %A** %vtpm.60
	%vtpm.64 = getelementptr %A, %A* %vtpm.63, i32 0, i32 1
	store i32 %vtpm.62, i32* %vtpm.64
	%vtpm.65 = load %A*, %A** %vtpm.60
	ret %A* %vtpm.65

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%vtpm.67 = alloca %A*
	%vtpm.68 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%vtpm.69 = load i32, i32* %vtpm.68
	%vtpm.70 = call i8*(i32 ) @malloc( i32 %vtpm.69 )
	%vtpm.71 = bitcast i8* %vtpm.70 to %A*
	%malloc.null = icmp eq %A* %vtpm.71, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.72 = getelementptr %A, %A* %vtpm.71, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.72
	store %A* %vtpm.71, %A** %vtpm.67
	%vtpm.73 = getelementptr %A, %A* %vtpm.71, i32 0, i32 1
	store i32 0, i32* %vtpm.73
	%vtpm.74 = getelementptr %A, %A* %vtpm.71, i32 0, i32 1
	%vtpm.75 = load %A*, %A** %vtpm.67
	%vtpm.76 = getelementptr %A, %A* %vtpm.75, i32 0, i32 1
	store i32 42, i32* %vtpm.76
	ret %A* %vtpm.71

abort:
	call void @abort(  )
	unreachable
}

