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
	%_A_vtable*,
	%Object*,
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
	%A* (%A*,%String*) *,
	%A* (%A*,i32) *,
	%String* (%A*) *,
	i32 (%A*) *,
	%Object* (%A*) *
}

@_A_vtable_prototype = constant %_A_vtable {
	i32 5,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%A*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A*) *),
	%String* (%A*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A*) *),
	%A* (%A*) * bitcast (%Object* (%Object*) * @Object_copy to %A* (%A*) *),
	%A* (%A*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %A* (%A*,%String*) *),
	%A* (%A*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %A* (%A*,i32) *),
	%String* (%A*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%A*) *),
	i32 (%A*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%A*) *),
	%Object* (%A*) * @A_f
}

@str.B = internal constant [2 x i8] c"B\00"
%B = type {
	%_B_vtable*,
	%Object*,
	i32,
	i32
}

%_B_vtable = type {
	i32,
	i32,
	i8*,
	%B* () *,
	%Object* (%B*) *,
	%String* (%B*) *,
	%B* (%B*) *,
	%B* (%B*,%String*) *,
	%B* (%B*,i32) *,
	%String* (%B*) *,
	i32 (%B*) *,
	%Object* (%B*) *
}

@_B_vtable_prototype = constant %_B_vtable {
	i32 6,
	i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0),
	%B* () * @B_new,
	%Object* (%B*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%B*) *),
	%String* (%B*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%B*) *),
	%B* (%B*) * bitcast (%Object* (%Object*) * @Object_copy to %B* (%B*) *),
	%B* (%B*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %B* (%B*,%String*) *),
	%B* (%B*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %B* (%B*,i32) *),
	%String* (%B*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%B*) *),
	i32 (%B*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%B*) *),
	%Object* (%B*) * @B_f
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
	i32 7,
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

@global_str.7 = internal constant [14 x i8] c"<basic class>\00"
@String.7 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.7, i32 0, i32 0)
}

@global_str.6 = internal constant [7 x i8] c"new B\0A\00"
@String.6 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([7 x i8], [7 x i8]* @global_str.6, i32 0, i32 0)
}

@global_str.5 = internal constant [7 x i8] c"new A\0A\00"
@String.5 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([7 x i8], [7 x i8]* @global_str.5, i32 0, i32 0)
}

@global_str.4 = internal constant [10 x i8] c"B.f: y = \00"
@String.4 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([10 x i8], [10 x i8]* @global_str.4, i32 0, i32 0)
}

@global_str.3 = internal constant [28 x i8] c"initializing B.y. here x = \00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([28 x i8], [28 x i8]* @global_str.3, i32 0, i32 0)
}

@global_str.2 = internal constant [2 x i8] c"\0A\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @global_str.2, i32 0, i32 0)
}

@global_str.1 = internal constant [10 x i8] c"A.f: x = \00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([10 x i8], [10 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.0 = internal constant [19 x i8] c"initializer-inh.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([19 x i8], [19 x i8]* @global_str.0, i32 0, i32 0)
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
define %Object* @A_f(%A* %self) {

entry:
	%vtpm.0 = alloca %A*
	store %A* %self, %A** %vtpm.0
	%vtpm.1 = load %A*, %A** %vtpm.0
	%vtpm.2 = icmp eq %A* %vtpm.1, null
	br i1 %vtpm.2, label %abort, label %ok.0

ok.0:
	%vtpm.3 = getelementptr %A, %A* %vtpm.1, i32 0, i32 0
	%vtpm.4 = load %_A_vtable*, %_A_vtable** %vtpm.3
	%vtpm.5 = getelementptr %_A_vtable, %_A_vtable* %vtpm.4, i32 0, i32 7
	%tmp.0 = load %A* (%A*,%String*) *, %A* (%A*,%String*) ** %vtpm.5
	%vtpm.6 = call %A*(%A*, %String* ) %tmp.0( %A* %vtpm.1, %String* @String.1 )
	%vtpm.7 = load %A*, %A** %vtpm.0
	%vtpm.8 = getelementptr %A, %A* %vtpm.7, i32 0, i32 2
	%vtpm.9 = load i32, i32* %vtpm.8
	%vtpm.10 = load %A*, %A** %vtpm.0
	%vtpm.11 = icmp eq %A* %vtpm.10, null
	br i1 %vtpm.11, label %abort, label %ok.1

ok.1:
	%vtpm.12 = getelementptr %A, %A* %vtpm.10, i32 0, i32 0
	%vtpm.13 = load %_A_vtable*, %_A_vtable** %vtpm.12
	%vtpm.14 = getelementptr %_A_vtable, %_A_vtable* %vtpm.13, i32 0, i32 8
	%tmp.1 = load %A* (%A*,i32) *, %A* (%A*,i32) ** %vtpm.14
	%vtpm.15 = call %A*(%A*, i32 ) %tmp.1( %A* %vtpm.10, i32 %vtpm.9 )
	%vtpm.16 = load %A*, %A** %vtpm.0
	%vtpm.17 = icmp eq %A* %vtpm.16, null
	br i1 %vtpm.17, label %abort, label %ok.2

ok.2:
	%vtpm.18 = getelementptr %A, %A* %vtpm.16, i32 0, i32 0
	%vtpm.19 = load %_A_vtable*, %_A_vtable** %vtpm.18
	%vtpm.20 = getelementptr %_A_vtable, %_A_vtable* %vtpm.19, i32 0, i32 7
	%tmp.2 = load %A* (%A*,%String*) *, %A* (%A*,%String*) ** %vtpm.20
	%vtpm.21 = call %A*(%A*, %String* ) %tmp.2( %A* %vtpm.16, %String* @String.2 )
	%vtpm.22 = bitcast %A* %vtpm.21 to %Object*
	ret %Object* %vtpm.22

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%vtpm.24 = alloca %A*
	%vtpm.25 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%vtpm.26 = load i32, i32* %vtpm.25
	%vtpm.27 = call i8*(i32 ) @malloc( i32 %vtpm.26 )
	%vtpm.28 = bitcast i8* %vtpm.27 to %A*
	%malloc.null = icmp eq %A* %vtpm.28, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.29 = getelementptr %A, %A* %vtpm.28, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.29
	store %A* %vtpm.28, %A** %vtpm.24
	%vtpm.30 = getelementptr %A, %A* %vtpm.28, i32 0, i32 1
	store %Object* null, %Object** %vtpm.30
	%vtpm.31 = getelementptr %A, %A* %vtpm.28, i32 0, i32 2
	store i32 0, i32* %vtpm.31
	%vtpm.32 = getelementptr %A, %A* %vtpm.28, i32 0, i32 1
	%vtpm.33 = load %A*, %A** %vtpm.24
	%vtpm.34 = icmp eq %A* %vtpm.33, null
	br i1 %vtpm.34, label %abort, label %ok.0

ok.0:
	%vtpm.35 = getelementptr %A, %A* %vtpm.33, i32 0, i32 0
	%vtpm.36 = load %_A_vtable*, %_A_vtable** %vtpm.35
	%vtpm.37 = getelementptr %_A_vtable, %_A_vtable* %vtpm.36, i32 0, i32 11
	%tmp.0 = load %Object* (%A*) *, %Object* (%A*) ** %vtpm.37
	%vtpm.38 = call %Object*(%A* ) %tmp.0( %A* %vtpm.33 )
	%vtpm.39 = load %A*, %A** %vtpm.24
	%vtpm.40 = getelementptr %A, %A* %vtpm.39, i32 0, i32 1
	store %Object* %vtpm.38, %Object** %vtpm.40
	%vtpm.41 = getelementptr %A, %A* %vtpm.28, i32 0, i32 2
	%vtpm.42 = load %A*, %A** %vtpm.24
	%vtpm.43 = getelementptr %A, %A* %vtpm.42, i32 0, i32 2
	store i32 12, i32* %vtpm.43
	ret %A* %vtpm.28

abort:
	call void @abort(  )
	unreachable
}

define %Object* @B_f(%B* %self) {

entry:
	%vtpm.45 = alloca %B*
	store %B* %self, %B** %vtpm.45
	%vtpm.46 = load %B*, %B** %vtpm.45
	%vtpm.47 = icmp eq %B* %vtpm.46, null
	br i1 %vtpm.47, label %abort, label %ok.0

ok.0:
	%vtpm.48 = getelementptr %B, %B* %vtpm.46, i32 0, i32 0
	%vtpm.49 = load %_B_vtable*, %_B_vtable** %vtpm.48
	%vtpm.50 = getelementptr %_B_vtable, %_B_vtable* %vtpm.49, i32 0, i32 7
	%tmp.0 = load %B* (%B*,%String*) *, %B* (%B*,%String*) ** %vtpm.50
	%vtpm.51 = call %B*(%B*, %String* ) %tmp.0( %B* %vtpm.46, %String* @String.4 )
	%vtpm.52 = load %B*, %B** %vtpm.45
	%vtpm.53 = getelementptr %B, %B* %vtpm.52, i32 0, i32 3
	%vtpm.54 = load i32, i32* %vtpm.53
	%vtpm.55 = load %B*, %B** %vtpm.45
	%vtpm.56 = icmp eq %B* %vtpm.55, null
	br i1 %vtpm.56, label %abort, label %ok.1

ok.1:
	%vtpm.57 = getelementptr %B, %B* %vtpm.55, i32 0, i32 0
	%vtpm.58 = load %_B_vtable*, %_B_vtable** %vtpm.57
	%vtpm.59 = getelementptr %_B_vtable, %_B_vtable* %vtpm.58, i32 0, i32 8
	%tmp.1 = load %B* (%B*,i32) *, %B* (%B*,i32) ** %vtpm.59
	%vtpm.60 = call %B*(%B*, i32 ) %tmp.1( %B* %vtpm.55, i32 %vtpm.54 )
	%vtpm.61 = load %B*, %B** %vtpm.45
	%vtpm.62 = icmp eq %B* %vtpm.61, null
	br i1 %vtpm.62, label %abort, label %ok.2

ok.2:
	%vtpm.63 = getelementptr %B, %B* %vtpm.61, i32 0, i32 0
	%vtpm.64 = load %_B_vtable*, %_B_vtable** %vtpm.63
	%vtpm.65 = getelementptr %_B_vtable, %_B_vtable* %vtpm.64, i32 0, i32 7
	%tmp.2 = load %B* (%B*,%String*) *, %B* (%B*,%String*) ** %vtpm.65
	%vtpm.66 = call %B*(%B*, %String* ) %tmp.2( %B* %vtpm.61, %String* @String.2 )
	%vtpm.67 = bitcast %B* %vtpm.66 to %Object*
	ret %Object* %vtpm.67

abort:
	call void @abort(  )
	unreachable
}

define %B* @B_new() {

entry:
	%vtpm.69 = alloca %B*
	%vtpm.70 = getelementptr %_B_vtable, %_B_vtable* @_B_vtable_prototype, i32 0, i32 1
	%vtpm.71 = load i32, i32* %vtpm.70
	%vtpm.72 = call i8*(i32 ) @malloc( i32 %vtpm.71 )
	%vtpm.73 = bitcast i8* %vtpm.72 to %B*
	%malloc.null = icmp eq %B* %vtpm.73, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.74 = getelementptr %B, %B* %vtpm.73, i32 0, i32 0
	store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.74
	store %B* %vtpm.73, %B** %vtpm.69
	%vtpm.75 = getelementptr %B, %B* %vtpm.73, i32 0, i32 1
	store %Object* null, %Object** %vtpm.75
	%vtpm.76 = getelementptr %B, %B* %vtpm.73, i32 0, i32 2
	store i32 0, i32* %vtpm.76
	%vtpm.77 = getelementptr %B, %B* %vtpm.73, i32 0, i32 3
	store i32 0, i32* %vtpm.77
	%vtpm.78 = getelementptr %B, %B* %vtpm.73, i32 0, i32 1
	%vtpm.79 = load %B*, %B** %vtpm.69
	%vtpm.80 = icmp eq %B* %vtpm.79, null
	br i1 %vtpm.80, label %abort, label %ok.0

ok.0:
	%vtpm.81 = getelementptr %B, %B* %vtpm.79, i32 0, i32 0
	%vtpm.82 = load %_B_vtable*, %_B_vtable** %vtpm.81
	%vtpm.83 = getelementptr %_B_vtable, %_B_vtable* %vtpm.82, i32 0, i32 11
	%tmp.0 = load %Object* (%B*) *, %Object* (%B*) ** %vtpm.83
	%vtpm.84 = call %Object*(%B* ) %tmp.0( %B* %vtpm.79 )
	%vtpm.85 = load %B*, %B** %vtpm.69
	%vtpm.86 = getelementptr %B, %B* %vtpm.85, i32 0, i32 1
	store %Object* %vtpm.84, %Object** %vtpm.86
	%vtpm.87 = getelementptr %B, %B* %vtpm.73, i32 0, i32 2
	%vtpm.88 = load %B*, %B** %vtpm.69
	%vtpm.89 = getelementptr %B, %B* %vtpm.88, i32 0, i32 2
	store i32 12, i32* %vtpm.89
	%vtpm.90 = getelementptr %B, %B* %vtpm.73, i32 0, i32 3
	%vtpm.91 = load %B*, %B** %vtpm.69
	%vtpm.92 = icmp eq %B* %vtpm.91, null
	br i1 %vtpm.92, label %abort, label %ok.1

ok.1:
	%vtpm.93 = getelementptr %B, %B* %vtpm.91, i32 0, i32 0
	%vtpm.94 = load %_B_vtable*, %_B_vtable** %vtpm.93
	%vtpm.95 = getelementptr %_B_vtable, %_B_vtable* %vtpm.94, i32 0, i32 7
	%tmp.1 = load %B* (%B*,%String*) *, %B* (%B*,%String*) ** %vtpm.95
	%vtpm.96 = call %B*(%B*, %String* ) %tmp.1( %B* %vtpm.91, %String* @String.3 )
	%vtpm.97 = load %B*, %B** %vtpm.69
	%vtpm.98 = getelementptr %B, %B* %vtpm.97, i32 0, i32 2
	%vtpm.99 = load i32, i32* %vtpm.98
	%vtpm.100 = load %B*, %B** %vtpm.69
	%vtpm.101 = icmp eq %B* %vtpm.100, null
	br i1 %vtpm.101, label %abort, label %ok.2

ok.2:
	%vtpm.102 = getelementptr %B, %B* %vtpm.100, i32 0, i32 0
	%vtpm.103 = load %_B_vtable*, %_B_vtable** %vtpm.102
	%vtpm.104 = getelementptr %_B_vtable, %_B_vtable* %vtpm.103, i32 0, i32 8
	%tmp.2 = load %B* (%B*,i32) *, %B* (%B*,i32) ** %vtpm.104
	%vtpm.105 = call %B*(%B*, i32 ) %tmp.2( %B* %vtpm.100, i32 %vtpm.99 )
	%vtpm.106 = load %B*, %B** %vtpm.69
	%vtpm.107 = icmp eq %B* %vtpm.106, null
	br i1 %vtpm.107, label %abort, label %ok.3

ok.3:
	%vtpm.108 = getelementptr %B, %B* %vtpm.106, i32 0, i32 0
	%vtpm.109 = load %_B_vtable*, %_B_vtable** %vtpm.108
	%vtpm.110 = getelementptr %_B_vtable, %_B_vtable* %vtpm.109, i32 0, i32 7
	%tmp.3 = load %B* (%B*,%String*) *, %B* (%B*,%String*) ** %vtpm.110
	%vtpm.111 = call %B*(%B*, %String* ) %tmp.3( %B* %vtpm.106, %String* @String.2 )
	%vtpm.112 = load %B*, %B** %vtpm.69
	%vtpm.113 = getelementptr %B, %B* %vtpm.112, i32 0, i32 3
	store i32 13, i32* %vtpm.113
	ret %B* %vtpm.73

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Main_main(%Main* %self) {

entry:
	%vtpm.115 = alloca %Main*
	store %Main* %self, %Main** %vtpm.115
	%vtpm.116 = load %Main*, %Main** %vtpm.115
	%vtpm.117 = icmp eq %Main* %vtpm.116, null
	br i1 %vtpm.117, label %abort, label %ok.0

ok.0:
	%vtpm.118 = getelementptr %Main, %Main* %vtpm.116, i32 0, i32 0
	%vtpm.119 = load %_Main_vtable*, %_Main_vtable** %vtpm.118
	%vtpm.120 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.119, i32 0, i32 7
	%tmp.0 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.120
	%vtpm.121 = call %Main*(%Main*, %String* ) %tmp.0( %Main* %vtpm.116, %String* @String.5 )
	%vtpm.122 = call %A* @A_new(  )
	%vtpm.123 = load %Main*, %Main** %vtpm.115
	%vtpm.124 = icmp eq %Main* %vtpm.123, null
	br i1 %vtpm.124, label %abort, label %ok.1

ok.1:
	%vtpm.125 = getelementptr %Main, %Main* %vtpm.123, i32 0, i32 0
	%vtpm.126 = load %_Main_vtable*, %_Main_vtable** %vtpm.125
	%vtpm.127 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.126, i32 0, i32 7
	%tmp.1 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.127
	%vtpm.128 = call %Main*(%Main*, %String* ) %tmp.1( %Main* %vtpm.123, %String* @String.6 )
	%vtpm.129 = call %B* @B_new(  )
	%vtpm.130 = bitcast %B* %vtpm.129 to %Object*
	ret %Object* %vtpm.130

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.132 = alloca %Main*
	%vtpm.133 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.134 = load i32, i32* %vtpm.133
	%vtpm.135 = call i8*(i32 ) @malloc( i32 %vtpm.134 )
	%vtpm.136 = bitcast i8* %vtpm.135 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.136, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.137 = getelementptr %Main, %Main* %vtpm.136, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.137
	store %Main* %vtpm.136, %Main** %vtpm.132
	ret %Main* %vtpm.136

abort:
	call void @abort(  )
	unreachable
}

