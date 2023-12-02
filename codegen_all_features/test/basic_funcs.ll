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

@global_str.1 = internal constant [7 x i8] c"Frugel\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([7 x i8], [7 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.2 = internal constant [14 x i8] c"<basic class>\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.2, i32 0, i32 0)
}

@global_str.0 = internal constant [15 x i8] c"basic_funcs.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([15 x i8], [15 x i8]* @global_str.0, i32 0, i32 0)
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
	%vtpm.0 = alloca %Main*
	store %Main* %self, %Main** %vtpm.0
	%vtpm.1 = load %Main*, %Main** %vtpm.0
	%vtpm.2 = icmp eq %Main* %vtpm.1, null
	br i1 %vtpm.2, label %abort, label %ok.0

ok.0:
	%vtpm.3 = getelementptr %Main, %Main* %vtpm.1, i32 0, i32 0
	%vtpm.4 = load %_Main_vtable*, %_Main_vtable** %vtpm.3
	%vtpm.5 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.4, i32 0, i32 5
	%tmp.0 = load %String* (%Main*) *, %String* (%Main*) ** %vtpm.5
	%vtpm.6 = call %String*(%Main* ) %tmp.0( %Main* %vtpm.1 )
	%vtpm.7 = load %Main*, %Main** %vtpm.0
	%vtpm.8 = icmp eq %Main* %vtpm.7, null
	br i1 %vtpm.8, label %abort, label %ok.1

ok.1:
	%vtpm.9 = getelementptr %Main, %Main* %vtpm.7, i32 0, i32 0
	%vtpm.10 = load %_Main_vtable*, %_Main_vtable** %vtpm.9
	%vtpm.11 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.10, i32 0, i32 7
	%tmp.1 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.11
	%vtpm.12 = call %Main*(%Main*, %String* ) %tmp.1( %Main* %vtpm.7, %String* %vtpm.6 )
	%vtpm.13 = load %Main*, %Main** %vtpm.0
	%vtpm.14 = icmp eq %Main* %vtpm.13, null
	br i1 %vtpm.14, label %abort, label %ok.2

ok.2:
	%vtpm.15 = getelementptr %Main, %Main* %vtpm.13, i32 0, i32 0
	%vtpm.16 = load %_Main_vtable*, %_Main_vtable** %vtpm.15
	%vtpm.17 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.16, i32 0, i32 8
	%tmp.2 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.17
	%vtpm.18 = call %Main*(%Main*, i32 ) %tmp.2( %Main* %vtpm.13, i32 879 )
	%vtpm.19 = load %Main*, %Main** %vtpm.0
	%vtpm.20 = icmp eq %Main* %vtpm.19, null
	br i1 %vtpm.20, label %abort, label %ok.3

ok.3:
	%vtpm.21 = getelementptr %Main, %Main* %vtpm.19, i32 0, i32 0
	%vtpm.22 = load %_Main_vtable*, %_Main_vtable** %vtpm.21
	%vtpm.23 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.22, i32 0, i32 5
	%tmp.3 = load %String* (%Main*) *, %String* (%Main*) ** %vtpm.23
	%vtpm.24 = call %String*(%Main* ) %tmp.3( %Main* %vtpm.19 )
	%vtpm.25 = icmp eq %String* %vtpm.24, null
	br i1 %vtpm.25, label %abort, label %ok.4

ok.4:
	%vtpm.26 = getelementptr %String, %String* %vtpm.24, i32 0, i32 0
	%vtpm.27 = load %_String_vtable*, %_String_vtable** %vtpm.26
	%vtpm.28 = getelementptr %_String_vtable, %_String_vtable* %vtpm.27, i32 0, i32 8
	%tmp.4 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.28
	%vtpm.29 = call %String*(%String*, %String* ) %tmp.4( %String* %vtpm.24, %String* @String.1 )
	%vtpm.30 = load %Main*, %Main** %vtpm.0
	%vtpm.31 = icmp eq %Main* %vtpm.30, null
	br i1 %vtpm.31, label %abort, label %ok.5

ok.5:
	%vtpm.32 = getelementptr %Main, %Main* %vtpm.30, i32 0, i32 0
	%vtpm.33 = load %_Main_vtable*, %_Main_vtable** %vtpm.32
	%vtpm.34 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.33, i32 0, i32 7
	%tmp.5 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.34
	%vtpm.35 = call %Main*(%Main*, %String* ) %tmp.5( %Main* %vtpm.30, %String* %vtpm.29 )
	%vtpm.36 = load %Main*, %Main** %vtpm.0
	%vtpm.37 = icmp eq %Main* %vtpm.36, null
	br i1 %vtpm.37, label %abort, label %ok.6

ok.6:
	%vtpm.38 = getelementptr %Main, %Main* %vtpm.36, i32 0, i32 0
	%vtpm.39 = load %_Main_vtable*, %_Main_vtable** %vtpm.38
	%vtpm.40 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.39, i32 0, i32 5
	%tmp.6 = load %String* (%Main*) *, %String* (%Main*) ** %vtpm.40
	%vtpm.41 = call %String*(%Main* ) %tmp.6( %Main* %vtpm.36 )
	%vtpm.42 = icmp eq %String* %vtpm.41, null
	br i1 %vtpm.42, label %abort, label %ok.7

ok.7:
	%vtpm.43 = getelementptr %String, %String* %vtpm.41, i32 0, i32 0
	%vtpm.44 = load %_String_vtable*, %_String_vtable** %vtpm.43
	%vtpm.45 = getelementptr %_String_vtable, %_String_vtable* %vtpm.44, i32 0, i32 7
	%tmp.7 = load i32 (%String*) *, i32 (%String*) ** %vtpm.45
	%vtpm.46 = call i32(%String* ) %tmp.7( %String* %vtpm.41 )
	%vtpm.47 = load %Main*, %Main** %vtpm.0
	%vtpm.48 = icmp eq %Main* %vtpm.47, null
	br i1 %vtpm.48, label %abort, label %ok.8

ok.8:
	%vtpm.49 = getelementptr %Main, %Main* %vtpm.47, i32 0, i32 0
	%vtpm.50 = load %_Main_vtable*, %_Main_vtable** %vtpm.49
	%vtpm.51 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.50, i32 0, i32 8
	%tmp.8 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.51
	%vtpm.52 = call %Main*(%Main*, i32 ) %tmp.8( %Main* %vtpm.47, i32 %vtpm.46 )
	%vtpm.53 = load %Main*, %Main** %vtpm.0
	%vtpm.54 = icmp eq %Main* %vtpm.53, null
	br i1 %vtpm.54, label %abort, label %ok.9

ok.9:
	%vtpm.55 = getelementptr %Main, %Main* %vtpm.53, i32 0, i32 0
	%vtpm.56 = load %_Main_vtable*, %_Main_vtable** %vtpm.55
	%vtpm.57 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.56, i32 0, i32 5
	%tmp.9 = load %String* (%Main*) *, %String* (%Main*) ** %vtpm.57
	%vtpm.58 = call %String*(%Main* ) %tmp.9( %Main* %vtpm.53 )
	%vtpm.59 = icmp eq %String* %vtpm.58, null
	br i1 %vtpm.59, label %abort, label %ok.10

ok.10:
	%vtpm.60 = getelementptr %String, %String* %vtpm.58, i32 0, i32 0
	%vtpm.61 = load %_String_vtable*, %_String_vtable** %vtpm.60
	%vtpm.62 = getelementptr %_String_vtable, %_String_vtable* %vtpm.61, i32 0, i32 9
	%tmp.10 = load %String* (%String*,i32,i32) *, %String* (%String*,i32,i32) ** %vtpm.62
	%vtpm.63 = call %String*(%String*, i32, i32 ) %tmp.10( %String* %vtpm.58, i32 2, i32 2 )
	%vtpm.64 = load %Main*, %Main** %vtpm.0
	%vtpm.65 = icmp eq %Main* %vtpm.64, null
	br i1 %vtpm.65, label %abort, label %ok.11

ok.11:
	%vtpm.66 = getelementptr %Main, %Main* %vtpm.64, i32 0, i32 0
	%vtpm.67 = load %_Main_vtable*, %_Main_vtable** %vtpm.66
	%vtpm.68 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.67, i32 0, i32 7
	%tmp.11 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.68
	%vtpm.69 = call %Main*(%Main*, %String* ) %tmp.11( %Main* %vtpm.64, %String* %vtpm.63 )
	%vtpm.70 = load %Main*, %Main** %vtpm.0
	%vtpm.71 = bitcast %Main* %vtpm.70 to %Object*
	ret %Object* %vtpm.71

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.73 = alloca %Main*
	%vtpm.74 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.75 = load i32, i32* %vtpm.74
	%vtpm.76 = call i8*(i32 ) @malloc( i32 %vtpm.75 )
	%vtpm.77 = bitcast i8* %vtpm.76 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.77, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.78 = getelementptr %Main, %Main* %vtpm.77, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.78
	store %Main* %vtpm.77, %Main** %vtpm.73
	ret %Main* %vtpm.77

abort:
	call void @abort(  )
	unreachable
}

