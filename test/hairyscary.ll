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

@str.Bazz = internal constant [5 x i8] c"Bazz\00"
%Bazz = type {
	%_Bazz_vtable*,
	i32,
	%Foo*,
	%Object*
}

%_Bazz_vtable = type {
	i32,
	i32,
	i8*,
	%Bazz* () *,
	%Object* (%Bazz*) *,
	%String* (%Bazz*) *,
	%Bazz* (%Bazz*) *,
	%Bazz* (%Bazz*,%String*) *,
	%Bazz* (%Bazz*,i32) *,
	%String* (%Bazz*) *,
	i32 (%Bazz*) *,
	i32 (%Bazz*) *,
	i32 (%Bazz*) *
}

@_Bazz_vtable_prototype = constant %_Bazz_vtable {
	i32 5,
	i32 ptrtoint (%Bazz* getelementptr (%Bazz, %Bazz* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Bazz, i32 0, i32 0),
	%Bazz* () * @Bazz_new,
	%Object* (%Bazz*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bazz*) *),
	%String* (%Bazz*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bazz*) *),
	%Bazz* (%Bazz*) * bitcast (%Object* (%Object*) * @Object_copy to %Bazz* (%Bazz*) *),
	%Bazz* (%Bazz*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Bazz* (%Bazz*,%String*) *),
	%Bazz* (%Bazz*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Bazz* (%Bazz*,i32) *),
	%String* (%Bazz*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Bazz*) *),
	i32 (%Bazz*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Bazz*) *),
	i32 (%Bazz*) * @Bazz_printh,
	i32 (%Bazz*) * @Bazz_doh
}

@str.Foo = internal constant [4 x i8] c"Foo\00"
%Foo = type {
	%_Foo_vtable*,
	i32,
	%Foo*,
	%Object*,
	%Razz*,
	i32
}

%_Foo_vtable = type {
	i32,
	i32,
	i8*,
	%Foo* () *,
	%Object* (%Foo*) *,
	%String* (%Foo*) *,
	%Foo* (%Foo*) *,
	%Foo* (%Foo*,%String*) *,
	%Foo* (%Foo*,i32) *,
	%String* (%Foo*) *,
	i32 (%Foo*) *,
	i32 (%Foo*) *,
	i32 (%Foo*) *
}

@_Foo_vtable_prototype = constant %_Foo_vtable {
	i32 6,
	i32 ptrtoint (%Foo* getelementptr (%Foo, %Foo* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Foo, i32 0, i32 0),
	%Foo* () * @Foo_new,
	%Object* (%Foo*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Foo*) *),
	%String* (%Foo*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Foo*) *),
	%Foo* (%Foo*) * bitcast (%Object* (%Object*) * @Object_copy to %Foo* (%Foo*) *),
	%Foo* (%Foo*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Foo* (%Foo*,%String*) *),
	%Foo* (%Foo*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Foo* (%Foo*,i32) *),
	%String* (%Foo*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Foo*) *),
	i32 (%Foo*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Foo*) *),
	i32 (%Foo*) * bitcast (i32 (%Bazz*) * @Bazz_printh to i32 (%Foo*) *),
	i32 (%Foo*) * bitcast (i32 (%Bazz*) * @Bazz_doh to i32 (%Foo*) *)
}

@str.Razz = internal constant [5 x i8] c"Razz\00"
%Razz = type {
	%_Razz_vtable*,
	i32,
	%Foo*,
	%Object*,
	%Razz*,
	i32,
	%Bar*,
	i32
}

%_Razz_vtable = type {
	i32,
	i32,
	i8*,
	%Razz* () *,
	%Object* (%Razz*) *,
	%String* (%Razz*) *,
	%Razz* (%Razz*) *,
	%Razz* (%Razz*,%String*) *,
	%Razz* (%Razz*,i32) *,
	%String* (%Razz*) *,
	i32 (%Razz*) *,
	i32 (%Razz*) *,
	i32 (%Razz*) *
}

@_Razz_vtable_prototype = constant %_Razz_vtable {
	i32 7,
	i32 ptrtoint (%Razz* getelementptr (%Razz, %Razz* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Razz, i32 0, i32 0),
	%Razz* () * @Razz_new,
	%Object* (%Razz*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Razz*) *),
	%String* (%Razz*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Razz*) *),
	%Razz* (%Razz*) * bitcast (%Object* (%Object*) * @Object_copy to %Razz* (%Razz*) *),
	%Razz* (%Razz*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Razz* (%Razz*,%String*) *),
	%Razz* (%Razz*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Razz* (%Razz*,i32) *),
	%String* (%Razz*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Razz*) *),
	i32 (%Razz*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Razz*) *),
	i32 (%Razz*) * bitcast (i32 (%Bazz*) * @Bazz_printh to i32 (%Razz*) *),
	i32 (%Razz*) * bitcast (i32 (%Foo*) * @Foo_doh to i32 (%Razz*) *)
}

@str.Bar = internal constant [4 x i8] c"Bar\00"
%Bar = type {
	%_Bar_vtable*,
	i32,
	%Foo*,
	%Object*,
	%Razz*,
	i32,
	%Bar*,
	i32,
	i32,
	%Object*
}

%_Bar_vtable = type {
	i32,
	i32,
	i8*,
	%Bar* () *,
	%Object* (%Bar*) *,
	%String* (%Bar*) *,
	%Bar* (%Bar*) *,
	%Bar* (%Bar*,%String*) *,
	%Bar* (%Bar*,i32) *,
	%String* (%Bar*) *,
	i32 (%Bar*) *,
	i32 (%Bar*) *,
	i32 (%Bar*) *
}

@_Bar_vtable_prototype = constant %_Bar_vtable {
	i32 8,
	i32 ptrtoint (%Bar* getelementptr (%Bar, %Bar* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Bar, i32 0, i32 0),
	%Bar* () * @Bar_new,
	%Object* (%Bar*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bar*) *),
	%String* (%Bar*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bar*) *),
	%Bar* (%Bar*) * bitcast (%Object* (%Object*) * @Object_copy to %Bar* (%Bar*) *),
	%Bar* (%Bar*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Bar* (%Bar*,%String*) *),
	%Bar* (%Bar*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Bar* (%Bar*,i32) *),
	%String* (%Bar*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Bar*) *),
	i32 (%Bar*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Bar*) *),
	i32 (%Bar*) * bitcast (i32 (%Bazz*) * @Bazz_printh to i32 (%Bar*) *),
	i32 (%Bar*) * bitcast (i32 (%Foo*) * @Foo_doh to i32 (%Bar*) *)
}

@str.Main = internal constant [5 x i8] c"Main\00"
%Main = type {
	%_Main_vtable*,
	%Bazz*,
	%Foo*,
	%Razz*,
	%Bar*
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
	i32 9,
	i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
	%Main* () * @Main_new,
	%Object* (%Main*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Main*) *),
	%String* (%Main*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Main*) *),
	%Main* (%Main*) * bitcast (%Object* (%Object*) * @Object_copy to %Main* (%Main*) *),
	%String* (%Main*) * @Main_main
}

@global_str.2 = internal constant [14 x i8] c"<basic class>\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.2, i32 0, i32 0)
}

@global_str.1 = internal constant [11 x i8] c"do nothing\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([11 x i8], [11 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.0 = internal constant [14 x i8] c"hairyscary.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.0, i32 0, i32 0)
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
define i32 @Bazz_doh(%Bazz* %self) {

entry:
	%vtpm.0 = alloca i32
	%vtpm.1 = alloca %Bazz*
	store %Bazz* %self, %Bazz** %vtpm.1
	%vtpm.2 = load %Bazz*, %Bazz** %vtpm.1
	%vtpm.3 = getelementptr %Bazz, %Bazz* %vtpm.2, i32 0, i32 1
	%vtpm.4 = load i32, i32* %vtpm.3
	store i32 %vtpm.4, i32* %vtpm.0
	%vtpm.5 = load %Bazz*, %Bazz** %vtpm.1
	%vtpm.6 = getelementptr %Bazz, %Bazz* %vtpm.5, i32 0, i32 1
	%vtpm.7 = load i32, i32* %vtpm.6
	%vtpm.8 = add i32 %vtpm.7, 1
	%vtpm.9 = load %Bazz*, %Bazz** %vtpm.1
	%vtpm.10 = getelementptr %Bazz, %Bazz* %vtpm.9, i32 0, i32 1
	store i32 %vtpm.8, i32* %vtpm.10
	%vtpm.11 = load i32, i32* %vtpm.0
	ret i32 %vtpm.11

abort:
	call void @abort(  )
	unreachable
}

define i32 @Bazz_printh(%Bazz* %self) {

entry:
	%vtpm.13 = alloca %Bazz*
	store %Bazz* %self, %Bazz** %vtpm.13
	%vtpm.14 = load %Bazz*, %Bazz** %vtpm.13
	%vtpm.15 = getelementptr %Bazz, %Bazz* %vtpm.14, i32 0, i32 1
	%vtpm.16 = load i32, i32* %vtpm.15
	%vtpm.17 = load %Bazz*, %Bazz** %vtpm.13
	%vtpm.18 = icmp eq %Bazz* %vtpm.17, null
	br i1 %vtpm.18, label %abort, label %ok.0

ok.0:
	%vtpm.19 = getelementptr %Bazz, %Bazz* %vtpm.17, i32 0, i32 0
	%vtpm.20 = load %_Bazz_vtable*, %_Bazz_vtable** %vtpm.19
	%vtpm.21 = getelementptr %_Bazz_vtable, %_Bazz_vtable* %vtpm.20, i32 0, i32 8
	%tmp.0 = load %Bazz* (%Bazz*,i32) *, %Bazz* (%Bazz*,i32) ** %vtpm.21
	%vtpm.22 = call %Bazz*(%Bazz*, i32 ) %tmp.0( %Bazz* %vtpm.17, i32 %vtpm.16 )
	ret i32 0

abort:
	call void @abort(  )
	unreachable
}

define %Bazz* @Bazz_new() {

entry:
	%vtpm.24 = alloca %Bazz*
	%vtpm.25 = getelementptr %_Bazz_vtable, %_Bazz_vtable* @_Bazz_vtable_prototype, i32 0, i32 1
	%vtpm.26 = load i32, i32* %vtpm.25
	%vtpm.27 = call i8*(i32 ) @malloc( i32 %vtpm.26 )
	%vtpm.28 = bitcast i8* %vtpm.27 to %Bazz*
	%malloc.null = icmp eq %Bazz* %vtpm.28, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.29 = getelementptr %Bazz, %Bazz* %vtpm.28, i32 0, i32 0
	store %_Bazz_vtable* @_Bazz_vtable_prototype, %_Bazz_vtable** %vtpm.29
	store %Bazz* %vtpm.28, %Bazz** %vtpm.24
	%vtpm.30 = getelementptr %Bazz, %Bazz* %vtpm.28, i32 0, i32 1
	store i32 0, i32* %vtpm.30
	%vtpm.31 = getelementptr %Bazz, %Bazz* %vtpm.28, i32 0, i32 2
	store %Foo* null, %Foo** %vtpm.31
	%vtpm.32 = getelementptr %Bazz, %Bazz* %vtpm.28, i32 0, i32 3
	store %Object* null, %Object** %vtpm.32
	%vtpm.33 = getelementptr %Bazz, %Bazz* %vtpm.28, i32 0, i32 1
	store i32 1, i32* %vtpm.33
	%vtpm.34 = getelementptr %Bazz, %Bazz* %vtpm.28, i32 0, i32 2
