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
	%Object*
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

@global_str.9 = internal constant [15 x i8] c"\22abc\22 = \22bbc\22\0A\00"
@String.9 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([15 x i8], [15 x i8]* @global_str.9, i32 0, i32 0)
}

@global_str.8 = internal constant [4 x i8] c"bbc\00"
@String.8 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([4 x i8], [4 x i8]* @global_str.8, i32 0, i32 0)
}

@global_str.10 = internal constant [16 x i8] c"\22abc\22 != \22bbc\22\0A\00"
@String.10 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([16 x i8], [16 x i8]* @global_str.10, i32 0, i32 0)
}

@global_str.7 = internal constant [4 x i8] c"abc\00"
@String.7 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([4 x i8], [4 x i8]* @global_str.7, i32 0, i32 0)
}

@global_str.6 = internal constant [15 x i8] c"true != false\0A\00"
@String.6 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([15 x i8], [15 x i8]* @global_str.6, i32 0, i32 0)
}

@global_str.5 = internal constant [14 x i8] c"true = false\0A\00"
@String.5 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.5, i32 0, i32 0)
}

@global_str.4 = internal constant [8 x i8] c"1 != 0\0A\00"
@String.4 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @global_str.4, i32 0, i32 0)
}

@global_str.3 = internal constant [7 x i8] c"1 = 0\0A\00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([7 x i8], [7 x i8]* @global_str.3, i32 0, i32 0)
}

@global_str.2 = internal constant [13 x i8] c"self != obj\0A\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @global_str.2, i32 0, i32 0)
}

@global_str.1 = internal constant [12 x i8] c"self = obj\0A\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([12 x i8], [12 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.11 = internal constant [14 x i8] c"<basic class>\00"
@String.11 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.11, i32 0, i32 0)
}

@global_str.0 = internal constant [11 x i8] c"checkeq.cl\00"
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
	%vtpm.0 = alloca %Main*
	%vtpm.1 = alloca %Main*
	%vtpm.2 = alloca %Main*
	%vtpm.3 = alloca %Main*
	%vtpm.4 = alloca %Main*
	store %Main* %self, %Main** %vtpm.4
	%vtpm.5 = load %Main*, %Main** %vtpm.4
	%vtpm.6 = load %Main*, %Main** %vtpm.4
	%vtpm.7 = getelementptr %Main, %Main* %vtpm.6, i32 0, i32 1
	%vtpm.8 = load %Object*, %Object** %vtpm.7
	%vtpm.9 = bitcast %Main* %vtpm.5 to i8*
	%vtpm.10 = bitcast %Object* %vtpm.8 to i8*
	%vtpm.11 = icmp eq i8* %vtpm.9, %vtpm.10
	br i1 %vtpm.11, label %true.0, label %false.0

true.0:
	%vtpm.12 = load %Main*, %Main** %vtpm.4
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
	%vtpm.18 = load %Main*, %Main** %vtpm.4
	%vtpm.19 = icmp eq %Main* %vtpm.18, null
	br i1 %vtpm.19, label %abort, label %ok.1

ok.1:
	%vtpm.20 = getelementptr %Main, %Main* %vtpm.18, i32 0, i32 0
	%vtpm.21 = load %_Main_vtable*, %_Main_vtable** %vtpm.20
	%vtpm.22 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.21, i32 0, i32 7
	%tmp.1 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.22
	%vtpm.23 = call %Main*(%Main*, %String* ) %tmp.1( %Main* %vtpm.18, %String* @String.2 )
	store %Main* %vtpm.23, %Main** %vtpm.0
	br label %end.0

end.0:
	%vtpm.24 = load %Main*, %Main** %vtpm.0
	%vtpm.25 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.25, i32 1 )
	%vtpm.27 = bitcast %Int* %vtpm.25 to i8*
	%vtpm.28 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.28, i32 0 )
	%vtpm.30 = bitcast %Int* %vtpm.28 to i8*
	%vtpm.31 = icmp eq i8* %vtpm.27, %vtpm.30
	br i1 %vtpm.31, label %true.1, label %false.1

true.1:
	%vtpm.32 = load %Main*, %Main** %vtpm.4
	%vtpm.33 = icmp eq %Main* %vtpm.32, null
	br i1 %vtpm.33, label %abort, label %ok.2

ok.2:
	%vtpm.34 = getelementptr %Main, %Main* %vtpm.32, i32 0, i32 0
	%vtpm.35 = load %_Main_vtable*, %_Main_vtable** %vtpm.34
	%vtpm.36 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.35, i32 0, i32 7
	%tmp.2 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.36
	%vtpm.37 = call %Main*(%Main*, %String* ) %tmp.2( %Main* %vtpm.32, %String* @String.3 )
	store %Main* %vtpm.37, %Main** %vtpm.1
	br label %end.1

false.1:
	%vtpm.38 = load %Main*, %Main** %vtpm.4
	%vtpm.39 = icmp eq %Main* %vtpm.38, null
	br i1 %vtpm.39, label %abort, label %ok.3

ok.3:
	%vtpm.40 = getelementptr %Main, %Main* %vtpm.38, i32 0, i32 0
	%vtpm.41 = load %_Main_vtable*, %_Main_vtable** %vtpm.40
	%vtpm.42 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.41, i32 0, i32 7
	%tmp.3 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.42
	%vtpm.43 = call %Main*(%Main*, %String* ) %tmp.3( %Main* %vtpm.38, %String* @String.4 )
	store %Main* %vtpm.43, %Main** %vtpm.1
	br label %end.1

end.1:
	%vtpm.44 = load %Main*, %Main** %vtpm.1
	%vtpm.45 = call %Bool* @Bool_new(  )
	call void(%Bool*, i1 ) @Bool_init( %Bool* %vtpm.45, i1 true )
	%vtpm.47 = bitcast %Bool* %vtpm.45 to i8*
	%vtpm.48 = call %Bool* @Bool_new(  )
	call void(%Bool*, i1 ) @Bool_init( %Bool* %vtpm.48, i1 false )
	%vtpm.50 = bitcast %Bool* %vtpm.48 to i8*
	%vtpm.51 = icmp eq i8* %vtpm.47, %vtpm.50
	br i1 %vtpm.51, label %true.2, label %false.2

true.2:
	%vtpm.52 = load %Main*, %Main** %vtpm.4
	%vtpm.53 = icmp eq %Main* %vtpm.52, null
	br i1 %vtpm.53, label %abort, label %ok.4

ok.4:
	%vtpm.54 = getelementptr %Main, %Main* %vtpm.52, i32 0, i32 0
	%vtpm.55 = load %_Main_vtable*, %_Main_vtable** %vtpm.54
	%vtpm.56 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.55, i32 0, i32 7
	%tmp.4 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.56
	%vtpm.57 = call %Main*(%Main*, %String* ) %tmp.4( %Main* %vtpm.52, %String* @String.5 )
	store %Main* %vtpm.57, %Main** %vtpm.2
	br label %end.2

false.2:
	%vtpm.58 = load %Main*, %Main** %vtpm.4
	%vtpm.59 = icmp eq %Main* %vtpm.58, null
	br i1 %vtpm.59, label %abort, label %ok.5

ok.5:
	%vtpm.60 = getelementptr %Main, %Main* %vtpm.58, i32 0, i32 0
	%vtpm.61 = load %_Main_vtable*, %_Main_vtable** %vtpm.60
	%vtpm.62 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.61, i32 0, i32 7
	%tmp.5 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.62
	%vtpm.63 = call %Main*(%Main*, %String* ) %tmp.5( %Main* %vtpm.58, %String* @String.6 )
	store %Main* %vtpm.63, %Main** %vtpm.2
	br label %end.2

end.2:
	%vtpm.64 = load %Main*, %Main** %vtpm.2
	%vtpm.65 = bitcast %String* @String.7 to i8*
	%vtpm.66 = bitcast %String* @String.8 to i8*
	%vtpm.67 = icmp eq i8* %vtpm.65, %vtpm.66
	br i1 %vtpm.67, label %true.3, label %false.3

true.3:
	%vtpm.68 = load %Main*, %Main** %vtpm.4
	%vtpm.69 = icmp eq %Main* %vtpm.68, null
	br i1 %vtpm.69, label %abort, label %ok.6

ok.6:
	%vtpm.70 = getelementptr %Main, %Main* %vtpm.68, i32 0, i32 0
	%vtpm.71 = load %_Main_vtable*, %_Main_vtable** %vtpm.70
	%vtpm.72 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.71, i32 0, i32 7
	%tmp.6 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.72
	%vtpm.73 = call %Main*(%Main*, %String* ) %tmp.6( %Main* %vtpm.68, %String* @String.9 )
	store %Main* %vtpm.73, %Main** %vtpm.3
	br label %end.3

false.3:
	%vtpm.74 = load %Main*, %Main** %vtpm.4
	%vtpm.75 = icmp eq %Main* %vtpm.74, null
	br i1 %vtpm.75, label %abort, label %ok.7

ok.7:
	%vtpm.76 = getelementptr %Main, %Main* %vtpm.74, i32 0, i32 0
	%vtpm.77 = load %_Main_vtable*, %_Main_vtable** %vtpm.76
	%vtpm.78 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.77, i32 0, i32 7
	%tmp.7 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.78
	%vtpm.79 = call %Main*(%Main*, %String* ) %tmp.7( %Main* %vtpm.74, %String* @String.10 )
	store %Main* %vtpm.79, %Main** %vtpm.3
	br label %end.3

end.3:
	%vtpm.80 = load %Main*, %Main** %vtpm.3
	%vtpm.81 = bitcast %Main* %vtpm.80 to %Object*
	ret %Object* %vtpm.81

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.83 = alloca %Main*
	%vtpm.84 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.85 = load i32, i32* %vtpm.84
	%vtpm.86 = call i8*(i32 ) @malloc( i32 %vtpm.85 )
	%vtpm.87 = bitcast i8* %vtpm.86 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.87, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.88 = getelementptr %Main, %Main* %vtpm.87, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.88
	store %Main* %vtpm.87, %Main** %vtpm.83
	%vtpm.89 = getelementptr %Main, %Main* %vtpm.87, i32 0, i32 1
	store %Object* null, %Object** %vtpm.89
	%vtpm.90 = getelementptr %Main, %Main* %vtpm.87, i32 0, i32 1
	store %Object* null, %Object** %vtpm.90
	ret %Main* %vtpm.87

abort:
	call void @abort(  )
	unreachable
}

