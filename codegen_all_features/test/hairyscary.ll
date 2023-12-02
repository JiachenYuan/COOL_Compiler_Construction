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
	i32 (%Foo*) * @Foo_doh
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
	%tmp.0 = alloca %Foo*
	%vtpm.25 = alloca %Bazz*
	%vtpm.26 = alloca %Razz*
	%vtpm.27 = alloca %Foo*
	%vtpm.28 = alloca %Bar*
	%vtpm.29 = getelementptr %_Bazz_vtable, %_Bazz_vtable* @_Bazz_vtable_prototype, i32 0, i32 1
	%vtpm.30 = load i32, i32* %vtpm.29
	%vtpm.31 = call i8*(i32 ) @malloc( i32 %vtpm.30 )
	%vtpm.32 = bitcast i8* %vtpm.31 to %Bazz*
	%malloc.null = icmp eq %Bazz* %vtpm.32, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.33 = getelementptr %Bazz, %Bazz* %vtpm.32, i32 0, i32 0
	store %_Bazz_vtable* @_Bazz_vtable_prototype, %_Bazz_vtable** %vtpm.33
	store %Bazz* %vtpm.32, %Bazz** %vtpm.24
	%vtpm.34 = getelementptr %Bazz, %Bazz* %vtpm.32, i32 0, i32 1
	store i32 0, i32* %vtpm.34
	%vtpm.35 = getelementptr %Bazz, %Bazz* %vtpm.32, i32 0, i32 2
	store %Foo* null, %Foo** %vtpm.35
	%vtpm.36 = getelementptr %Bazz, %Bazz* %vtpm.32, i32 0, i32 3
	store %Object* null, %Object** %vtpm.36
	%vtpm.37 = getelementptr %Bazz, %Bazz* %vtpm.32, i32 0, i32 1
	%vtpm.38 = load %Bazz*, %Bazz** %vtpm.24
	%vtpm.39 = getelementptr %Bazz, %Bazz* %vtpm.38, i32 0, i32 1
	store i32 1, i32* %vtpm.39
	%vtpm.40 = getelementptr %Bazz, %Bazz* %vtpm.32, i32 0, i32 2
	%vtpm.41 = load %Bazz*, %Bazz** %vtpm.24
	%tmp.1 = icmp eq %Bazz* %vtpm.41, null
	br i1 %tmp.1, label %abort, label %ok.0

ok.0:
	%vtpm.42 = getelementptr %Bazz, %Bazz* %vtpm.41, i32 0, i32 0
	%vtpm.43 = load %_Bazz_vtable*, %_Bazz_vtable** %vtpm.42
	%vtpm.44 = getelementptr %_Bazz_vtable, %_Bazz_vtable* %vtpm.43, i32 0, i32 0
	%vtpm.45 = load i32, i32* %vtpm.44
	br label %case.hdr.0

case.hdr.0:
	br label %case.8.0

case.8.0:
	%vtpm.46 = icmp slt i32 %vtpm.45, 8
	br i1 %vtpm.46, label %br_exit.8.0, label %src_gte_br.8.0

src_gte_br.8.0:
	%vtpm.47 = icmp sgt i32 %vtpm.45, 8
	br i1 %vtpm.47, label %br_exit.8.0, label %src_lte_mc.8.0

src_lte_mc.8.0:
	%vtpm.48 = bitcast %Bazz* %vtpm.41 to %Bar*
	store %Bar* %vtpm.48, %Bar** %vtpm.28
	%vtpm.49 = load %Bar*, %Bar** %vtpm.28
	%vtpm.50 = bitcast %Bar* %vtpm.49 to %Foo*
	store %Foo* %vtpm.50, %Foo** %tmp.0
	br label %case.exit.0

br_exit.8.0:
	br label %case.7.0

case.7.0:
	%vtpm.51 = icmp slt i32 %vtpm.45, 7
	br i1 %vtpm.51, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%vtpm.52 = icmp sgt i32 %vtpm.45, 8
	br i1 %vtpm.52, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%vtpm.53 = bitcast %Bazz* %vtpm.41 to %Razz*
	store %Razz* %vtpm.53, %Razz** %vtpm.26
	%vtpm.54 = call %Bar* @Bar_new(  )
	%vtpm.55 = bitcast %Bar* %vtpm.54 to %Foo*
	store %Foo* %vtpm.55, %Foo** %tmp.0
	br label %case.exit.0

br_exit.7.0:
	br label %case.6.0

case.6.0:
	%vtpm.56 = icmp slt i32 %vtpm.45, 6
	br i1 %vtpm.56, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%vtpm.57 = icmp sgt i32 %vtpm.45, 8
	br i1 %vtpm.57, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%vtpm.58 = bitcast %Bazz* %vtpm.41 to %Foo*
	store %Foo* %vtpm.58, %Foo** %vtpm.27
	%vtpm.59 = call %Razz* @Razz_new(  )
	%vtpm.60 = bitcast %Razz* %vtpm.59 to %Foo*
	store %Foo* %vtpm.60, %Foo** %tmp.0
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%vtpm.61 = icmp slt i32 %vtpm.45, 5
	br i1 %vtpm.61, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%vtpm.62 = icmp sgt i32 %vtpm.45, 8
	br i1 %vtpm.62, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	store %Bazz* %vtpm.41, %Bazz** %vtpm.25
	%vtpm.63 = call %Foo* @Foo_new(  )
	store %Foo* %vtpm.63, %Foo** %tmp.0
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%tmp.2 = load %Foo*, %Foo** %tmp.0
	%vtpm.64 = load %Bazz*, %Bazz** %vtpm.24
	%vtpm.65 = getelementptr %Bazz, %Bazz* %vtpm.64, i32 0, i32 2
	store %Foo* %tmp.2, %Foo** %vtpm.65
	%vtpm.66 = getelementptr %Bazz, %Bazz* %vtpm.32, i32 0, i32 3
	%vtpm.67 = load %Bazz*, %Bazz** %vtpm.24
	%vtpm.68 = icmp eq %Bazz* %vtpm.67, null
	br i1 %vtpm.68, label %abort, label %ok.1

ok.1:
	%vtpm.69 = getelementptr %Bazz, %Bazz* %vtpm.67, i32 0, i32 0
	%vtpm.70 = load %_Bazz_vtable*, %_Bazz_vtable** %vtpm.69
	%vtpm.71 = getelementptr %_Bazz_vtable, %_Bazz_vtable* %vtpm.70, i32 0, i32 11
	%tmp.3 = load i32 (%Bazz*) *, i32 (%Bazz*) ** %vtpm.71
	%vtpm.72 = call i32(%Bazz* ) %tmp.3( %Bazz* %vtpm.67 )
	%vtpm.73 = load %Bazz*, %Bazz** %vtpm.24
	%vtpm.74 = getelementptr %Bazz, %Bazz* %vtpm.73, i32 0, i32 3
	%vtpm.75 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.75, i32 %vtpm.72 )
	%vtpm.77 = bitcast %Int* %vtpm.75 to %Object*
	store %Object* %vtpm.77, %Object** %vtpm.74
	ret %Bazz* %vtpm.32

abort:
	call void @abort(  )
	unreachable
}

define i32 @Foo_doh(%Foo* %self) {

entry:
	%vtpm.79 = alloca i32
	%vtpm.80 = alloca %Foo*
	store %Foo* %self, %Foo** %vtpm.80
	%vtpm.81 = load %Foo*, %Foo** %vtpm.80
	%vtpm.82 = getelementptr %Foo, %Foo* %vtpm.81, i32 0, i32 1
	%vtpm.83 = load i32, i32* %vtpm.82
	store i32 %vtpm.83, i32* %vtpm.79
	%vtpm.84 = load %Foo*, %Foo** %vtpm.80
	%vtpm.85 = getelementptr %Foo, %Foo* %vtpm.84, i32 0, i32 1
	%vtpm.86 = load i32, i32* %vtpm.85
	%vtpm.87 = add i32 %vtpm.86, 2
	%vtpm.88 = load %Foo*, %Foo** %vtpm.80
	%vtpm.89 = getelementptr %Foo, %Foo* %vtpm.88, i32 0, i32 1
	store i32 %vtpm.87, i32* %vtpm.89
	%vtpm.90 = load i32, i32* %vtpm.79
	ret i32 %vtpm.90

abort:
	call void @abort(  )
	unreachable
}

define %Foo* @Foo_new() {

entry:
	%vtpm.92 = alloca %Foo*
	%tmp.0 = alloca %Foo*
	%vtpm.93 = alloca %Bazz*
	%vtpm.94 = alloca %Razz*
	%vtpm.95 = alloca %Foo*
	%vtpm.96 = alloca %Bar*
	%tmp.1 = alloca %Bar*
	%vtpm.97 = alloca %Razz*
	%vtpm.98 = alloca %Foo*
	%vtpm.99 = alloca %Bar*
	%vtpm.100 = getelementptr %_Foo_vtable, %_Foo_vtable* @_Foo_vtable_prototype, i32 0, i32 1
	%vtpm.101 = load i32, i32* %vtpm.100
	%vtpm.102 = call i8*(i32 ) @malloc( i32 %vtpm.101 )
	%vtpm.103 = bitcast i8* %vtpm.102 to %Foo*
	%malloc.null = icmp eq %Foo* %vtpm.103, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.104 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 0
	store %_Foo_vtable* @_Foo_vtable_prototype, %_Foo_vtable** %vtpm.104
	store %Foo* %vtpm.103, %Foo** %vtpm.92
	%vtpm.105 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 1
	store i32 0, i32* %vtpm.105
	%vtpm.106 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 2
	store %Foo* null, %Foo** %vtpm.106
	%vtpm.107 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 3
	store %Object* null, %Object** %vtpm.107
	%vtpm.108 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 4
	store %Razz* null, %Razz** %vtpm.108
	%vtpm.109 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 5
	store i32 0, i32* %vtpm.109
	%vtpm.110 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 1
	%vtpm.111 = load %Foo*, %Foo** %vtpm.92
	%vtpm.112 = getelementptr %Foo, %Foo* %vtpm.111, i32 0, i32 1
	store i32 1, i32* %vtpm.112
	%vtpm.113 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 2
	%vtpm.114 = load %Foo*, %Foo** %vtpm.92
	%tmp.2 = icmp eq %Foo* %vtpm.114, null
	br i1 %tmp.2, label %abort, label %ok.0

ok.0:
	%vtpm.115 = getelementptr %Foo, %Foo* %vtpm.114, i32 0, i32 0
	%vtpm.116 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.115
	%vtpm.117 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.116, i32 0, i32 0
	%vtpm.118 = load i32, i32* %vtpm.117
	br label %case.hdr.0

case.hdr.0:
	br label %case.8.0

case.8.0:
	%vtpm.119 = icmp slt i32 %vtpm.118, 8
	br i1 %vtpm.119, label %br_exit.8.0, label %src_gte_br.8.0

src_gte_br.8.0:
	%vtpm.120 = icmp sgt i32 %vtpm.118, 8
	br i1 %vtpm.120, label %br_exit.8.0, label %src_lte_mc.8.0

src_lte_mc.8.0:
	%vtpm.121 = bitcast %Foo* %vtpm.114 to %Bar*
	store %Bar* %vtpm.121, %Bar** %vtpm.96
	%vtpm.122 = load %Bar*, %Bar** %vtpm.96
	%vtpm.123 = bitcast %Bar* %vtpm.122 to %Foo*
	store %Foo* %vtpm.123, %Foo** %tmp.0
	br label %case.exit.0

br_exit.8.0:
	br label %case.7.0

case.7.0:
	%vtpm.124 = icmp slt i32 %vtpm.118, 7
	br i1 %vtpm.124, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%vtpm.125 = icmp sgt i32 %vtpm.118, 8
	br i1 %vtpm.125, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%vtpm.126 = bitcast %Foo* %vtpm.114 to %Razz*
	store %Razz* %vtpm.126, %Razz** %vtpm.94
	%vtpm.127 = call %Bar* @Bar_new(  )
	%vtpm.128 = bitcast %Bar* %vtpm.127 to %Foo*
	store %Foo* %vtpm.128, %Foo** %tmp.0
	br label %case.exit.0

br_exit.7.0:
	br label %case.6.0

case.6.0:
	%vtpm.129 = icmp slt i32 %vtpm.118, 6
	br i1 %vtpm.129, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%vtpm.130 = icmp sgt i32 %vtpm.118, 8
	br i1 %vtpm.130, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	store %Foo* %vtpm.114, %Foo** %vtpm.95
	%vtpm.131 = call %Razz* @Razz_new(  )
	%vtpm.132 = bitcast %Razz* %vtpm.131 to %Foo*
	store %Foo* %vtpm.132, %Foo** %tmp.0
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%vtpm.133 = icmp slt i32 %vtpm.118, 5
	br i1 %vtpm.133, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%vtpm.134 = icmp sgt i32 %vtpm.118, 8
	br i1 %vtpm.134, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	%vtpm.135 = bitcast %Foo* %vtpm.114 to %Bazz*
	store %Bazz* %vtpm.135, %Bazz** %vtpm.93
	%vtpm.136 = call %Foo* @Foo_new(  )
	store %Foo* %vtpm.136, %Foo** %tmp.0
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%tmp.3 = load %Foo*, %Foo** %tmp.0
	%vtpm.137 = load %Foo*, %Foo** %vtpm.92
	%vtpm.138 = getelementptr %Foo, %Foo* %vtpm.137, i32 0, i32 2
	store %Foo* %tmp.3, %Foo** %vtpm.138
	%vtpm.139 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 3
	%vtpm.140 = load %Foo*, %Foo** %vtpm.92
	%vtpm.141 = icmp eq %Foo* %vtpm.140, null
	br i1 %vtpm.141, label %abort, label %ok.1

ok.1:
	%vtpm.142 = getelementptr %Foo, %Foo* %vtpm.140, i32 0, i32 0
	%vtpm.143 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.142
	%vtpm.144 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.143, i32 0, i32 11
	%tmp.4 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.144
	%vtpm.145 = call i32(%Foo* ) %tmp.4( %Foo* %vtpm.140 )
	%vtpm.146 = load %Foo*, %Foo** %vtpm.92
	%vtpm.147 = getelementptr %Foo, %Foo* %vtpm.146, i32 0, i32 3
	%vtpm.148 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.148, i32 %vtpm.145 )
	%vtpm.150 = bitcast %Int* %vtpm.148 to %Object*
	store %Object* %vtpm.150, %Object** %vtpm.147
	%vtpm.151 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 4
	%vtpm.152 = load %Foo*, %Foo** %vtpm.92
	%tmp.5 = icmp eq %Foo* %vtpm.152, null
	br i1 %tmp.5, label %abort, label %ok.2

ok.2:
	%vtpm.153 = getelementptr %Foo, %Foo* %vtpm.152, i32 0, i32 0
	%vtpm.154 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.153
	%vtpm.155 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.154, i32 0, i32 0
	%vtpm.156 = load i32, i32* %vtpm.155
	br label %case.hdr.1

case.hdr.1:
	br label %case.8.1

case.8.1:
	%vtpm.157 = icmp slt i32 %vtpm.156, 8
	br i1 %vtpm.157, label %br_exit.8.1, label %src_gte_br.8.1

src_gte_br.8.1:
	%vtpm.158 = icmp sgt i32 %vtpm.156, 8
	br i1 %vtpm.158, label %br_exit.8.1, label %src_lte_mc.8.1

src_lte_mc.8.1:
	%vtpm.159 = bitcast %Foo* %vtpm.152 to %Bar*
	store %Bar* %vtpm.159, %Bar** %vtpm.99
	%vtpm.160 = load %Bar*, %Bar** %vtpm.99
	%vtpm.161 = bitcast %Bar* %vtpm.160 to %Razz*
	%vtpm.162 = bitcast %Razz* %vtpm.161 to %Bar*
	store %Bar* %vtpm.162, %Bar** %tmp.1
	br label %case.exit.1

br_exit.8.1:
	br label %case.7.1

case.7.1:
	%vtpm.163 = icmp slt i32 %vtpm.156, 7
	br i1 %vtpm.163, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%vtpm.164 = icmp sgt i32 %vtpm.156, 8
	br i1 %vtpm.164, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	%vtpm.165 = bitcast %Foo* %vtpm.152 to %Razz*
	store %Razz* %vtpm.165, %Razz** %vtpm.97
	%vtpm.166 = call %Bar* @Bar_new(  )
	%vtpm.167 = bitcast %Bar* %vtpm.166 to %Razz*
	%vtpm.168 = bitcast %Razz* %vtpm.167 to %Bar*
	store %Bar* %vtpm.168, %Bar** %tmp.1
	br label %case.exit.1

br_exit.7.1:
	br label %case.6.1

case.6.1:
	%vtpm.169 = icmp slt i32 %vtpm.156, 6
	br i1 %vtpm.169, label %br_exit.6.1, label %src_gte_br.6.1

src_gte_br.6.1:
	%vtpm.170 = icmp sgt i32 %vtpm.156, 8
	br i1 %vtpm.170, label %br_exit.6.1, label %src_lte_mc.6.1

src_lte_mc.6.1:
	store %Foo* %vtpm.152, %Foo** %vtpm.98
	%vtpm.171 = call %Razz* @Razz_new(  )
	%vtpm.172 = bitcast %Razz* %vtpm.171 to %Bar*
	store %Bar* %vtpm.172, %Bar** %tmp.1
	br label %case.exit.1

br_exit.6.1:
	br label %abort

case.exit.1:
	%tmp.6 = load %Bar*, %Bar** %tmp.1
	%vtpm.173 = load %Foo*, %Foo** %vtpm.92
	%vtpm.174 = getelementptr %Foo, %Foo* %vtpm.173, i32 0, i32 4
	%vtpm.175 = bitcast %Bar* %tmp.6 to %Razz*
	store %Razz* %vtpm.175, %Razz** %vtpm.174
	%vtpm.176 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 5
	%vtpm.177 = load %Foo*, %Foo** %vtpm.92
	%vtpm.178 = getelementptr %Foo, %Foo* %vtpm.177, i32 0, i32 4
	%vtpm.179 = load %Razz*, %Razz** %vtpm.178
	%vtpm.180 = icmp eq %Razz* %vtpm.179, null
	br i1 %vtpm.180, label %abort, label %ok.3

ok.3:
	%vtpm.181 = getelementptr %Razz, %Razz* %vtpm.179, i32 0, i32 0
	%vtpm.182 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.181
	%vtpm.183 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.182, i32 0, i32 12
	%tmp.7 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.183
	%vtpm.184 = call i32(%Razz* ) %tmp.7( %Razz* %vtpm.179 )
	%vtpm.185 = load %Foo*, %Foo** %vtpm.92
	%vtpm.186 = getelementptr %Foo, %Foo* %vtpm.185, i32 0, i32 2
	%vtpm.187 = load %Foo*, %Foo** %vtpm.186
	%vtpm.188 = icmp eq %Foo* %vtpm.187, null
	br i1 %vtpm.188, label %abort, label %ok.4

ok.4:
	%vtpm.189 = getelementptr %Foo, %Foo* %vtpm.187, i32 0, i32 0
	%vtpm.190 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.189
	%vtpm.191 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.190, i32 0, i32 12
	%tmp.8 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.191
	%vtpm.192 = call i32(%Foo* ) %tmp.8( %Foo* %vtpm.187 )
	%vtpm.193 = add i32 %vtpm.184, %vtpm.192
	%vtpm.194 = load %Foo*, %Foo** %vtpm.92
	%vtpm.195 = icmp eq %Foo* %vtpm.194, null
	br i1 %vtpm.195, label %abort, label %ok.5

ok.5:
	%vtpm.196 = getelementptr %Foo, %Foo* %vtpm.194, i32 0, i32 0
	%vtpm.197 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.196
	%vtpm.198 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.197, i32 0, i32 12
	%tmp.9 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.198
	%vtpm.199 = call i32(%Foo* ) %tmp.9( %Foo* %vtpm.194 )
	%vtpm.200 = add i32 %vtpm.193, %vtpm.199
	%vtpm.201 = load %Foo*, %Foo** %vtpm.92
	%vtpm.202 = icmp eq %Foo* %vtpm.201, null
	br i1 %vtpm.202, label %abort, label %ok.6

ok.6:
	%vtpm.203 = getelementptr %Foo, %Foo* %vtpm.201, i32 0, i32 0
	%vtpm.204 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.203
	%vtpm.205 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.204, i32 0, i32 11
	%tmp.10 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.205
	%vtpm.206 = call i32(%Foo* ) %tmp.10( %Foo* %vtpm.201 )
	%vtpm.207 = add i32 %vtpm.200, %vtpm.206
	%vtpm.208 = load %Foo*, %Foo** %vtpm.92
	%vtpm.209 = getelementptr %Foo, %Foo* %vtpm.208, i32 0, i32 5
	store i32 %vtpm.207, i32* %vtpm.209
	ret %Foo* %vtpm.103

abort:
	call void @abort(  )
	unreachable
}

define %Razz* @Razz_new() {

entry:
	%vtpm.211 = alloca %Razz*
	%tmp.0 = alloca %Foo*
	%vtpm.212 = alloca %Bazz*
	%vtpm.213 = alloca %Razz*
	%vtpm.214 = alloca %Foo*
	%vtpm.215 = alloca %Bar*
	%tmp.1 = alloca %Bar*
	%vtpm.216 = alloca %Razz*
	%vtpm.217 = alloca %Foo*
	%vtpm.218 = alloca %Bar*
	%tmp.2 = alloca %Bar*
	%vtpm.219 = alloca %Razz*
	%vtpm.220 = alloca %Bar*
	%vtpm.221 = getelementptr %_Razz_vtable, %_Razz_vtable* @_Razz_vtable_prototype, i32 0, i32 1
	%vtpm.222 = load i32, i32* %vtpm.221
	%vtpm.223 = call i8*(i32 ) @malloc( i32 %vtpm.222 )
	%vtpm.224 = bitcast i8* %vtpm.223 to %Razz*
	%malloc.null = icmp eq %Razz* %vtpm.224, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.225 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 0
	store %_Razz_vtable* @_Razz_vtable_prototype, %_Razz_vtable** %vtpm.225
	store %Razz* %vtpm.224, %Razz** %vtpm.211
	%vtpm.226 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 1
	store i32 0, i32* %vtpm.226
	%vtpm.227 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 2
	store %Foo* null, %Foo** %vtpm.227
	%vtpm.228 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 3
	store %Object* null, %Object** %vtpm.228
	%vtpm.229 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 4
	store %Razz* null, %Razz** %vtpm.229
	%vtpm.230 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 5
	store i32 0, i32* %vtpm.230
	%vtpm.231 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 6
	store %Bar* null, %Bar** %vtpm.231
	%vtpm.232 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 7
	store i32 0, i32* %vtpm.232
	%vtpm.233 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 1
	%vtpm.234 = load %Razz*, %Razz** %vtpm.211
	%vtpm.235 = getelementptr %Razz, %Razz* %vtpm.234, i32 0, i32 1
	store i32 1, i32* %vtpm.235
	%vtpm.236 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 2
	%vtpm.237 = load %Razz*, %Razz** %vtpm.211
	%tmp.3 = icmp eq %Razz* %vtpm.237, null
	br i1 %tmp.3, label %abort, label %ok.0

ok.0:
	%vtpm.238 = getelementptr %Razz, %Razz* %vtpm.237, i32 0, i32 0
	%vtpm.239 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.238
	%vtpm.240 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.239, i32 0, i32 0
	%vtpm.241 = load i32, i32* %vtpm.240
	br label %case.hdr.0

case.hdr.0:
	br label %case.8.0

case.8.0:
	%vtpm.242 = icmp slt i32 %vtpm.241, 8
	br i1 %vtpm.242, label %br_exit.8.0, label %src_gte_br.8.0

src_gte_br.8.0:
	%vtpm.243 = icmp sgt i32 %vtpm.241, 8
	br i1 %vtpm.243, label %br_exit.8.0, label %src_lte_mc.8.0

src_lte_mc.8.0:
	%vtpm.244 = bitcast %Razz* %vtpm.237 to %Bar*
	store %Bar* %vtpm.244, %Bar** %vtpm.215
	%vtpm.245 = load %Bar*, %Bar** %vtpm.215
	%vtpm.246 = bitcast %Bar* %vtpm.245 to %Foo*
	store %Foo* %vtpm.246, %Foo** %tmp.0
	br label %case.exit.0

br_exit.8.0:
	br label %case.7.0

case.7.0:
	%vtpm.247 = icmp slt i32 %vtpm.241, 7
	br i1 %vtpm.247, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%vtpm.248 = icmp sgt i32 %vtpm.241, 8
	br i1 %vtpm.248, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	store %Razz* %vtpm.237, %Razz** %vtpm.213
	%vtpm.249 = call %Bar* @Bar_new(  )
	%vtpm.250 = bitcast %Bar* %vtpm.249 to %Foo*
	store %Foo* %vtpm.250, %Foo** %tmp.0
	br label %case.exit.0

br_exit.7.0:
	br label %case.6.0

case.6.0:
	%vtpm.251 = icmp slt i32 %vtpm.241, 6
	br i1 %vtpm.251, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%vtpm.252 = icmp sgt i32 %vtpm.241, 8
	br i1 %vtpm.252, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%vtpm.253 = bitcast %Razz* %vtpm.237 to %Foo*
	store %Foo* %vtpm.253, %Foo** %vtpm.214
	%vtpm.254 = call %Razz* @Razz_new(  )
	%vtpm.255 = bitcast %Razz* %vtpm.254 to %Foo*
	store %Foo* %vtpm.255, %Foo** %tmp.0
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%vtpm.256 = icmp slt i32 %vtpm.241, 5
	br i1 %vtpm.256, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%vtpm.257 = icmp sgt i32 %vtpm.241, 8
	br i1 %vtpm.257, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	%vtpm.258 = bitcast %Razz* %vtpm.237 to %Bazz*
	store %Bazz* %vtpm.258, %Bazz** %vtpm.212
	%vtpm.259 = call %Foo* @Foo_new(  )
	store %Foo* %vtpm.259, %Foo** %tmp.0
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%tmp.4 = load %Foo*, %Foo** %tmp.0
	%vtpm.260 = load %Razz*, %Razz** %vtpm.211
	%vtpm.261 = getelementptr %Razz, %Razz* %vtpm.260, i32 0, i32 2
	store %Foo* %tmp.4, %Foo** %vtpm.261
	%vtpm.262 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 3
	%vtpm.263 = load %Razz*, %Razz** %vtpm.211
	%vtpm.264 = icmp eq %Razz* %vtpm.263, null
	br i1 %vtpm.264, label %abort, label %ok.1

ok.1:
	%vtpm.265 = getelementptr %Razz, %Razz* %vtpm.263, i32 0, i32 0
	%vtpm.266 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.265
	%vtpm.267 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.266, i32 0, i32 11
	%tmp.5 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.267
	%vtpm.268 = call i32(%Razz* ) %tmp.5( %Razz* %vtpm.263 )
	%vtpm.269 = load %Razz*, %Razz** %vtpm.211
	%vtpm.270 = getelementptr %Razz, %Razz* %vtpm.269, i32 0, i32 3
	%vtpm.271 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.271, i32 %vtpm.268 )
	%vtpm.273 = bitcast %Int* %vtpm.271 to %Object*
	store %Object* %vtpm.273, %Object** %vtpm.270
	%vtpm.274 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 4
	%vtpm.275 = load %Razz*, %Razz** %vtpm.211
	%tmp.6 = icmp eq %Razz* %vtpm.275, null
	br i1 %tmp.6, label %abort, label %ok.2

ok.2:
	%vtpm.276 = getelementptr %Razz, %Razz* %vtpm.275, i32 0, i32 0
	%vtpm.277 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.276
	%vtpm.278 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.277, i32 0, i32 0
	%vtpm.279 = load i32, i32* %vtpm.278
	br label %case.hdr.1

case.hdr.1:
	br label %case.8.1

case.8.1:
	%vtpm.280 = icmp slt i32 %vtpm.279, 8
	br i1 %vtpm.280, label %br_exit.8.1, label %src_gte_br.8.1

src_gte_br.8.1:
	%vtpm.281 = icmp sgt i32 %vtpm.279, 8
	br i1 %vtpm.281, label %br_exit.8.1, label %src_lte_mc.8.1

src_lte_mc.8.1:
	%vtpm.282 = bitcast %Razz* %vtpm.275 to %Bar*
	store %Bar* %vtpm.282, %Bar** %vtpm.218
	%vtpm.283 = load %Bar*, %Bar** %vtpm.218
	%vtpm.284 = bitcast %Bar* %vtpm.283 to %Razz*
	%vtpm.285 = bitcast %Razz* %vtpm.284 to %Bar*
	store %Bar* %vtpm.285, %Bar** %tmp.1
	br label %case.exit.1

br_exit.8.1:
	br label %case.7.1

case.7.1:
	%vtpm.286 = icmp slt i32 %vtpm.279, 7
	br i1 %vtpm.286, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%vtpm.287 = icmp sgt i32 %vtpm.279, 8
	br i1 %vtpm.287, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	store %Razz* %vtpm.275, %Razz** %vtpm.216
	%vtpm.288 = call %Bar* @Bar_new(  )
	%vtpm.289 = bitcast %Bar* %vtpm.288 to %Razz*
	%vtpm.290 = bitcast %Razz* %vtpm.289 to %Bar*
	store %Bar* %vtpm.290, %Bar** %tmp.1
	br label %case.exit.1

br_exit.7.1:
	br label %case.6.1

case.6.1:
	%vtpm.291 = icmp slt i32 %vtpm.279, 6
	br i1 %vtpm.291, label %br_exit.6.1, label %src_gte_br.6.1

src_gte_br.6.1:
	%vtpm.292 = icmp sgt i32 %vtpm.279, 8
	br i1 %vtpm.292, label %br_exit.6.1, label %src_lte_mc.6.1

src_lte_mc.6.1:
	%vtpm.293 = bitcast %Razz* %vtpm.275 to %Foo*
	store %Foo* %vtpm.293, %Foo** %vtpm.217
	%vtpm.294 = call %Razz* @Razz_new(  )
	%vtpm.295 = bitcast %Razz* %vtpm.294 to %Bar*
	store %Bar* %vtpm.295, %Bar** %tmp.1
	br label %case.exit.1

br_exit.6.1:
	br label %abort

case.exit.1:
	%tmp.7 = load %Bar*, %Bar** %tmp.1
	%vtpm.296 = load %Razz*, %Razz** %vtpm.211
	%vtpm.297 = getelementptr %Razz, %Razz* %vtpm.296, i32 0, i32 4
	%vtpm.298 = bitcast %Bar* %tmp.7 to %Razz*
	store %Razz* %vtpm.298, %Razz** %vtpm.297
	%vtpm.299 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 5
	%vtpm.300 = load %Razz*, %Razz** %vtpm.211
	%vtpm.301 = getelementptr %Razz, %Razz* %vtpm.300, i32 0, i32 4
	%vtpm.302 = load %Razz*, %Razz** %vtpm.301
	%vtpm.303 = icmp eq %Razz* %vtpm.302, null
	br i1 %vtpm.303, label %abort, label %ok.3

ok.3:
	%vtpm.304 = getelementptr %Razz, %Razz* %vtpm.302, i32 0, i32 0
	%vtpm.305 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.304
	%vtpm.306 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.305, i32 0, i32 12
	%tmp.8 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.306
	%vtpm.307 = call i32(%Razz* ) %tmp.8( %Razz* %vtpm.302 )
	%vtpm.308 = load %Razz*, %Razz** %vtpm.211
	%vtpm.309 = getelementptr %Razz, %Razz* %vtpm.308, i32 0, i32 2
	%vtpm.310 = load %Foo*, %Foo** %vtpm.309
	%vtpm.311 = icmp eq %Foo* %vtpm.310, null
	br i1 %vtpm.311, label %abort, label %ok.4

ok.4:
	%vtpm.312 = getelementptr %Foo, %Foo* %vtpm.310, i32 0, i32 0
	%vtpm.313 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.312
	%vtpm.314 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.313, i32 0, i32 12
	%tmp.9 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.314
	%vtpm.315 = call i32(%Foo* ) %tmp.9( %Foo* %vtpm.310 )
	%vtpm.316 = add i32 %vtpm.307, %vtpm.315
	%vtpm.317 = load %Razz*, %Razz** %vtpm.211
	%vtpm.318 = icmp eq %Razz* %vtpm.317, null
	br i1 %vtpm.318, label %abort, label %ok.5

ok.5:
	%vtpm.319 = getelementptr %Razz, %Razz* %vtpm.317, i32 0, i32 0
	%vtpm.320 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.319
	%vtpm.321 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.320, i32 0, i32 12
	%tmp.10 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.321
	%vtpm.322 = call i32(%Razz* ) %tmp.10( %Razz* %vtpm.317 )
	%vtpm.323 = add i32 %vtpm.316, %vtpm.322
	%vtpm.324 = load %Razz*, %Razz** %vtpm.211
	%vtpm.325 = icmp eq %Razz* %vtpm.324, null
	br i1 %vtpm.325, label %abort, label %ok.6

ok.6:
	%vtpm.326 = getelementptr %Razz, %Razz* %vtpm.324, i32 0, i32 0
	%vtpm.327 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.326
	%vtpm.328 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.327, i32 0, i32 11
	%tmp.11 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.328
	%vtpm.329 = call i32(%Razz* ) %tmp.11( %Razz* %vtpm.324 )
	%vtpm.330 = add i32 %vtpm.323, %vtpm.329
	%vtpm.331 = load %Razz*, %Razz** %vtpm.211
	%vtpm.332 = getelementptr %Razz, %Razz* %vtpm.331, i32 0, i32 5
	store i32 %vtpm.330, i32* %vtpm.332
	%vtpm.333 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 6
	%vtpm.334 = load %Razz*, %Razz** %vtpm.211
	%tmp.12 = icmp eq %Razz* %vtpm.334, null
	br i1 %tmp.12, label %abort, label %ok.7

ok.7:
	%vtpm.335 = getelementptr %Razz, %Razz* %vtpm.334, i32 0, i32 0
	%vtpm.336 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.335
	%vtpm.337 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.336, i32 0, i32 0
	%vtpm.338 = load i32, i32* %vtpm.337
	br label %case.hdr.2

case.hdr.2:
	br label %case.8.2

case.8.2:
	%vtpm.339 = icmp slt i32 %vtpm.338, 8
	br i1 %vtpm.339, label %br_exit.8.2, label %src_gte_br.8.2

src_gte_br.8.2:
	%vtpm.340 = icmp sgt i32 %vtpm.338, 8
	br i1 %vtpm.340, label %br_exit.8.2, label %src_lte_mc.8.2

src_lte_mc.8.2:
	%vtpm.341 = bitcast %Razz* %vtpm.334 to %Bar*
	store %Bar* %vtpm.341, %Bar** %vtpm.220
	%vtpm.342 = load %Bar*, %Bar** %vtpm.220
	store %Bar* %vtpm.342, %Bar** %tmp.2
	br label %case.exit.2

br_exit.8.2:
	br label %case.7.2

case.7.2:
	%vtpm.343 = icmp slt i32 %vtpm.338, 7
	br i1 %vtpm.343, label %br_exit.7.2, label %src_gte_br.7.2

src_gte_br.7.2:
	%vtpm.344 = icmp sgt i32 %vtpm.338, 8
	br i1 %vtpm.344, label %br_exit.7.2, label %src_lte_mc.7.2

src_lte_mc.7.2:
	store %Razz* %vtpm.334, %Razz** %vtpm.219
	%vtpm.345 = call %Bar* @Bar_new(  )
	store %Bar* %vtpm.345, %Bar** %tmp.2
	br label %case.exit.2

br_exit.7.2:
	br label %abort

case.exit.2:
	%tmp.13 = load %Bar*, %Bar** %tmp.2
	%vtpm.346 = load %Razz*, %Razz** %vtpm.211
	%vtpm.347 = getelementptr %Razz, %Razz* %vtpm.346, i32 0, i32 6
	store %Bar* %tmp.13, %Bar** %vtpm.347
	%vtpm.348 = getelementptr %Razz, %Razz* %vtpm.224, i32 0, i32 7
	%vtpm.349 = load %Razz*, %Razz** %vtpm.211
	%vtpm.350 = getelementptr %Razz, %Razz* %vtpm.349, i32 0, i32 4
	%vtpm.351 = load %Razz*, %Razz** %vtpm.350
	%vtpm.352 = icmp eq %Razz* %vtpm.351, null
	br i1 %vtpm.352, label %abort, label %ok.8

ok.8:
	%vtpm.353 = getelementptr %_Bazz_vtable, %_Bazz_vtable* @_Bazz_vtable_prototype, i32 0, i32 12
	%tmp.14 = load i32 (%Bazz*) *, i32 (%Bazz*) ** %vtpm.353
	%vtpm.354 = bitcast %Razz* %vtpm.351 to %Bazz*
	%vtpm.355 = call i32(%Bazz* ) %tmp.14( %Bazz* %vtpm.354 )
	%vtpm.356 = load %Razz*, %Razz** %vtpm.211
	%vtpm.357 = getelementptr %Razz, %Razz* %vtpm.356, i32 0, i32 2
	%vtpm.358 = load %Foo*, %Foo** %vtpm.357
	%vtpm.359 = icmp eq %Foo* %vtpm.358, null
	br i1 %vtpm.359, label %abort, label %ok.9

ok.9:
	%vtpm.360 = getelementptr %Foo, %Foo* %vtpm.358, i32 0, i32 0
	%vtpm.361 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.360
	%vtpm.362 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.361, i32 0, i32 12
	%tmp.15 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.362
	%vtpm.363 = call i32(%Foo* ) %tmp.15( %Foo* %vtpm.358 )
	%vtpm.364 = add i32 %vtpm.355, %vtpm.363
	%vtpm.365 = load %Razz*, %Razz** %vtpm.211
	%vtpm.366 = getelementptr %Razz, %Razz* %vtpm.365, i32 0, i32 6
	%vtpm.367 = load %Bar*, %Bar** %vtpm.366
	%vtpm.368 = icmp eq %Bar* %vtpm.367, null
	br i1 %vtpm.368, label %abort, label %ok.10

ok.10:
	%vtpm.369 = getelementptr %Bar, %Bar* %vtpm.367, i32 0, i32 0
	%vtpm.370 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.369
	%vtpm.371 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.370, i32 0, i32 12
	%tmp.16 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.371
	%vtpm.372 = call i32(%Bar* ) %tmp.16( %Bar* %vtpm.367 )
	%vtpm.373 = add i32 %vtpm.364, %vtpm.372
	%vtpm.374 = load %Razz*, %Razz** %vtpm.211
	%vtpm.375 = icmp eq %Razz* %vtpm.374, null
	br i1 %vtpm.375, label %abort, label %ok.11

ok.11:
	%vtpm.376 = getelementptr %Razz, %Razz* %vtpm.374, i32 0, i32 0
	%vtpm.377 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.376
	%vtpm.378 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.377, i32 0, i32 12
	%tmp.17 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.378
	%vtpm.379 = call i32(%Razz* ) %tmp.17( %Razz* %vtpm.374 )
	%vtpm.380 = add i32 %vtpm.373, %vtpm.379
	%vtpm.381 = load %Razz*, %Razz** %vtpm.211
	%vtpm.382 = icmp eq %Razz* %vtpm.381, null
	br i1 %vtpm.382, label %abort, label %ok.12

ok.12:
	%vtpm.383 = getelementptr %Razz, %Razz* %vtpm.381, i32 0, i32 0
	%vtpm.384 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.383
	%vtpm.385 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.384, i32 0, i32 11
	%tmp.18 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.385
	%vtpm.386 = call i32(%Razz* ) %tmp.18( %Razz* %vtpm.381 )
	%vtpm.387 = add i32 %vtpm.380, %vtpm.386
	%vtpm.388 = load %Razz*, %Razz** %vtpm.211
	%vtpm.389 = getelementptr %Razz, %Razz* %vtpm.388, i32 0, i32 7
	store i32 %vtpm.387, i32* %vtpm.389
	ret %Razz* %vtpm.224

abort:
	call void @abort(  )
	unreachable
}

define %Bar* @Bar_new() {

entry:
	%vtpm.391 = alloca %Bar*
	%tmp.0 = alloca %Foo*
	%vtpm.392 = alloca %Bazz*
	%vtpm.393 = alloca %Razz*
	%vtpm.394 = alloca %Foo*
	%vtpm.395 = alloca %Bar*
	%tmp.1 = alloca %Bar*
	%vtpm.396 = alloca %Razz*
	%vtpm.397 = alloca %Foo*
	%vtpm.398 = alloca %Bar*
	%tmp.2 = alloca %Bar*
	%vtpm.399 = alloca %Razz*
	%vtpm.400 = alloca %Bar*
	%vtpm.401 = getelementptr %_Bar_vtable, %_Bar_vtable* @_Bar_vtable_prototype, i32 0, i32 1
	%vtpm.402 = load i32, i32* %vtpm.401
	%vtpm.403 = call i8*(i32 ) @malloc( i32 %vtpm.402 )
	%vtpm.404 = bitcast i8* %vtpm.403 to %Bar*
	%malloc.null = icmp eq %Bar* %vtpm.404, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.405 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 0
	store %_Bar_vtable* @_Bar_vtable_prototype, %_Bar_vtable** %vtpm.405
	store %Bar* %vtpm.404, %Bar** %vtpm.391
	%vtpm.406 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 1
	store i32 0, i32* %vtpm.406
	%vtpm.407 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 2
	store %Foo* null, %Foo** %vtpm.407
	%vtpm.408 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 3
	store %Object* null, %Object** %vtpm.408
	%vtpm.409 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 4
	store %Razz* null, %Razz** %vtpm.409
	%vtpm.410 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 5
	store i32 0, i32* %vtpm.410
	%vtpm.411 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 6
	store %Bar* null, %Bar** %vtpm.411
	%vtpm.412 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 7
	store i32 0, i32* %vtpm.412
	%vtpm.413 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 8
	store i32 0, i32* %vtpm.413
	%vtpm.414 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 9
	store %Object* null, %Object** %vtpm.414
	%vtpm.415 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 1
	%vtpm.416 = load %Bar*, %Bar** %vtpm.391
	%vtpm.417 = getelementptr %Bar, %Bar* %vtpm.416, i32 0, i32 1
	store i32 1, i32* %vtpm.417
	%vtpm.418 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 2
	%vtpm.419 = load %Bar*, %Bar** %vtpm.391
	%tmp.3 = icmp eq %Bar* %vtpm.419, null
	br i1 %tmp.3, label %abort, label %ok.0

ok.0:
	%vtpm.420 = getelementptr %Bar, %Bar* %vtpm.419, i32 0, i32 0
	%vtpm.421 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.420
	%vtpm.422 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.421, i32 0, i32 0
	%vtpm.423 = load i32, i32* %vtpm.422
	br label %case.hdr.0

case.hdr.0:
	br label %case.8.0

case.8.0:
	%vtpm.424 = icmp slt i32 %vtpm.423, 8
	br i1 %vtpm.424, label %br_exit.8.0, label %src_gte_br.8.0

src_gte_br.8.0:
	%vtpm.425 = icmp sgt i32 %vtpm.423, 8
	br i1 %vtpm.425, label %br_exit.8.0, label %src_lte_mc.8.0

src_lte_mc.8.0:
	store %Bar* %vtpm.419, %Bar** %vtpm.395
	%vtpm.426 = load %Bar*, %Bar** %vtpm.395
	%vtpm.427 = bitcast %Bar* %vtpm.426 to %Foo*
	store %Foo* %vtpm.427, %Foo** %tmp.0
	br label %case.exit.0

br_exit.8.0:
	br label %case.7.0

case.7.0:
	%vtpm.428 = icmp slt i32 %vtpm.423, 7
	br i1 %vtpm.428, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%vtpm.429 = icmp sgt i32 %vtpm.423, 8
	br i1 %vtpm.429, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%vtpm.430 = bitcast %Bar* %vtpm.419 to %Razz*
	store %Razz* %vtpm.430, %Razz** %vtpm.393
	%vtpm.431 = call %Bar* @Bar_new(  )
	%vtpm.432 = bitcast %Bar* %vtpm.431 to %Foo*
	store %Foo* %vtpm.432, %Foo** %tmp.0
	br label %case.exit.0

br_exit.7.0:
	br label %case.6.0

case.6.0:
	%vtpm.433 = icmp slt i32 %vtpm.423, 6
	br i1 %vtpm.433, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%vtpm.434 = icmp sgt i32 %vtpm.423, 8
	br i1 %vtpm.434, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%vtpm.435 = bitcast %Bar* %vtpm.419 to %Foo*
	store %Foo* %vtpm.435, %Foo** %vtpm.394
	%vtpm.436 = call %Razz* @Razz_new(  )
	%vtpm.437 = bitcast %Razz* %vtpm.436 to %Foo*
	store %Foo* %vtpm.437, %Foo** %tmp.0
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%vtpm.438 = icmp slt i32 %vtpm.423, 5
	br i1 %vtpm.438, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%vtpm.439 = icmp sgt i32 %vtpm.423, 8
	br i1 %vtpm.439, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	%vtpm.440 = bitcast %Bar* %vtpm.419 to %Bazz*
	store %Bazz* %vtpm.440, %Bazz** %vtpm.392
	%vtpm.441 = call %Foo* @Foo_new(  )
	store %Foo* %vtpm.441, %Foo** %tmp.0
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%tmp.4 = load %Foo*, %Foo** %tmp.0
	%vtpm.442 = load %Bar*, %Bar** %vtpm.391
	%vtpm.443 = getelementptr %Bar, %Bar* %vtpm.442, i32 0, i32 2
	store %Foo* %tmp.4, %Foo** %vtpm.443
	%vtpm.444 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 3
	%vtpm.445 = load %Bar*, %Bar** %vtpm.391
	%vtpm.446 = icmp eq %Bar* %vtpm.445, null
	br i1 %vtpm.446, label %abort, label %ok.1

ok.1:
	%vtpm.447 = getelementptr %Bar, %Bar* %vtpm.445, i32 0, i32 0
	%vtpm.448 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.447
	%vtpm.449 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.448, i32 0, i32 11
	%tmp.5 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.449
	%vtpm.450 = call i32(%Bar* ) %tmp.5( %Bar* %vtpm.445 )
	%vtpm.451 = load %Bar*, %Bar** %vtpm.391
	%vtpm.452 = getelementptr %Bar, %Bar* %vtpm.451, i32 0, i32 3
	%vtpm.453 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.453, i32 %vtpm.450 )
	%vtpm.455 = bitcast %Int* %vtpm.453 to %Object*
	store %Object* %vtpm.455, %Object** %vtpm.452
	%vtpm.456 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 4
	%vtpm.457 = load %Bar*, %Bar** %vtpm.391
	%tmp.6 = icmp eq %Bar* %vtpm.457, null
	br i1 %tmp.6, label %abort, label %ok.2

ok.2:
	%vtpm.458 = getelementptr %Bar, %Bar* %vtpm.457, i32 0, i32 0
	%vtpm.459 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.458
	%vtpm.460 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.459, i32 0, i32 0
	%vtpm.461 = load i32, i32* %vtpm.460
	br label %case.hdr.1

case.hdr.1:
	br label %case.8.1

case.8.1:
	%vtpm.462 = icmp slt i32 %vtpm.461, 8
	br i1 %vtpm.462, label %br_exit.8.1, label %src_gte_br.8.1

src_gte_br.8.1:
	%vtpm.463 = icmp sgt i32 %vtpm.461, 8
	br i1 %vtpm.463, label %br_exit.8.1, label %src_lte_mc.8.1

src_lte_mc.8.1:
	store %Bar* %vtpm.457, %Bar** %vtpm.398
	%vtpm.464 = load %Bar*, %Bar** %vtpm.398
	%vtpm.465 = bitcast %Bar* %vtpm.464 to %Razz*
	%vtpm.466 = bitcast %Razz* %vtpm.465 to %Bar*
	store %Bar* %vtpm.466, %Bar** %tmp.1
	br label %case.exit.1

br_exit.8.1:
	br label %case.7.1

case.7.1:
	%vtpm.467 = icmp slt i32 %vtpm.461, 7
	br i1 %vtpm.467, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%vtpm.468 = icmp sgt i32 %vtpm.461, 8
	br i1 %vtpm.468, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	%vtpm.469 = bitcast %Bar* %vtpm.457 to %Razz*
	store %Razz* %vtpm.469, %Razz** %vtpm.396
	%vtpm.470 = call %Bar* @Bar_new(  )
	%vtpm.471 = bitcast %Bar* %vtpm.470 to %Razz*
	%vtpm.472 = bitcast %Razz* %vtpm.471 to %Bar*
	store %Bar* %vtpm.472, %Bar** %tmp.1
	br label %case.exit.1

br_exit.7.1:
	br label %case.6.1

case.6.1:
	%vtpm.473 = icmp slt i32 %vtpm.461, 6
	br i1 %vtpm.473, label %br_exit.6.1, label %src_gte_br.6.1

src_gte_br.6.1:
	%vtpm.474 = icmp sgt i32 %vtpm.461, 8
	br i1 %vtpm.474, label %br_exit.6.1, label %src_lte_mc.6.1

src_lte_mc.6.1:
	%vtpm.475 = bitcast %Bar* %vtpm.457 to %Foo*
	store %Foo* %vtpm.475, %Foo** %vtpm.397
	%vtpm.476 = call %Razz* @Razz_new(  )
	%vtpm.477 = bitcast %Razz* %vtpm.476 to %Bar*
	store %Bar* %vtpm.477, %Bar** %tmp.1
	br label %case.exit.1

br_exit.6.1:
	br label %abort

case.exit.1:
	%tmp.7 = load %Bar*, %Bar** %tmp.1
	%vtpm.478 = load %Bar*, %Bar** %vtpm.391
	%vtpm.479 = getelementptr %Bar, %Bar* %vtpm.478, i32 0, i32 4
	%vtpm.480 = bitcast %Bar* %tmp.7 to %Razz*
	store %Razz* %vtpm.480, %Razz** %vtpm.479
	%vtpm.481 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 5
	%vtpm.482 = load %Bar*, %Bar** %vtpm.391
	%vtpm.483 = getelementptr %Bar, %Bar* %vtpm.482, i32 0, i32 4
	%vtpm.484 = load %Razz*, %Razz** %vtpm.483
	%vtpm.485 = icmp eq %Razz* %vtpm.484, null
	br i1 %vtpm.485, label %abort, label %ok.3

ok.3:
	%vtpm.486 = getelementptr %Razz, %Razz* %vtpm.484, i32 0, i32 0
	%vtpm.487 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.486
	%vtpm.488 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.487, i32 0, i32 12
	%tmp.8 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.488
	%vtpm.489 = call i32(%Razz* ) %tmp.8( %Razz* %vtpm.484 )
	%vtpm.490 = load %Bar*, %Bar** %vtpm.391
	%vtpm.491 = getelementptr %Bar, %Bar* %vtpm.490, i32 0, i32 2
	%vtpm.492 = load %Foo*, %Foo** %vtpm.491
	%vtpm.493 = icmp eq %Foo* %vtpm.492, null
	br i1 %vtpm.493, label %abort, label %ok.4

ok.4:
	%vtpm.494 = getelementptr %Foo, %Foo* %vtpm.492, i32 0, i32 0
	%vtpm.495 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.494
	%vtpm.496 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.495, i32 0, i32 12
	%tmp.9 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.496
	%vtpm.497 = call i32(%Foo* ) %tmp.9( %Foo* %vtpm.492 )
	%vtpm.498 = add i32 %vtpm.489, %vtpm.497
	%vtpm.499 = load %Bar*, %Bar** %vtpm.391
	%vtpm.500 = icmp eq %Bar* %vtpm.499, null
	br i1 %vtpm.500, label %abort, label %ok.5

ok.5:
	%vtpm.501 = getelementptr %Bar, %Bar* %vtpm.499, i32 0, i32 0
	%vtpm.502 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.501
	%vtpm.503 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.502, i32 0, i32 12
	%tmp.10 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.503
	%vtpm.504 = call i32(%Bar* ) %tmp.10( %Bar* %vtpm.499 )
	%vtpm.505 = add i32 %vtpm.498, %vtpm.504
	%vtpm.506 = load %Bar*, %Bar** %vtpm.391
	%vtpm.507 = icmp eq %Bar* %vtpm.506, null
	br i1 %vtpm.507, label %abort, label %ok.6

ok.6:
	%vtpm.508 = getelementptr %Bar, %Bar* %vtpm.506, i32 0, i32 0
	%vtpm.509 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.508
	%vtpm.510 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.509, i32 0, i32 11
	%tmp.11 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.510
	%vtpm.511 = call i32(%Bar* ) %tmp.11( %Bar* %vtpm.506 )
	%vtpm.512 = add i32 %vtpm.505, %vtpm.511
	%vtpm.513 = load %Bar*, %Bar** %vtpm.391
	%vtpm.514 = getelementptr %Bar, %Bar* %vtpm.513, i32 0, i32 5
	store i32 %vtpm.512, i32* %vtpm.514
	%vtpm.515 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 6
	%vtpm.516 = load %Bar*, %Bar** %vtpm.391
	%tmp.12 = icmp eq %Bar* %vtpm.516, null
	br i1 %tmp.12, label %abort, label %ok.7

ok.7:
	%vtpm.517 = getelementptr %Bar, %Bar* %vtpm.516, i32 0, i32 0
	%vtpm.518 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.517
	%vtpm.519 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.518, i32 0, i32 0
	%vtpm.520 = load i32, i32* %vtpm.519
	br label %case.hdr.2

case.hdr.2:
	br label %case.8.2

case.8.2:
	%vtpm.521 = icmp slt i32 %vtpm.520, 8
	br i1 %vtpm.521, label %br_exit.8.2, label %src_gte_br.8.2

src_gte_br.8.2:
	%vtpm.522 = icmp sgt i32 %vtpm.520, 8
	br i1 %vtpm.522, label %br_exit.8.2, label %src_lte_mc.8.2

src_lte_mc.8.2:
	store %Bar* %vtpm.516, %Bar** %vtpm.400
	%vtpm.523 = load %Bar*, %Bar** %vtpm.400
	store %Bar* %vtpm.523, %Bar** %tmp.2
	br label %case.exit.2

br_exit.8.2:
	br label %case.7.2

case.7.2:
	%vtpm.524 = icmp slt i32 %vtpm.520, 7
	br i1 %vtpm.524, label %br_exit.7.2, label %src_gte_br.7.2

src_gte_br.7.2:
	%vtpm.525 = icmp sgt i32 %vtpm.520, 8
	br i1 %vtpm.525, label %br_exit.7.2, label %src_lte_mc.7.2

src_lte_mc.7.2:
	%vtpm.526 = bitcast %Bar* %vtpm.516 to %Razz*
	store %Razz* %vtpm.526, %Razz** %vtpm.399
	%vtpm.527 = call %Bar* @Bar_new(  )
	store %Bar* %vtpm.527, %Bar** %tmp.2
	br label %case.exit.2

br_exit.7.2:
	br label %abort

case.exit.2:
	%tmp.13 = load %Bar*, %Bar** %tmp.2
	%vtpm.528 = load %Bar*, %Bar** %vtpm.391
	%vtpm.529 = getelementptr %Bar, %Bar* %vtpm.528, i32 0, i32 6
	store %Bar* %tmp.13, %Bar** %vtpm.529
	%vtpm.530 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 7
	%vtpm.531 = load %Bar*, %Bar** %vtpm.391
	%vtpm.532 = getelementptr %Bar, %Bar* %vtpm.531, i32 0, i32 4
	%vtpm.533 = load %Razz*, %Razz** %vtpm.532
	%vtpm.534 = icmp eq %Razz* %vtpm.533, null
	br i1 %vtpm.534, label %abort, label %ok.8

ok.8:
	%vtpm.535 = getelementptr %_Bazz_vtable, %_Bazz_vtable* @_Bazz_vtable_prototype, i32 0, i32 12
	%tmp.14 = load i32 (%Bazz*) *, i32 (%Bazz*) ** %vtpm.535
	%vtpm.536 = bitcast %Razz* %vtpm.533 to %Bazz*
	%vtpm.537 = call i32(%Bazz* ) %tmp.14( %Bazz* %vtpm.536 )
	%vtpm.538 = load %Bar*, %Bar** %vtpm.391
	%vtpm.539 = getelementptr %Bar, %Bar* %vtpm.538, i32 0, i32 2
	%vtpm.540 = load %Foo*, %Foo** %vtpm.539
	%vtpm.541 = icmp eq %Foo* %vtpm.540, null
	br i1 %vtpm.541, label %abort, label %ok.9

ok.9:
	%vtpm.542 = getelementptr %Foo, %Foo* %vtpm.540, i32 0, i32 0
	%vtpm.543 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.542
	%vtpm.544 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.543, i32 0, i32 12
	%tmp.15 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.544
	%vtpm.545 = call i32(%Foo* ) %tmp.15( %Foo* %vtpm.540 )
	%vtpm.546 = add i32 %vtpm.537, %vtpm.545
	%vtpm.547 = load %Bar*, %Bar** %vtpm.391
	%vtpm.548 = getelementptr %Bar, %Bar* %vtpm.547, i32 0, i32 6
	%vtpm.549 = load %Bar*, %Bar** %vtpm.548
	%vtpm.550 = icmp eq %Bar* %vtpm.549, null
	br i1 %vtpm.550, label %abort, label %ok.10

ok.10:
	%vtpm.551 = getelementptr %Bar, %Bar* %vtpm.549, i32 0, i32 0
	%vtpm.552 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.551
	%vtpm.553 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.552, i32 0, i32 12
	%tmp.16 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.553
	%vtpm.554 = call i32(%Bar* ) %tmp.16( %Bar* %vtpm.549 )
	%vtpm.555 = add i32 %vtpm.546, %vtpm.554
	%vtpm.556 = load %Bar*, %Bar** %vtpm.391
	%vtpm.557 = icmp eq %Bar* %vtpm.556, null
	br i1 %vtpm.557, label %abort, label %ok.11

ok.11:
	%vtpm.558 = getelementptr %Bar, %Bar* %vtpm.556, i32 0, i32 0
	%vtpm.559 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.558
	%vtpm.560 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.559, i32 0, i32 12
	%tmp.17 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.560
	%vtpm.561 = call i32(%Bar* ) %tmp.17( %Bar* %vtpm.556 )
	%vtpm.562 = add i32 %vtpm.555, %vtpm.561
	%vtpm.563 = load %Bar*, %Bar** %vtpm.391
	%vtpm.564 = icmp eq %Bar* %vtpm.563, null
	br i1 %vtpm.564, label %abort, label %ok.12

ok.12:
	%vtpm.565 = getelementptr %Bar, %Bar* %vtpm.563, i32 0, i32 0
	%vtpm.566 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.565
	%vtpm.567 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.566, i32 0, i32 11
	%tmp.18 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.567
	%vtpm.568 = call i32(%Bar* ) %tmp.18( %Bar* %vtpm.563 )
	%vtpm.569 = add i32 %vtpm.562, %vtpm.568
	%vtpm.570 = load %Bar*, %Bar** %vtpm.391
	%vtpm.571 = getelementptr %Bar, %Bar* %vtpm.570, i32 0, i32 7
	store i32 %vtpm.569, i32* %vtpm.571
	%vtpm.572 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 8
	%vtpm.573 = load %Bar*, %Bar** %vtpm.391
	%vtpm.574 = icmp eq %Bar* %vtpm.573, null
	br i1 %vtpm.574, label %abort, label %ok.13

ok.13:
	%vtpm.575 = getelementptr %Bar, %Bar* %vtpm.573, i32 0, i32 0
	%vtpm.576 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.575
	%vtpm.577 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.576, i32 0, i32 12
	%tmp.19 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.577
	%vtpm.578 = call i32(%Bar* ) %tmp.19( %Bar* %vtpm.573 )
	%vtpm.579 = load %Bar*, %Bar** %vtpm.391
	%vtpm.580 = getelementptr %Bar, %Bar* %vtpm.579, i32 0, i32 8
	store i32 %vtpm.578, i32* %vtpm.580
	%vtpm.581 = getelementptr %Bar, %Bar* %vtpm.404, i32 0, i32 9
	%vtpm.582 = load %Bar*, %Bar** %vtpm.391
	%vtpm.583 = icmp eq %Bar* %vtpm.582, null
	br i1 %vtpm.583, label %abort, label %ok.14

ok.14:
	%vtpm.584 = getelementptr %Bar, %Bar* %vtpm.582, i32 0, i32 0
	%vtpm.585 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.584
	%vtpm.586 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.585, i32 0, i32 11
	%tmp.20 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.586
	%vtpm.587 = call i32(%Bar* ) %tmp.20( %Bar* %vtpm.582 )
	%vtpm.588 = load %Bar*, %Bar** %vtpm.391
	%vtpm.589 = getelementptr %Bar, %Bar* %vtpm.588, i32 0, i32 9
	%vtpm.590 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.590, i32 %vtpm.587 )
	%vtpm.592 = bitcast %Int* %vtpm.590 to %Object*
	store %Object* %vtpm.592, %Object** %vtpm.589
	ret %Bar* %vtpm.404

abort:
	call void @abort(  )
	unreachable
}

define %String* @Main_main(%Main* %self) {

entry:
	%vtpm.594 = alloca %Main*
	store %Main* %self, %Main** %vtpm.594
	ret %String* @String.1

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.596 = alloca %Main*
	%vtpm.597 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.598 = load i32, i32* %vtpm.597
	%vtpm.599 = call i8*(i32 ) @malloc( i32 %vtpm.598 )
	%vtpm.600 = bitcast i8* %vtpm.599 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.600, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.601 = getelementptr %Main, %Main* %vtpm.600, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.601
	store %Main* %vtpm.600, %Main** %vtpm.596
	%vtpm.602 = getelementptr %Main, %Main* %vtpm.600, i32 0, i32 1
	store %Bazz* null, %Bazz** %vtpm.602
	%vtpm.603 = getelementptr %Main, %Main* %vtpm.600, i32 0, i32 2
	store %Foo* null, %Foo** %vtpm.603
	%vtpm.604 = getelementptr %Main, %Main* %vtpm.600, i32 0, i32 3
	store %Razz* null, %Razz** %vtpm.604
	%vtpm.605 = getelementptr %Main, %Main* %vtpm.600, i32 0, i32 4
	store %Bar* null, %Bar** %vtpm.605
	%vtpm.606 = getelementptr %Main, %Main* %vtpm.600, i32 0, i32 1
	%vtpm.607 = call %Bazz* @Bazz_new(  )
	%vtpm.608 = load %Main*, %Main** %vtpm.596
	%vtpm.609 = getelementptr %Main, %Main* %vtpm.608, i32 0, i32 1
	store %Bazz* %vtpm.607, %Bazz** %vtpm.609
	%vtpm.610 = getelementptr %Main, %Main* %vtpm.600, i32 0, i32 2
	%vtpm.611 = call %Foo* @Foo_new(  )
	%vtpm.612 = load %Main*, %Main** %vtpm.596
	%vtpm.613 = getelementptr %Main, %Main* %vtpm.612, i32 0, i32 2
	store %Foo* %vtpm.611, %Foo** %vtpm.613
	%vtpm.614 = getelementptr %Main, %Main* %vtpm.600, i32 0, i32 3
	%vtpm.615 = call %Razz* @Razz_new(  )
	%vtpm.616 = load %Main*, %Main** %vtpm.596
	%vtpm.617 = getelementptr %Main, %Main* %vtpm.616, i32 0, i32 3
	store %Razz* %vtpm.615, %Razz** %vtpm.617
	%vtpm.618 = getelementptr %Main, %Main* %vtpm.600, i32 0, i32 4
	%vtpm.619 = call %Bar* @Bar_new(  )
	%vtpm.620 = load %Main*, %Main** %vtpm.596
	%vtpm.621 = getelementptr %Main, %Main* %vtpm.620, i32 0, i32 4
	store %Bar* %vtpm.619, %Bar** %vtpm.621
	ret %Main* %vtpm.600

abort:
	call void @abort(  )
	unreachable
}

