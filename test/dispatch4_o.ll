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
	i32 (%Main*) * @Main_func,
	%Object* (%Main*) * @Main_main
}

@str.Beta = internal constant [5 x i8] c"Beta\00"
%Beta = type {
	%_Beta_vtable*
}

%_Beta_vtable = type {
	i32,
	i32,
	i8*,
	%Beta* () *,
	%Object* (%Beta*) *,
	%String* (%Beta*) *,
	%Beta* (%Beta*) *,
	i32 (%Beta*) *,
	i32 (%Beta*) *
}

@_Beta_vtable_prototype = constant %_Beta_vtable {
	i32 6,
	i32 ptrtoint (%Beta* getelementptr (%Beta, %Beta* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Beta, i32 0, i32 0),
	%Beta* () * @Beta_new,
	%Object* (%Beta*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Beta*) *),
	%String* (%Beta*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Beta*) *),
	%Beta* (%Beta*) * bitcast (%Object* (%Object*) * @Object_copy to %Beta* (%Beta*) *),
	i32 (%Beta*) * @Beta_niam,
	i32 (%Beta*) * @Beta_bugger
}

@str.Alpha = internal constant [6 x i8] c"Alpha\00"
%Alpha = type {
	%_Alpha_vtable*
}

%_Alpha_vtable = type {
	i32,
	i32,
	i8*,
	%Alpha* () *,
	%Object* (%Alpha*) *,
	%String* (%Alpha*) *,
	%Alpha* (%Alpha*) *,
	i32 (%Alpha*) *,
	i32 (%Alpha*) *
}

@_Alpha_vtable_prototype = constant %_Alpha_vtable {
	i32 7,
	i32 ptrtoint (%Alpha* getelementptr (%Alpha, %Alpha* null, i32 1) to i32),
	i8* getelementptr ([6 x i8], [6 x i8]* @str.Alpha, i32 0, i32 0),
	%Alpha* () * @Alpha_new,
	%Object* (%Alpha*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Alpha*) *),
	%String* (%Alpha*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Alpha*) *),
	%Alpha* (%Alpha*) * bitcast (%Object* (%Object*) * @Object_copy to %Alpha* (%Alpha*) *),
	i32 (%Alpha*) * @Alpha_niam,
	i32 (%Alpha*) * bitcast (i32 (%Beta*) * @Beta_bugger to i32 (%Alpha*) *)
}

@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.0 = internal constant [15 x i8] c"dispatch4_o.cl\00"
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
define i32 @Main_func(%Main* %self) {

entry:
	%vtpm.0 = alloca %Main*
	store %Main* %self, %Main** %vtpm.0
	%vtpm.1 = call %Alpha* @Alpha_new(  )
	%vtpm.2 = icmp eq %Alpha* %vtpm.1, null
	br i1 %vtpm.2, label %abort, label %ok.0

ok.0:
	%vtpm.3 = getelementptr %_Beta_vtable, %_Beta_vtable* @_Beta_vtable_prototype, i32 0, i32 7
	%tmp.0 = load i32 (%Beta*) *, i32 (%Beta*) ** %vtpm.3
	%vtpm.4 = bitcast %Alpha* %vtpm.1 to %Beta*
	%vtpm.5 = call i32(%Beta* ) %tmp.0( %Beta* %vtpm.4 )
	ret i32 %vtpm.5

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Main_main(%Main* %self) {

entry:
	%vtpm.7 = alloca %Main*
	store %Main* %self, %Main** %vtpm.7
	%vtpm.8 = load %Main*, %Main** %vtpm.7
	%vtpm.9 = icmp eq %Main* %vtpm.8, null
	br i1 %vtpm.9, label %abort, label %ok.0

ok.0:
	%vtpm.10 = getelementptr %Main, %Main* %vtpm.8, i32 0, i32 0
	%vtpm.11 = load %_Main_vtable*, %_Main_vtable** %vtpm.10
	%vtpm.12 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.11, i32 0, i32 11
	%tmp.0 = load i32 (%Main*) *, i32 (%Main*) ** %vtpm.12
	%vtpm.13 = call i32(%Main* ) %tmp.0( %Main* %vtpm.8 )
	%vtpm.14 = load %Main*, %Main** %vtpm.7
	%vtpm.15 = icmp eq %Main* %vtpm.14, null
	br i1 %vtpm.15, label %abort, label %ok.1

ok.1:
	%vtpm.16 = getelementptr %Main, %Main* %vtpm.14, i32 0, i32 0
	%vtpm.17 = load %_Main_vtable*, %_Main_vtable** %vtpm.16
	%vtpm.18 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.17, i32 0, i32 8
	%tmp.1 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.18
	%vtpm.19 = call %Main*(%Main*, i32 ) %tmp.1( %Main* %vtpm.14, i32 %vtpm.13 )
	%vtpm.20 = load %Main*, %Main** %vtpm.7
	%vtpm.21 = bitcast %Main* %vtpm.20 to %Object*
	ret %Object* %vtpm.21

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.23 = alloca %Main*
	%vtpm.24 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.25 = load i32, i32* %vtpm.24
	%vtpm.26 = call i8*(i32 ) @malloc( i32 %vtpm.25 )
	%vtpm.27 = bitcast i8* %vtpm.26 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.27, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.28 = getelementptr %Main, %Main* %vtpm.27, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.28
	store %Main* %vtpm.27, %Main** %vtpm.23
	ret %Main* %vtpm.27

abort:
	call void @abort(  )
	unreachable
}

define i32 @Beta_bugger(%Beta* %self) {

entry:
	%vtpm.30 = alloca %Beta*
	store %Beta* %self, %Beta** %vtpm.30
	ret i32 57

abort:
	call void @abort(  )
	unreachable
}

define i32 @Beta_niam(%Beta* %self) {

entry:
	%vtpm.32 = alloca %Beta*
	store %Beta* %self, %Beta** %vtpm.32
	ret i32 42

abort:
	call void @abort(  )
	unreachable
}

define %Beta* @Beta_new() {

entry:
	%vtpm.34 = alloca %Beta*
	%vtpm.35 = getelementptr %_Beta_vtable, %_Beta_vtable* @_Beta_vtable_prototype, i32 0, i32 1
	%vtpm.36 = load i32, i32* %vtpm.35
	%vtpm.37 = call i8*(i32 ) @malloc( i32 %vtpm.36 )
	%vtpm.38 = bitcast i8* %vtpm.37 to %Beta*
	%malloc.null = icmp eq %Beta* %vtpm.38, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.39 = getelementptr %Beta, %Beta* %vtpm.38, i32 0, i32 0
	store %_Beta_vtable* @_Beta_vtable_prototype, %_Beta_vtable** %vtpm.39
	store %Beta* %vtpm.38, %Beta** %vtpm.34
	ret %Beta* %vtpm.38

abort:
	call void @abort(  )
	unreachable
}

define i32 @Alpha_niam(%Alpha* %self) {

entry:
	%vtpm.41 = alloca %Alpha*
	store %Alpha* %self, %Alpha** %vtpm.41
	ret i32 90

abort:
	call void @abort(  )
	unreachable
}

define %Alpha* @Alpha_new() {

entry:
	%vtpm.43 = alloca %Alpha*
	%vtpm.44 = getelementptr %_Alpha_vtable, %_Alpha_vtable* @_Alpha_vtable_prototype, i32 0, i32 1
	%vtpm.45 = load i32, i32* %vtpm.44
	%vtpm.46 = call i8*(i32 ) @malloc( i32 %vtpm.45 )
	%vtpm.47 = bitcast i8* %vtpm.46 to %Alpha*
	%malloc.null = icmp eq %Alpha* %vtpm.47, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.48 = getelementptr %Alpha, %Alpha* %vtpm.47, i32 0, i32 0
	store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.48
	store %Alpha* %vtpm.47, %Alpha** %vtpm.43
	ret %Alpha* %vtpm.47

abort:
	call void @abort(  )
	unreachable
}

