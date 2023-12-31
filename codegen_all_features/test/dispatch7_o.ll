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

@str.Foo = internal constant [4 x i8] c"Foo\00"
%Foo = type {
	%_Foo_vtable*
}

%_Foo_vtable = type {
	i32,
	i32,
	i8*,
	%Foo* () *,
	%Object* (%Foo*) *,
	%String* (%Foo*) *,
	%Foo* (%Foo*) *,
	%Foo* (%Foo*) *
}

@_Foo_vtable_prototype = constant %_Foo_vtable {
	i32 6,
	i32 ptrtoint (%Foo* getelementptr (%Foo, %Foo* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Foo, i32 0, i32 0),
	%Foo* () * @Foo_new,
	%Object* (%Foo*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Foo*) *),
	%String* (%Foo*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Foo*) *),
	%Foo* (%Foo*) * bitcast (%Object* (%Object*) * @Object_copy to %Foo* (%Foo*) *),
	%Foo* (%Foo*) * @Foo_a
}

@str.Bar = internal constant [4 x i8] c"Bar\00"
%Bar = type {
	%_Bar_vtable*
}

%_Bar_vtable = type {
	i32,
	i32,
	i8*,
	%Bar* () *,
	%Object* (%Bar*) *,
	%String* (%Bar*) *,
	%Bar* (%Bar*) *,
	%Bar* (%Bar*) *,
	i32 (%Bar*,i32) *
}

@_Bar_vtable_prototype = constant %_Bar_vtable {
	i32 7,
	i32 ptrtoint (%Bar* getelementptr (%Bar, %Bar* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Bar, i32 0, i32 0),
	%Bar* () * @Bar_new,
	%Object* (%Bar*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bar*) *),
	%String* (%Bar*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bar*) *),
	%Bar* (%Bar*) * bitcast (%Object* (%Object*) * @Object_copy to %Bar* (%Bar*) *),
	%Bar* (%Bar*) * @Bar_a,
	i32 (%Bar*,i32) * @Bar_b
}

@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.0 = internal constant [15 x i8] c"dispatch7_o.cl\00"
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
	%vtpm.1 = call %Bar* @Bar_new(  )
	%vtpm.2 = icmp eq %Bar* %vtpm.1, null
	br i1 %vtpm.2, label %abort, label %ok.0

ok.0:
	%vtpm.3 = getelementptr %_Foo_vtable, %_Foo_vtable* @_Foo_vtable_prototype, i32 0, i32 7
	%tmp.0 = load %Foo* (%Foo*) *, %Foo* (%Foo*) ** %vtpm.3
	%vtpm.4 = bitcast %Bar* %vtpm.1 to %Foo*
	%vtpm.5 = call %Foo*(%Foo* ) %tmp.0( %Foo* %vtpm.4 )
	%vtpm.6 = bitcast %Foo* %vtpm.5 to %Bar*
	%vtpm.7 = icmp eq %Bar* %vtpm.6, null
	br i1 %vtpm.7, label %abort, label %ok.1

ok.1:
	%vtpm.8 = getelementptr %Bar, %Bar* %vtpm.6, i32 0, i32 0
	%vtpm.9 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.8
	%vtpm.10 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.9, i32 0, i32 8
	%tmp.1 = load i32 (%Bar*,i32) *, i32 (%Bar*,i32) ** %vtpm.10
	%vtpm.11 = call i32(%Bar*, i32 ) %tmp.1( %Bar* %vtpm.6, i32 1 )
	%vtpm.12 = load %Main*, %Main** %vtpm.0
	%vtpm.13 = icmp eq %Main* %vtpm.12, null
	br i1 %vtpm.13, label %abort, label %ok.2

ok.2:
	%vtpm.14 = getelementptr %Main, %Main* %vtpm.12, i32 0, i32 0
	%vtpm.15 = load %_Main_vtable*, %_Main_vtable** %vtpm.14
	%vtpm.16 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.15, i32 0, i32 8
	%tmp.2 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.16
	%vtpm.17 = call %Main*(%Main*, i32 ) %tmp.2( %Main* %vtpm.12, i32 %vtpm.11 )
	%vtpm.18 = bitcast %Main* %vtpm.17 to %Object*
	ret %Object* %vtpm.18

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.20 = alloca %Main*
	%vtpm.21 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.22 = load i32, i32* %vtpm.21
	%vtpm.23 = call i8*(i32 ) @malloc( i32 %vtpm.22 )
	%vtpm.24 = bitcast i8* %vtpm.23 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.24, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.25 = getelementptr %Main, %Main* %vtpm.24, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.25
	store %Main* %vtpm.24, %Main** %vtpm.20
	ret %Main* %vtpm.24

abort:
	call void @abort(  )
	unreachable
}

define %Foo* @Foo_a(%Foo* %self) {

entry:
	%vtpm.27 = alloca %Foo*
	store %Foo* %self, %Foo** %vtpm.27
	%vtpm.28 = load %Foo*, %Foo** %vtpm.27
	ret %Foo* %vtpm.28

abort:
	call void @abort(  )
	unreachable
}

define %Foo* @Foo_new() {

entry:
	%vtpm.30 = alloca %Foo*
	%vtpm.31 = getelementptr %_Foo_vtable, %_Foo_vtable* @_Foo_vtable_prototype, i32 0, i32 1
	%vtpm.32 = load i32, i32* %vtpm.31
	%vtpm.33 = call i8*(i32 ) @malloc( i32 %vtpm.32 )
	%vtpm.34 = bitcast i8* %vtpm.33 to %Foo*
	%malloc.null = icmp eq %Foo* %vtpm.34, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.35 = getelementptr %Foo, %Foo* %vtpm.34, i32 0, i32 0
	store %_Foo_vtable* @_Foo_vtable_prototype, %_Foo_vtable** %vtpm.35
	store %Foo* %vtpm.34, %Foo** %vtpm.30
	ret %Foo* %vtpm.34

abort:
	call void @abort(  )
	unreachable
}

define %Bar* @Bar_a(%Bar* %self) {

entry:
	%vtpm.37 = alloca %Bar*
	store %Bar* %self, %Bar** %vtpm.37
	%vtpm.38 = load %Bar*, %Bar** %vtpm.37
	ret %Bar* %vtpm.38

abort:
	call void @abort(  )
	unreachable
}

define i32 @Bar_b(%Bar* %self, i32 %y) {

entry:
	%vtpm.40 = alloca %Bar*
	%vtpm.41 = alloca i32
	store %Bar* %self, %Bar** %vtpm.40
	store i32 %y, i32* %vtpm.41
	ret i32 1

abort:
	call void @abort(  )
	unreachable
}

define %Bar* @Bar_new() {

entry:
	%vtpm.43 = alloca %Bar*
	%vtpm.44 = getelementptr %_Bar_vtable, %_Bar_vtable* @_Bar_vtable_prototype, i32 0, i32 1
	%vtpm.45 = load i32, i32* %vtpm.44
	%vtpm.46 = call i8*(i32 ) @malloc( i32 %vtpm.45 )
	%vtpm.47 = bitcast i8* %vtpm.46 to %Bar*
	%malloc.null = icmp eq %Bar* %vtpm.47, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.48 = getelementptr %Bar, %Bar* %vtpm.47, i32 0, i32 0
	store %_Bar_vtable* @_Bar_vtable_prototype, %_Bar_vtable** %vtpm.48
	store %Bar* %vtpm.47, %Bar** %vtpm.43
	ret %Bar* %vtpm.47

abort:
	call void @abort(  )
	unreachable
}

