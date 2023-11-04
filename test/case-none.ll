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

@global_str.3 = internal constant [14 x i8] c"<basic class>\00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.3, i32 0, i32 0)
}

@global_str.1 = internal constant [5 x i8] c"int\0A\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([5 x i8], [5 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.2 = internal constant [6 x i8] c"bool\0A\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([6 x i8], [6 x i8]* @global_str.2, i32 0, i32 0)
}

@global_str.0 = internal constant [13 x i8] c"case-none.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @global_str.0, i32 0, i32 0)
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
	%vtpm.0 = alloca %Object*
	%tmp.0 = alloca %Main*
	%vtpm.1 = alloca i32
	%vtpm.2 = alloca i1
	%vtpm.3 = alloca %Main*
	store %Main* %self, %Main** %vtpm.3
	%vtpm.4 = load %Main*, %Main** %vtpm.3
	%vtpm.5 = bitcast %Main* %vtpm.4 to %Object*
	store %Object* %vtpm.5, %Object** %vtpm.0
	%vtpm.6 = load %Object*, %Object** %vtpm.0
	%tmp.1 = icmp eq %Object* %vtpm.6, null
	br i1 %tmp.1, label %abort, label %ok.0

ok.0:
	%vtpm.7 = getelementptr %Object, %Object* %vtpm.6, i32 0, i32 0
	%vtpm.8 = load %_Object_vtable*, %_Object_vtable** %vtpm.7
	%vtpm.9 = getelementptr %_Object_vtable, %_Object_vtable* %vtpm.8, i32 0, i32 0
	%vtpm.10 = load i32, i32* %vtpm.9
	br label %case.hdr.0

case.hdr.0:
	br label %case.2.0

case.2.0:
	%vtpm.11 = icmp slt i32 %vtpm.10, 2
	br i1 %vtpm.11, label %br_exit.2.0, label %src_gte_br.2.0

src_gte_br.2.0:
	%vtpm.12 = icmp sgt i32 %vtpm.10, 2
	br i1 %vtpm.12, label %br_exit.2.0, label %src_lte_mc.2.0

src_lte_mc.2.0:
	%vtpm.13 = bitcast %Object* %vtpm.6 to %Bool*
	%vtpm.14 = getelementptr %Bool, %Bool* %vtpm.13, i32 0, i32 1
	%vtpm.15 = load i1, i1* %vtpm.14
	store i1 %vtpm.15, i1* %vtpm.2
	%vtpm.16 = load %Main*, %Main** %vtpm.3
	%vtpm.17 = icmp eq %Main* %vtpm.16, null
	br i1 %vtpm.17, label %abort, label %ok.1

ok.1:
	%vtpm.18 = getelementptr %Main, %Main* %vtpm.16, i32 0, i32 0
	%vtpm.19 = load %_Main_vtable*, %_Main_vtable** %vtpm.18
	%vtpm.20 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.19, i32 0, i32 7
	%tmp.2 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.20
	%vtpm.21 = call %Main*(%Main*, %String* ) %tmp.2( %Main* %vtpm.16, %String* @String.2 )
	store %Main* %vtpm.21, %Main** %tmp.0
	br label %case.exit.0

br_exit.2.0:
	br label %case.1.0

case.1.0:
	%vtpm.22 = icmp slt i32 %vtpm.10, 1
	br i1 %vtpm.22, label %br_exit.1.0, label %src_gte_br.1.0

src_gte_br.1.0:
	%vtpm.23 = icmp sgt i32 %vtpm.10, 1
	br i1 %vtpm.23, label %br_exit.1.0, label %src_lte_mc.1.0

src_lte_mc.1.0:
	%vtpm.24 = bitcast %Object* %vtpm.6 to %Int*
	%vtpm.25 = getelementptr %Int, %Int* %vtpm.24, i32 0, i32 1
	%vtpm.26 = load i32, i32* %vtpm.25
	store i32 %vtpm.26, i32* %vtpm.1
	%vtpm.27 = load %Main*, %Main** %vtpm.3
	%vtpm.28 = icmp eq %Main* %vtpm.27, null
	br i1 %vtpm.28, label %abort, label %ok.2

ok.2:
	%vtpm.29 = getelementptr %Main, %Main* %vtpm.27, i32 0, i32 0
	%vtpm.30 = load %_Main_vtable*, %_Main_vtable** %vtpm.29
	%vtpm.31 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.30, i32 0, i32 7
	%tmp.3 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.31
	%vtpm.32 = call %Main*(%Main*, %String* ) %tmp.3( %Main* %vtpm.27, %String* @String.1 )
	store %Main* %vtpm.32, %Main** %tmp.0
	br label %case.exit.0

br_exit.1.0:
	br label %abort

case.exit.0:
	%tmp.4 = load %Main*, %Main** %tmp.0
	%vtpm.33 = bitcast %Main* %tmp.4 to %Object*
	ret %Object* %vtpm.33

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.35 = alloca %Main*
	%vtpm.36 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.37 = load i32, i32* %vtpm.36
	%vtpm.38 = call i8*(i32 ) @malloc( i32 %vtpm.37 )
	%vtpm.39 = bitcast i8* %vtpm.38 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.39, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.40 = getelementptr %Main, %Main* %vtpm.39, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.40
	store %Main* %vtpm.39, %Main** %vtpm.35
	ret %Main* %vtpm.39

abort:
	call void @abort(  )
	unreachable
}

