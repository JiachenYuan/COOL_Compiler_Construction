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
	%A*,
	%B*,
	%C*
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
	i32 (%A*) *
}

@_A_vtable_prototype = constant %_A_vtable {
	i32 6,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%A*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A*) *),
	%String* (%A*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A*) *),
	%A* (%A*) * bitcast (%Object* (%Object*) * @Object_copy to %A* (%A*) *),
	i32 (%A*) * @A_f
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
	i32 (%B*) *
}

@_B_vtable_prototype = constant %_B_vtable {
	i32 7,
	i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0),
	%B* () * @B_new,
	%Object* (%B*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%B*) *),
	%String* (%B*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%B*) *),
	%B* (%B*) * bitcast (%Object* (%Object*) * @Object_copy to %B* (%B*) *),
	i32 (%B*) * bitcast (i32 (%A*) * @A_f to i32 (%B*) *)
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
	%C* (%C*) *,
	i32 (%C*) *
}

@_C_vtable_prototype = constant %_C_vtable {
	i32 8,
	i32 ptrtoint (%C* getelementptr (%C, %C* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.C, i32 0, i32 0),
	%C* () * @C_new,
	%Object* (%C*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%C*) *),
	%String* (%C*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%C*) *),
	%C* (%C*) * bitcast (%Object* (%Object*) * @Object_copy to %C* (%C*) *),
	i32 (%C*) * @C_f
}

@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.0 = internal constant [15 x i8] c"dispatch5_o.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([15 x i8], [15 x i8]* @global_str.0, i32 0, i32 0)
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
	store %Main* %self, %Main** %vtpm.0
	%vtpm.1 = load %Main*, %Main** %vtpm.0
	%vtpm.2 = getelementptr %Main, %Main* %vtpm.1, i32 0, i32 1
	%vtpm.3 = load %A*, %A** %vtpm.2
	%vtpm.4 = icmp eq %A* %vtpm.3, null
	br i1 %vtpm.4, label %abort, label %ok.0

ok.0:
	%vtpm.5 = getelementptr %A, %A* %vtpm.3, i32 0, i32 0
	%vtpm.6 = load %_A_vtable*, %_A_vtable** %vtpm.5
	%vtpm.7 = getelementptr %_A_vtable, %_A_vtable* %vtpm.6, i32 0, i32 7
	%tmp.0 = load i32 (%A*) *, i32 (%A*) ** %vtpm.7
	%vtpm.8 = call i32(%A* ) %tmp.0( %A* %vtpm.3 )
	%vtpm.9 = load %Main*, %Main** %vtpm.0
	%vtpm.10 = icmp eq %Main* %vtpm.9, null
	br i1 %vtpm.10, label %abort, label %ok.1

ok.1:
	%vtpm.11 = getelementptr %Main, %Main* %vtpm.9, i32 0, i32 0
	%vtpm.12 = load %_Main_vtable*, %_Main_vtable** %vtpm.11
	%vtpm.13 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.12, i32 0, i32 8
	%tmp.1 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.13
	%vtpm.14 = call %Main*(%Main*, i32 ) %tmp.1( %Main* %vtpm.9, i32 %vtpm.8 )
	%vtpm.15 = load %Main*, %Main** %vtpm.0
	%vtpm.16 = getelementptr %Main, %Main* %vtpm.15, i32 0, i32 2
	%vtpm.17 = load %A*, %A** %vtpm.16
	%vtpm.18 = icmp eq %A* %vtpm.17, null
	br i1 %vtpm.18, label %abort, label %ok.2

ok.2:
	%vtpm.19 = getelementptr %A, %A* %vtpm.17, i32 0, i32 0
	%vtpm.20 = load %_A_vtable*, %_A_vtable** %vtpm.19
	%vtpm.21 = getelementptr %_A_vtable, %_A_vtable* %vtpm.20, i32 0, i32 7
	%tmp.2 = load i32 (%A*) *, i32 (%A*) ** %vtpm.21
	%vtpm.22 = call i32(%A* ) %tmp.2( %A* %vtpm.17 )
	%vtpm.23 = load %Main*, %Main** %vtpm.0
	%vtpm.24 = icmp eq %Main* %vtpm.23, null
	br i1 %vtpm.24, label %abort, label %ok.3

ok.3:
	%vtpm.25 = getelementptr %Main, %Main* %vtpm.23, i32 0, i32 0
	%vtpm.26 = load %_Main_vtable*, %_Main_vtable** %vtpm.25
	%vtpm.27 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.26, i32 0, i32 8
	%tmp.3 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.27
	%vtpm.28 = call %Main*(%Main*, i32 ) %tmp.3( %Main* %vtpm.23, i32 %vtpm.22 )
	%vtpm.29 = load %Main*, %Main** %vtpm.0
	%vtpm.30 = getelementptr %Main, %Main* %vtpm.29, i32 0, i32 3
	%vtpm.31 = load %A*, %A** %vtpm.30
	%vtpm.32 = icmp eq %A* %vtpm.31, null
	br i1 %vtpm.32, label %abort, label %ok.4

ok.4:
	%vtpm.33 = getelementptr %A, %A* %vtpm.31, i32 0, i32 0
	%vtpm.34 = load %_A_vtable*, %_A_vtable** %vtpm.33
	%vtpm.35 = getelementptr %_A_vtable, %_A_vtable* %vtpm.34, i32 0, i32 7
	%tmp.4 = load i32 (%A*) *, i32 (%A*) ** %vtpm.35
	%vtpm.36 = call i32(%A* ) %tmp.4( %A* %vtpm.31 )
	%vtpm.37 = load %Main*, %Main** %vtpm.0
	%vtpm.38 = icmp eq %Main* %vtpm.37, null
	br i1 %vtpm.38, label %abort, label %ok.5

ok.5:
	%vtpm.39 = getelementptr %Main, %Main* %vtpm.37, i32 0, i32 0
	%vtpm.40 = load %_Main_vtable*, %_Main_vtable** %vtpm.39
	%vtpm.41 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.40, i32 0, i32 8
	%tmp.5 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.41
	%vtpm.42 = call %Main*(%Main*, i32 ) %tmp.5( %Main* %vtpm.37, i32 %vtpm.36 )
	%vtpm.43 = load %Main*, %Main** %vtpm.0
	%vtpm.44 = getelementptr %Main, %Main* %vtpm.43, i32 0, i32 5
	%vtpm.45 = load %C*, %C** %vtpm.44
	%vtpm.46 = icmp eq %C* %vtpm.45, null
	br i1 %vtpm.46, label %abort, label %ok.6

ok.6:
	%vtpm.47 = getelementptr %C, %C* %vtpm.45, i32 0, i32 0
	%vtpm.48 = load %_C_vtable*, %_C_vtable** %vtpm.47
	%vtpm.49 = getelementptr %_C_vtable, %_C_vtable* %vtpm.48, i32 0, i32 7
	%tmp.6 = load i32 (%C*) *, i32 (%C*) ** %vtpm.49
	%vtpm.50 = call i32(%C* ) %tmp.6( %C* %vtpm.45 )
	%vtpm.51 = load %Main*, %Main** %vtpm.0
	%vtpm.52 = icmp eq %Main* %vtpm.51, null
	br i1 %vtpm.52, label %abort, label %ok.7

ok.7:
	%vtpm.53 = getelementptr %Main, %Main* %vtpm.51, i32 0, i32 0
	%vtpm.54 = load %_Main_vtable*, %_Main_vtable** %vtpm.53
	%vtpm.55 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.54, i32 0, i32 8
	%tmp.7 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.55
	%vtpm.56 = call %Main*(%Main*, i32 ) %tmp.7( %Main* %vtpm.51, i32 %vtpm.50 )
	%vtpm.57 = load %Main*, %Main** %vtpm.0
	%vtpm.58 = getelementptr %Main, %Main* %vtpm.57, i32 0, i32 5
	%vtpm.59 = load %C*, %C** %vtpm.58
	%vtpm.60 = icmp eq %C* %vtpm.59, null
	br i1 %vtpm.60, label %abort, label %ok.8

ok.8:
	%vtpm.61 = getelementptr %_C_vtable, %_C_vtable* @_C_vtable_prototype, i32 0, i32 7
	%tmp.8 = load i32 (%C*) *, i32 (%C*) ** %vtpm.61
	%vtpm.62 = call i32(%C* ) %tmp.8( %C* %vtpm.59 )
	%vtpm.63 = load %Main*, %Main** %vtpm.0
	%vtpm.64 = icmp eq %Main* %vtpm.63, null
	br i1 %vtpm.64, label %abort, label %ok.9

ok.9:
	%vtpm.65 = getelementptr %Main, %Main* %vtpm.63, i32 0, i32 0
	%vtpm.66 = load %_Main_vtable*, %_Main_vtable** %vtpm.65
	%vtpm.67 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.66, i32 0, i32 8
	%tmp.9 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.67
	%vtpm.68 = call %Main*(%Main*, i32 ) %tmp.9( %Main* %vtpm.63, i32 %vtpm.62 )
	%vtpm.69 = load %Main*, %Main** %vtpm.0
	%vtpm.70 = getelementptr %Main, %Main* %vtpm.69, i32 0, i32 5
	%vtpm.71 = load %C*, %C** %vtpm.70
	%vtpm.72 = icmp eq %C* %vtpm.71, null
	br i1 %vtpm.72, label %abort, label %ok.10

ok.10:
	%vtpm.73 = getelementptr %_B_vtable, %_B_vtable* @_B_vtable_prototype, i32 0, i32 7
	%tmp.10 = load i32 (%B*) *, i32 (%B*) ** %vtpm.73
	%vtpm.74 = bitcast %C* %vtpm.71 to %B*
	%vtpm.75 = call i32(%B* ) %tmp.10( %B* %vtpm.74 )
	%vtpm.76 = load %Main*, %Main** %vtpm.0
	%vtpm.77 = icmp eq %Main* %vtpm.76, null
	br i1 %vtpm.77, label %abort, label %ok.11

ok.11:
	%vtpm.78 = getelementptr %Main, %Main* %vtpm.76, i32 0, i32 0
	%vtpm.79 = load %_Main_vtable*, %_Main_vtable** %vtpm.78
	%vtpm.80 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.79, i32 0, i32 8
	%tmp.11 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.80
	%vtpm.81 = call %Main*(%Main*, i32 ) %tmp.11( %Main* %vtpm.76, i32 %vtpm.75 )
	%vtpm.82 = load %Main*, %Main** %vtpm.0
	%vtpm.83 = getelementptr %Main, %Main* %vtpm.82, i32 0, i32 5
	%vtpm.84 = load %C*, %C** %vtpm.83
	%vtpm.85 = icmp eq %C* %vtpm.84, null
	br i1 %vtpm.85, label %abort, label %ok.12

ok.12:
	%vtpm.86 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 7
	%tmp.12 = load i32 (%A*) *, i32 (%A*) ** %vtpm.86
	%vtpm.87 = bitcast %C* %vtpm.84 to %A*
	%vtpm.88 = call i32(%A* ) %tmp.12( %A* %vtpm.87 )
	%vtpm.89 = load %Main*, %Main** %vtpm.0
	%vtpm.90 = icmp eq %Main* %vtpm.89, null
	br i1 %vtpm.90, label %abort, label %ok.13

ok.13:
	%vtpm.91 = getelementptr %Main, %Main* %vtpm.89, i32 0, i32 0
	%vtpm.92 = load %_Main_vtable*, %_Main_vtable** %vtpm.91
	%vtpm.93 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.92, i32 0, i32 8
	%tmp.13 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.93
	%vtpm.94 = call %Main*(%Main*, i32 ) %tmp.13( %Main* %vtpm.89, i32 %vtpm.88 )
	%vtpm.95 = load %Main*, %Main** %vtpm.0
	%vtpm.96 = getelementptr %Main, %Main* %vtpm.95, i32 0, i32 4
	%vtpm.97 = load %B*, %B** %vtpm.96
	%vtpm.98 = icmp eq %B* %vtpm.97, null
	br i1 %vtpm.98, label %abort, label %ok.14

ok.14:
	%vtpm.99 = getelementptr %B, %B* %vtpm.97, i32 0, i32 0
	%vtpm.100 = load %_B_vtable*, %_B_vtable** %vtpm.99
	%vtpm.101 = getelementptr %_B_vtable, %_B_vtable* %vtpm.100, i32 0, i32 7
	%tmp.14 = load i32 (%B*) *, i32 (%B*) ** %vtpm.101
	%vtpm.102 = call i32(%B* ) %tmp.14( %B* %vtpm.97 )
	%vtpm.103 = load %Main*, %Main** %vtpm.0
	%vtpm.104 = icmp eq %Main* %vtpm.103, null
	br i1 %vtpm.104, label %abort, label %ok.15

ok.15:
	%vtpm.105 = getelementptr %Main, %Main* %vtpm.103, i32 0, i32 0
	%vtpm.106 = load %_Main_vtable*, %_Main_vtable** %vtpm.105
	%vtpm.107 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.106, i32 0, i32 8
	%tmp.15 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.107
	%vtpm.108 = call %Main*(%Main*, i32 ) %tmp.15( %Main* %vtpm.103, i32 %vtpm.102 )
	%vtpm.109 = load %Main*, %Main** %vtpm.0
	%vtpm.110 = getelementptr %Main, %Main* %vtpm.109, i32 0, i32 4
	%vtpm.111 = load %B*, %B** %vtpm.110
	%vtpm.112 = icmp eq %B* %vtpm.111, null
	br i1 %vtpm.112, label %abort, label %ok.16

ok.16:
	%vtpm.113 = getelementptr %_B_vtable, %_B_vtable* @_B_vtable_prototype, i32 0, i32 7
	%tmp.16 = load i32 (%B*) *, i32 (%B*) ** %vtpm.113
	%vtpm.114 = call i32(%B* ) %tmp.16( %B* %vtpm.111 )
	%vtpm.115 = load %Main*, %Main** %vtpm.0
	%vtpm.116 = icmp eq %Main* %vtpm.115, null
	br i1 %vtpm.116, label %abort, label %ok.17

ok.17:
	%vtpm.117 = getelementptr %Main, %Main* %vtpm.115, i32 0, i32 0
	%vtpm.118 = load %_Main_vtable*, %_Main_vtable** %vtpm.117
	%vtpm.119 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.118, i32 0, i32 8
	%tmp.17 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.119
	%vtpm.120 = call %Main*(%Main*, i32 ) %tmp.17( %Main* %vtpm.115, i32 %vtpm.114 )
	%vtpm.121 = load %Main*, %Main** %vtpm.0
	%vtpm.122 = getelementptr %Main, %Main* %vtpm.121, i32 0, i32 4
	%vtpm.123 = load %B*, %B** %vtpm.122
	%vtpm.124 = icmp eq %B* %vtpm.123, null
	br i1 %vtpm.124, label %abort, label %ok.18

ok.18:
	%vtpm.125 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 7
	%tmp.18 = load i32 (%A*) *, i32 (%A*) ** %vtpm.125
	%vtpm.126 = bitcast %B* %vtpm.123 to %A*
	%vtpm.127 = call i32(%A* ) %tmp.18( %A* %vtpm.126 )
	%vtpm.128 = load %Main*, %Main** %vtpm.0
	%vtpm.129 = icmp eq %Main* %vtpm.128, null
	br i1 %vtpm.129, label %abort, label %ok.19

ok.19:
	%vtpm.130 = getelementptr %Main, %Main* %vtpm.128, i32 0, i32 0
	%vtpm.131 = load %_Main_vtable*, %_Main_vtable** %vtpm.130
	%vtpm.132 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.131, i32 0, i32 8
	%tmp.19 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.132
	%vtpm.133 = call %Main*(%Main*, i32 ) %tmp.19( %Main* %vtpm.128, i32 %vtpm.127 )
	%vtpm.134 = load %Main*, %Main** %vtpm.0
	%vtpm.135 = getelementptr %Main, %Main* %vtpm.134, i32 0, i32 1
	%vtpm.136 = load %A*, %A** %vtpm.135
	%vtpm.137 = icmp eq %A* %vtpm.136, null
	br i1 %vtpm.137, label %abort, label %ok.20

ok.20:
	%vtpm.138 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 7
	%tmp.20 = load i32 (%A*) *, i32 (%A*) ** %vtpm.138
	%vtpm.139 = call i32(%A* ) %tmp.20( %A* %vtpm.136 )
	%vtpm.140 = load %Main*, %Main** %vtpm.0
	%vtpm.141 = icmp eq %Main* %vtpm.140, null
	br i1 %vtpm.141, label %abort, label %ok.21

ok.21:
	%vtpm.142 = getelementptr %Main, %Main* %vtpm.140, i32 0, i32 0
	%vtpm.143 = load %_Main_vtable*, %_Main_vtable** %vtpm.142
	%vtpm.144 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.143, i32 0, i32 8
	%tmp.21 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.144
	%vtpm.145 = call %Main*(%Main*, i32 ) %tmp.21( %Main* %vtpm.140, i32 %vtpm.139 )
	ret %Main* %vtpm.145

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.147 = alloca %Main*
	%vtpm.148 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.149 = load i32, i32* %vtpm.148
	%vtpm.150 = call i8*(i32 ) @malloc( i32 %vtpm.149 )
	%vtpm.151 = bitcast i8* %vtpm.150 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.151, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.152 = getelementptr %Main, %Main* %vtpm.151, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.152
	store %Main* %vtpm.151, %Main** %vtpm.147
	%vtpm.153 = getelementptr %Main, %Main* %vtpm.151, i32 0, i32 1
	store %A* null, %A** %vtpm.153
	%vtpm.154 = getelementptr %Main, %Main* %vtpm.151, i32 0, i32 2
	store %A* null, %A** %vtpm.154
	%vtpm.155 = getelementptr %Main, %Main* %vtpm.151, i32 0, i32 3
	store %A* null, %A** %vtpm.155
	%vtpm.156 = getelementptr %Main, %Main* %vtpm.151, i32 0, i32 4
	store %B* null, %B** %vtpm.156
	%vtpm.157 = getelementptr %Main, %Main* %vtpm.151, i32 0, i32 5
	store %C* null, %C** %vtpm.157
	%vtpm.158 = getelementptr %Main, %Main* %vtpm.151, i32 0, i32 1
	%vtpm.159 = call %A* @A_new(  )
	%vtpm.160 = load %Main*, %Main** %vtpm.147
	%vtpm.161 = getelementptr %Main, %Main* %vtpm.160, i32 0, i32 1
	store %A* %vtpm.159, %A** %vtpm.161
	%vtpm.162 = getelementptr %Main, %Main* %vtpm.151, i32 0, i32 2
	%vtpm.163 = call %B* @B_new(  )
	%vtpm.164 = load %Main*, %Main** %vtpm.147
	%vtpm.165 = getelementptr %Main, %Main* %vtpm.164, i32 0, i32 2
	%vtpm.166 = bitcast %B* %vtpm.163 to %A*
	store %A* %vtpm.166, %A** %vtpm.165
	%vtpm.167 = getelementptr %Main, %Main* %vtpm.151, i32 0, i32 3
	%vtpm.168 = call %C* @C_new(  )
	%vtpm.169 = load %Main*, %Main** %vtpm.147
	%vtpm.170 = getelementptr %Main, %Main* %vtpm.169, i32 0, i32 3
	%vtpm.171 = bitcast %C* %vtpm.168 to %A*
	store %A* %vtpm.171, %A** %vtpm.170
	%vtpm.172 = getelementptr %Main, %Main* %vtpm.151, i32 0, i32 4
	%vtpm.173 = call %B* @B_new(  )
	%vtpm.174 = load %Main*, %Main** %vtpm.147
	%vtpm.175 = getelementptr %Main, %Main* %vtpm.174, i32 0, i32 4
	store %B* %vtpm.173, %B** %vtpm.175
	%vtpm.176 = getelementptr %Main, %Main* %vtpm.151, i32 0, i32 5
	%vtpm.177 = call %C* @C_new(  )
	%vtpm.178 = load %Main*, %Main** %vtpm.147
	%vtpm.179 = getelementptr %Main, %Main* %vtpm.178, i32 0, i32 5
	store %C* %vtpm.177, %C** %vtpm.179
	ret %Main* %vtpm.151

abort:
	call void @abort(  )
	unreachable
}

define i32 @A_f(%A* %self) {

entry:
	%vtpm.181 = alloca %A*
	store %A* %self, %A** %vtpm.181
	ret i32 5

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%vtpm.183 = alloca %A*
	%vtpm.184 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%vtpm.185 = load i32, i32* %vtpm.184
	%vtpm.186 = call i8*(i32 ) @malloc( i32 %vtpm.185 )
	%vtpm.187 = bitcast i8* %vtpm.186 to %A*
	%malloc.null = icmp eq %A* %vtpm.187, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.188 = getelementptr %A, %A* %vtpm.187, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.188
	store %A* %vtpm.187, %A** %vtpm.183
	ret %A* %vtpm.187

abort:
	call void @abort(  )
	unreachable
}

define %B* @B_new() {

entry:
	%vtpm.190 = alloca %B*
	%vtpm.191 = getelementptr %_B_vtable, %_B_vtable* @_B_vtable_prototype, i32 0, i32 1
	%vtpm.192 = load i32, i32* %vtpm.191
	%vtpm.193 = call i8*(i32 ) @malloc( i32 %vtpm.192 )
	%vtpm.194 = bitcast i8* %vtpm.193 to %B*
	%malloc.null = icmp eq %B* %vtpm.194, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.195 = getelementptr %B, %B* %vtpm.194, i32 0, i32 0
	store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.195
	store %B* %vtpm.194, %B** %vtpm.190
	ret %B* %vtpm.194

abort:
	call void @abort(  )
	unreachable
}

define i32 @C_f(%C* %self) {

entry:
	%vtpm.197 = alloca %C*
	store %C* %self, %C** %vtpm.197
	ret i32 6

abort:
	call void @abort(  )
	unreachable
}

define %C* @C_new() {

entry:
	%vtpm.199 = alloca %C*
	%vtpm.200 = getelementptr %_C_vtable, %_C_vtable* @_C_vtable_prototype, i32 0, i32 1
	%vtpm.201 = load i32, i32* %vtpm.200
	%vtpm.202 = call i8*(i32 ) @malloc( i32 %vtpm.201 )
	%vtpm.203 = bitcast i8* %vtpm.202 to %C*
	%malloc.null = icmp eq %C* %vtpm.203, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.204 = getelementptr %C, %C* %vtpm.203, i32 0, i32 0
	store %_C_vtable* @_C_vtable_prototype, %_C_vtable** %vtpm.204
	store %C* %vtpm.203, %C** %vtpm.199
	ret %C* %vtpm.203

abort:
	call void @abort(  )
	unreachable
}

