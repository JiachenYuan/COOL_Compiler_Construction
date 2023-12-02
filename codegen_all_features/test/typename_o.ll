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
	%String* (%Main*) *,
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
	%String* (%Main*) * @Main_func,
	%Object* (%Main*) * @Main_main
}

@str.Base = internal constant [5 x i8] c"Base\00"
%Base = type {
	%_Base_vtable*
}

%_Base_vtable = type {
	i32,
	i32,
	i8*,
	%Base* () *,
	%Object* (%Base*) *,
	%String* (%Base*) *,
	%Base* (%Base*) *,
	%String* (%Base*,%Object*,%String*) *,
	%String* (%Base*,%String*) *
}

@_Base_vtable_prototype = constant %_Base_vtable {
	i32 6,
	i32 ptrtoint (%Base* getelementptr (%Base, %Base* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Base, i32 0, i32 0),
	%Base* () * @Base_new,
	%Object* (%Base*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Base*) *),
	%String* (%Base*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Base*) *),
	%Base* (%Base*) * bitcast (%Object* (%Object*) * @Object_copy to %Base* (%Base*) *),
	%String* (%Base*,%Object*,%String*) * @Base_identify,
	%String* (%Base*,%String*) * @Base_test
}

@str.Derived = internal constant [8 x i8] c"Derived\00"
%Derived = type {
	%_Derived_vtable*
}

%_Derived_vtable = type {
	i32,
	i32,
	i8*,
	%Derived* () *,
	%Object* (%Derived*) *,
	%String* (%Derived*) *,
	%Derived* (%Derived*) *,
	%String* (%Derived*,%Object*,%String*) *,
	%String* (%Derived*,%String*) *
}

@_Derived_vtable_prototype = constant %_Derived_vtable {
	i32 7,
	i32 ptrtoint (%Derived* getelementptr (%Derived, %Derived* null, i32 1) to i32),
	i8* getelementptr ([8 x i8], [8 x i8]* @str.Derived, i32 0, i32 0),
	%Derived* () * @Derived_new,
	%Object* (%Derived*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Derived*) *),
	%String* (%Derived*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Derived*) *),
	%Derived* (%Derived*) * bitcast (%Object* (%Object*) * @Object_copy to %Derived* (%Derived*) *),
	%String* (%Derived*,%Object*,%String*) * bitcast (%String* (%Base*,%Object*,%String*) * @Base_identify to %String* (%Derived*,%Object*,%String*) *),
	%String* (%Derived*,%String*) * bitcast (%String* (%Base*,%String*) * @Base_test to %String* (%Derived*,%String*) *)
}

@global_str.3 = internal constant [14 x i8] c"<basic class>\00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.3, i32 0, i32 0)
}

@global_str.2 = internal constant [1 x i8] c"\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([1 x i8], [1 x i8]* @global_str.2, i32 0, i32 0)
}

@global_str.1 = internal constant [2 x i8] c"\0A\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.0 = internal constant [14 x i8] c"typename_o.cl\00"
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
define %String* @Main_func(%Main* %self) {

entry:
	%vtpm.0 = alloca %Main*
	store %Main* %self, %Main** %vtpm.0
	%vtpm.1 = call %Derived* @Derived_new(  )
	%vtpm.2 = icmp eq %Derived* %vtpm.1, null
	br i1 %vtpm.2, label %abort, label %ok.0

ok.0:
	%vtpm.3 = getelementptr %Derived, %Derived* %vtpm.1, i32 0, i32 0
	%vtpm.4 = load %_Derived_vtable*, %_Derived_vtable** %vtpm.3
	%vtpm.5 = getelementptr %_Derived_vtable, %_Derived_vtable* %vtpm.4, i32 0, i32 8
	%tmp.0 = load %String* (%Derived*,%String*) *, %String* (%Derived*,%String*) ** %vtpm.5
	%vtpm.6 = call %String*(%Derived*, %String* ) %tmp.0( %Derived* %vtpm.1, %String* @String.2 )
	ret %String* %vtpm.6

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Main_main(%Main* %self) {

entry:
	%vtpm.8 = alloca %Main*
	store %Main* %self, %Main** %vtpm.8
	%vtpm.9 = load %Main*, %Main** %vtpm.8
	%vtpm.10 = icmp eq %Main* %vtpm.9, null
	br i1 %vtpm.10, label %abort, label %ok.0

ok.0:
	%vtpm.11 = getelementptr %Main, %Main* %vtpm.9, i32 0, i32 0
	%vtpm.12 = load %_Main_vtable*, %_Main_vtable** %vtpm.11
	%vtpm.13 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.12, i32 0, i32 11
	%tmp.0 = load %String* (%Main*) *, %String* (%Main*) ** %vtpm.13
	%vtpm.14 = call %String*(%Main* ) %tmp.0( %Main* %vtpm.9 )
	%vtpm.15 = load %Main*, %Main** %vtpm.8
	%vtpm.16 = icmp eq %Main* %vtpm.15, null
	br i1 %vtpm.16, label %abort, label %ok.1

ok.1:
	%vtpm.17 = getelementptr %Main, %Main* %vtpm.15, i32 0, i32 0
	%vtpm.18 = load %_Main_vtable*, %_Main_vtable** %vtpm.17
	%vtpm.19 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.18, i32 0, i32 7
	%tmp.1 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.19
	%vtpm.20 = call %Main*(%Main*, %String* ) %tmp.1( %Main* %vtpm.15, %String* %vtpm.14 )
	%vtpm.21 = load %Main*, %Main** %vtpm.8
	%vtpm.22 = bitcast %Main* %vtpm.21 to %Object*
	ret %Object* %vtpm.22

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.24 = alloca %Main*
	%vtpm.25 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.26 = load i32, i32* %vtpm.25
	%vtpm.27 = call i8*(i32 ) @malloc( i32 %vtpm.26 )
	%vtpm.28 = bitcast i8* %vtpm.27 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.28, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.29 = getelementptr %Main, %Main* %vtpm.28, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.29
	store %Main* %vtpm.28, %Main** %vtpm.24
	ret %Main* %vtpm.28

abort:
	call void @abort(  )
	unreachable
}

define %String* @Base_identify(%Base* %self, %Object* %thing, %String* %s) {

entry:
	%vtpm.31 = alloca %Base*
	%vtpm.32 = alloca %Object*
	%vtpm.33 = alloca %String*
	store %Base* %self, %Base** %vtpm.31
	store %Object* %thing, %Object** %vtpm.32
	store %String* %s, %String** %vtpm.33
	%vtpm.34 = load %Object*, %Object** %vtpm.32
	%vtpm.35 = icmp eq %Object* %vtpm.34, null
	br i1 %vtpm.35, label %abort, label %ok.0

ok.0:
	%vtpm.36 = getelementptr %Object, %Object* %vtpm.34, i32 0, i32 0
	%vtpm.37 = load %_Object_vtable*, %_Object_vtable** %vtpm.36
	%vtpm.38 = getelementptr %_Object_vtable, %_Object_vtable* %vtpm.37, i32 0, i32 5
	%tmp.0 = load %String* (%Object*) *, %String* (%Object*) ** %vtpm.38
	%vtpm.39 = call %String*(%Object* ) %tmp.0( %Object* %vtpm.34 )
	%vtpm.40 = load %String*, %String** %vtpm.33
	%vtpm.41 = icmp eq %String* %vtpm.40, null
	br i1 %vtpm.41, label %abort, label %ok.1

ok.1:
	%vtpm.42 = getelementptr %String, %String* %vtpm.40, i32 0, i32 0
	%vtpm.43 = load %_String_vtable*, %_String_vtable** %vtpm.42
	%vtpm.44 = getelementptr %_String_vtable, %_String_vtable* %vtpm.43, i32 0, i32 8
	%tmp.1 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.44
	%vtpm.45 = call %String*(%String*, %String* ) %tmp.1( %String* %vtpm.40, %String* %vtpm.39 )
	%vtpm.46 = icmp eq %String* %vtpm.45, null
	br i1 %vtpm.46, label %abort, label %ok.2

ok.2:
	%vtpm.47 = getelementptr %String, %String* %vtpm.45, i32 0, i32 0
	%vtpm.48 = load %_String_vtable*, %_String_vtable** %vtpm.47
	%vtpm.49 = getelementptr %_String_vtable, %_String_vtable* %vtpm.48, i32 0, i32 8
	%tmp.2 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.49
	%vtpm.50 = call %String*(%String*, %String* ) %tmp.2( %String* %vtpm.45, %String* @String.1 )
	ret %String* %vtpm.50

abort:
	call void @abort(  )
	unreachable
}

define %String* @Base_test(%Base* %self, %String* %s) {

entry:
	%vtpm.52 = alloca %Base*
	%vtpm.53 = alloca %Base*
	%vtpm.54 = alloca %String*
	store %Base* %self, %Base** %vtpm.53
	store %String* %s, %String** %vtpm.54
	%vtpm.55 = call %Main* @Main_new(  )
	%vtpm.56 = load %String*, %String** %vtpm.54
	%vtpm.57 = load %Base*, %Base** %vtpm.53
	%vtpm.58 = icmp eq %Base* %vtpm.57, null
	br i1 %vtpm.58, label %abort, label %ok.0

ok.0:
	%vtpm.59 = getelementptr %Base, %Base* %vtpm.57, i32 0, i32 0
	%vtpm.60 = load %_Base_vtable*, %_Base_vtable** %vtpm.59
	%vtpm.61 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.60, i32 0, i32 7
	%tmp.0 = load %String* (%Base*,%Object*,%String*) *, %String* (%Base*,%Object*,%String*) ** %vtpm.61
	%vtpm.62 = bitcast %Main* %vtpm.55 to %Object*
	%vtpm.63 = call %String*(%Base*, %Object*, %String* ) %tmp.0( %Base* %vtpm.57, %Object* %vtpm.62, %String* %vtpm.56 )
	%vtpm.64 = call %Derived* @Derived_new(  )
	%vtpm.65 = load %String*, %String** %vtpm.54
	%vtpm.66 = load %Base*, %Base** %vtpm.53
	%vtpm.67 = icmp eq %Base* %vtpm.66, null
	br i1 %vtpm.67, label %abort, label %ok.1

ok.1:
	%vtpm.68 = getelementptr %Base, %Base* %vtpm.66, i32 0, i32 0
	%vtpm.69 = load %_Base_vtable*, %_Base_vtable** %vtpm.68
	%vtpm.70 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.69, i32 0, i32 7
	%tmp.1 = load %String* (%Base*,%Object*,%String*) *, %String* (%Base*,%Object*,%String*) ** %vtpm.70
	%vtpm.71 = bitcast %Derived* %vtpm.64 to %Object*
	%vtpm.72 = call %String*(%Base*, %Object*, %String* ) %tmp.1( %Base* %vtpm.66, %Object* %vtpm.71, %String* %vtpm.65 )
	%vtpm.73 = call %Base* @Base_new(  )
	%vtpm.74 = load %String*, %String** %vtpm.54
	%vtpm.75 = load %Base*, %Base** %vtpm.53
	%vtpm.76 = icmp eq %Base* %vtpm.75, null
	br i1 %vtpm.76, label %abort, label %ok.2

ok.2:
	%vtpm.77 = getelementptr %Base, %Base* %vtpm.75, i32 0, i32 0
	%vtpm.78 = load %_Base_vtable*, %_Base_vtable** %vtpm.77
	%vtpm.79 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.78, i32 0, i32 7
	%tmp.2 = load %String* (%Base*,%Object*,%String*) *, %String* (%Base*,%Object*,%String*) ** %vtpm.79
	%vtpm.80 = bitcast %Base* %vtpm.73 to %Object*
	%vtpm.81 = call %String*(%Base*, %Object*, %String* ) %tmp.2( %Base* %vtpm.75, %Object* %vtpm.80, %String* %vtpm.74 )
	%vtpm.82 = load %String*, %String** %vtpm.54
	%vtpm.83 = icmp eq %String* %vtpm.82, null
	br i1 %vtpm.83, label %abort, label %ok.3

ok.3:
	%vtpm.84 = getelementptr %String, %String* %vtpm.82, i32 0, i32 0
	%vtpm.85 = load %_String_vtable*, %_String_vtable** %vtpm.84
	%vtpm.86 = getelementptr %_String_vtable, %_String_vtable* %vtpm.85, i32 0, i32 8
	%tmp.3 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.86
	%vtpm.87 = call %String*(%String*, %String* ) %tmp.3( %String* %vtpm.82, %String* %vtpm.81 )
	%vtpm.88 = icmp eq %String* %vtpm.87, null
	br i1 %vtpm.88, label %abort, label %ok.4

ok.4:
	%vtpm.89 = getelementptr %String, %String* %vtpm.87, i32 0, i32 0
	%vtpm.90 = load %_String_vtable*, %_String_vtable** %vtpm.89
	%vtpm.91 = getelementptr %_String_vtable, %_String_vtable* %vtpm.90, i32 0, i32 8
	%tmp.4 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.91
	%vtpm.92 = call %String*(%String*, %String* ) %tmp.4( %String* %vtpm.87, %String* %vtpm.72 )
	%vtpm.93 = icmp eq %String* %vtpm.92, null
	br i1 %vtpm.93, label %abort, label %ok.5

ok.5:
	%vtpm.94 = getelementptr %String, %String* %vtpm.92, i32 0, i32 0
	%vtpm.95 = load %_String_vtable*, %_String_vtable** %vtpm.94
	%vtpm.96 = getelementptr %_String_vtable, %_String_vtable* %vtpm.95, i32 0, i32 8
	%tmp.5 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.96
	%vtpm.97 = call %String*(%String*, %String* ) %tmp.5( %String* %vtpm.92, %String* %vtpm.63 )
	store %String* %vtpm.97, %String** %vtpm.54
	%vtpm.98 = call %Derived* @Derived_new(  )
	%vtpm.99 = bitcast %Derived* %vtpm.98 to %Base*
	store %Base* %vtpm.99, %Base** %vtpm.52
	%vtpm.100 = load %Base*, %Base** %vtpm.52
	%vtpm.101 = load %String*, %String** %vtpm.54
	%vtpm.102 = load %Base*, %Base** %vtpm.53
	%vtpm.103 = icmp eq %Base* %vtpm.102, null
	br i1 %vtpm.103, label %abort, label %ok.6

ok.6:
	%vtpm.104 = getelementptr %Base, %Base* %vtpm.102, i32 0, i32 0
	%vtpm.105 = load %_Base_vtable*, %_Base_vtable** %vtpm.104
	%vtpm.106 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.105, i32 0, i32 7
	%tmp.6 = load %String* (%Base*,%Object*,%String*) *, %String* (%Base*,%Object*,%String*) ** %vtpm.106
	%vtpm.107 = bitcast %Base* %vtpm.100 to %Object*
	%vtpm.108 = call %String*(%Base*, %Object*, %String* ) %tmp.6( %Base* %vtpm.102, %Object* %vtpm.107, %String* %vtpm.101 )
	store %String* %vtpm.108, %String** %vtpm.54
	%vtpm.109 = load %Base*, %Base** %vtpm.53
	%vtpm.110 = load %String*, %String** %vtpm.54
	%vtpm.111 = load %Base*, %Base** %vtpm.53
	%vtpm.112 = icmp eq %Base* %vtpm.111, null
	br i1 %vtpm.112, label %abort, label %ok.7

ok.7:
	%vtpm.113 = getelementptr %Base, %Base* %vtpm.111, i32 0, i32 0
	%vtpm.114 = load %_Base_vtable*, %_Base_vtable** %vtpm.113
	%vtpm.115 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.114, i32 0, i32 7
	%tmp.7 = load %String* (%Base*,%Object*,%String*) *, %String* (%Base*,%Object*,%String*) ** %vtpm.115
	%vtpm.116 = bitcast %Base* %vtpm.109 to %Object*
	%vtpm.117 = call %String*(%Base*, %Object*, %String* ) %tmp.7( %Base* %vtpm.111, %Object* %vtpm.116, %String* %vtpm.110 )
	ret %String* %vtpm.117

abort:
	call void @abort(  )
	unreachable
}

define %Base* @Base_new() {

entry:
	%vtpm.119 = alloca %Base*
	%vtpm.120 = getelementptr %_Base_vtable, %_Base_vtable* @_Base_vtable_prototype, i32 0, i32 1
	%vtpm.121 = load i32, i32* %vtpm.120
	%vtpm.122 = call i8*(i32 ) @malloc( i32 %vtpm.121 )
	%vtpm.123 = bitcast i8* %vtpm.122 to %Base*
	%malloc.null = icmp eq %Base* %vtpm.123, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.124 = getelementptr %Base, %Base* %vtpm.123, i32 0, i32 0
	store %_Base_vtable* @_Base_vtable_prototype, %_Base_vtable** %vtpm.124
	store %Base* %vtpm.123, %Base** %vtpm.119
	ret %Base* %vtpm.123

abort:
	call void @abort(  )
	unreachable
}

define %Derived* @Derived_new() {

entry:
	%vtpm.126 = alloca %Derived*
	%vtpm.127 = getelementptr %_Derived_vtable, %_Derived_vtable* @_Derived_vtable_prototype, i32 0, i32 1
	%vtpm.128 = load i32, i32* %vtpm.127
	%vtpm.129 = call i8*(i32 ) @malloc( i32 %vtpm.128 )
	%vtpm.130 = bitcast i8* %vtpm.129 to %Derived*
	%malloc.null = icmp eq %Derived* %vtpm.130, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.131 = getelementptr %Derived, %Derived* %vtpm.130, i32 0, i32 0
	store %_Derived_vtable* @_Derived_vtable_prototype, %_Derived_vtable** %vtpm.131
	store %Derived* %vtpm.130, %Derived** %vtpm.126
	ret %Derived* %vtpm.130

abort:
	call void @abort(  )
	unreachable
}

