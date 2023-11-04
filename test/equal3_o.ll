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
	%_Main_vtable*,
	%A*,
	%A*,
	%A*
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
	%Main* (%Main*) *
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
	%Main* (%Main*) * @Main_main
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

@global_str.2 = internal constant [5 x i8] c"ok!\0A\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([5 x i8], [5 x i8]* @global_str.2, i32 0, i32 0)
}

@global_str.1 = internal constant [9 x i8] c"not ok!\0A\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([9 x i8], [9 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.3 = internal constant [14 x i8] c"<basic class>\00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.3, i32 0, i32 0)
}

@global_str.0 = internal constant [12 x i8] c"equal3_o.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([12 x i8], [12 x i8]* @global_str.0, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main* @Main_new(  )
	%main.retval = call %Main*(%Main* ) @Main_main( %Main* %main.obj )
	ret i32 0
}

declare %Object* @Object_new()
declare %Int* @Int_new()
declare %Bool* @Bool_new()
declare %String* @String_new()
declare %IO* @IO_new()
define %Main* @Main_main(%Main* %self) {

entry:
	%vtpm.0 = alloca %Main*
	%vtpm.1 = alloca %Main*
	%vtpm.2 = alloca %Main*
	store %Main* %self, %Main** %vtpm.2
	%vtpm.3 = load %Main*, %Main** %vtpm.2
	%vtpm.4 = getelementptr %Main, %Main* %vtpm.3, i32 0, i32 1
	%vtpm.5 = load %A*, %A** %vtpm.4
	%vtpm.6 = load %Main*, %Main** %vtpm.2
	%vtpm.7 = getelementptr %Main, %Main* %vtpm.6, i32 0, i32 2
	%vtpm.8 = load %A*, %A** %vtpm.7
	%vtpm.9 = bitcast %A* %vtpm.5 to i8*
	%vtpm.10 = bitcast %A* %vtpm.8 to i8*
	%vtpm.11 = icmp eq i8* %vtpm.9, %vtpm.10
	br i1 %vtpm.11, label %true.0, label %false.0

true.0:
	%vtpm.12 = load %Main*, %Main** %vtpm.2
	%vtpm.13 = icmp eq %Main* %vtpm.12, null
	br i1 %vtpm.13, label %abort, label %ok.0

ok.0:
	%vtpm.14 = getelementptr %Main, %Main* %vtpm.12, i32 0, i32 0
	%vtpm.15 = load %_Main_vtable*, %_Main_vtable** %vtpm.14
	%vtpm.16 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.15, i32 0, i32 7
	%tmp.0 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.16
	%vtpm.17 = call %Main*(%Main*, %String* ) %tmp.0( %Main* %vtpm.12, %String* @String.1 )
	store %Main* %vtpm.17, %Main** %vtpm.0
	br label %end.0

false.0:
	%vtpm.18 = load %Main*, %Main** %vtpm.2
	%vtpm.19 = getelementptr %Main, %Main* %vtpm.18, i32 0, i32 2
	%vtpm.20 = load %A*, %A** %vtpm.19
	%vtpm.21 = load %Main*, %Main** %vtpm.2
	%vtpm.22 = getelementptr %Main, %Main* %vtpm.21, i32 0, i32 3
	%vtpm.23 = load %A*, %A** %vtpm.22
	%vtpm.24 = bitcast %A* %vtpm.20 to i8*
	%vtpm.25 = bitcast %A* %vtpm.23 to i8*
	%vtpm.26 = icmp eq i8* %vtpm.24, %vtpm.25
	br i1 %vtpm.26, label %true.1, label %false.1

true.1:
	%vtpm.27 = load %Main*, %Main** %vtpm.2
	%vtpm.28 = icmp eq %Main* %vtpm.27, null
	br i1 %vtpm.28, label %abort, label %ok.1

ok.1:
	%vtpm.29 = getelementptr %Main, %Main* %vtpm.27, i32 0, i32 0
	%vtpm.30 = load %_Main_vtable*, %_Main_vtable** %vtpm.29
	%vtpm.31 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.30, i32 0, i32 7
	%tmp.1 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.31
	%vtpm.32 = call %Main*(%Main*, %String* ) %tmp.1( %Main* %vtpm.27, %String* @String.2 )
	store %Main* %vtpm.32, %Main** %vtpm.1
	br label %end.1

false.1:
	%vtpm.33 = load %Main*, %Main** %vtpm.2
	%vtpm.34 = icmp eq %Main* %vtpm.33, null
	br i1 %vtpm.34, label %abort, label %ok.2

ok.2:
	%vtpm.35 = getelementptr %Main, %Main* %vtpm.33, i32 0, i32 0
	%vtpm.36 = load %_Main_vtable*, %_Main_vtable** %vtpm.35
	%vtpm.37 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.36, i32 0, i32 7
	%tmp.2 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.37
	%vtpm.38 = call %Main*(%Main*, %String* ) %tmp.2( %Main* %vtpm.33, %String* @String.1 )
	store %Main* %vtpm.38, %Main** %vtpm.1
	br label %end.1

end.1:
	%vtpm.39 = load %Main*, %Main** %vtpm.1
	store %Main* %vtpm.39, %Main** %vtpm.0
	br label %end.0

end.0:
	%vtpm.40 = load %Main*, %Main** %vtpm.0
	ret %Main* %vtpm.40

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.42 = alloca %Main*
	%vtpm.43 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.44 = load i32, i32* %vtpm.43
	%vtpm.45 = call i8*(i32 ) @malloc( i32 %vtpm.44 )
	%vtpm.46 = bitcast i8* %vtpm.45 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.46, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.47 = getelementptr %Main, %Main* %vtpm.46, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.47
	store %Main* %vtpm.46, %Main** %vtpm.42
	%vtpm.48 = getelementptr %Main, %Main* %vtpm.46, i32 0, i32 1
	store %A* null, %A** %vtpm.48
	%vtpm.49 = getelementptr %Main, %Main* %vtpm.46, i32 0, i32 2
	store %A* null, %A** %vtpm.49
	%vtpm.50 = getelementptr %Main, %Main* %vtpm.46, i32 0, i32 3
	store %A* null, %A** %vtpm.50
	%vtpm.51 = getelementptr %Main, %Main* %vtpm.46, i32 0, i32 1
	%vtpm.52 = call %A* @A_new(  )
	store %A* %vtpm.52, %A** %vtpm.51
	%vtpm.53 = getelementptr %Main, %Main* %vtpm.46, i32 0, i32 2
	%vtpm.54 = call %A* @A_new(  )
	store %A* %vtpm.54, %A** %vtpm.53
	%vtpm.55 = getelementptr %Main, %Main* %vtpm.46, i32 0, i32 3
	%vtpm.56 = load %A*, %A** %vtpm.55
	store %A* %vtpm.56, %A** %vtpm.55
	ret %Main* %vtpm.46

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%vtpm.58 = alloca %A*
	%vtpm.59 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%vtpm.60 = load i32, i32* %vtpm.59
	%vtpm.61 = call i8*(i32 ) @malloc( i32 %vtpm.60 )
	%vtpm.62 = bitcast i8* %vtpm.61 to %A*
	%malloc.null = icmp eq %A* %vtpm.62, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.63 = getelementptr %A, %A* %vtpm.62, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.63
	store %A* %vtpm.62, %A** %vtpm.58
	%vtpm.64 = getelementptr %A, %A* %vtpm.62, i32 0, i32 1
	store i32 0, i32* %vtpm.64
	%vtpm.65 = getelementptr %A, %A* %vtpm.62, i32 0, i32 1
	store i32 2, i32* %vtpm.65
	ret %A* %vtpm.62

abort:
	call void @abort(  )
	unreachable
}

