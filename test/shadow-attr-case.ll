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
	%String*
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

@global_str.4 = internal constant [14 x i8] c"<basic class>\00"
@String.4 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.4, i32 0, i32 0)
}

@global_str.3 = internal constant [2 x i8] c"\0A\00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @global_str.3, i32 0, i32 0)
}

@global_str.2 = internal constant [5 x i8] c"good\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([5 x i8], [5 x i8]* @global_str.2, i32 0, i32 0)
}

@global_str.1 = internal constant [4 x i8] c"bad\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([4 x i8], [4 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.0 = internal constant [20 x i8] c"shadow-attr-case.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([20 x i8], [20 x i8]* @global_str.0, i32 0, i32 0)
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
	%tmp.0 = alloca %Main*
	%vtpm.0 = alloca %String*
	%vtpm.1 = alloca %Main*
	store %Main* %self, %Main** %vtpm.1
	%tmp.1 = icmp eq %String* @String.2, null
	br i1 %tmp.1, label %abort, label %ok.0

ok.0:
	%vtpm.2 = getelementptr %String, %String* @String.2, i32 0, i32 0
	%vtpm.3 = load %_String_vtable*, %_String_vtable** %vtpm.2
	%vtpm.4 = getelementptr %_String_vtable, %_String_vtable* %vtpm.3, i32 0, i32 0
	%vtpm.5 = load i32, i32* %vtpm.4
	br label %case.hdr.0

case.hdr.0:
	br label %case.3.0

case.3.0:
	%vtpm.6 = icmp slt i32 %vtpm.5, 3
	br i1 %vtpm.6, label %br_exit.3.0, label %src_gte_br.3.0

src_gte_br.3.0:
	%vtpm.7 = icmp sgt i32 %vtpm.5, 3
	br i1 %vtpm.7, label %br_exit.3.0, label %src_lte_mc.3.0

src_lte_mc.3.0:
	store %String* @String.2, %String** %vtpm.0
	%vtpm.8 = load %String*, %String** %vtpm.0
	%vtpm.9 = load %Main*, %Main** %vtpm.1
	%vtpm.10 = icmp eq %Main* %vtpm.9, null
	br i1 %vtpm.10, label %abort, label %ok.1

ok.1:
	%vtpm.11 = getelementptr %Main, %Main* %vtpm.9, i32 0, i32 0
	%vtpm.12 = load %_Main_vtable*, %_Main_vtable** %vtpm.11
	%vtpm.13 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.12, i32 0, i32 7
	%tmp.2 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.13
	%vtpm.14 = call %Main*(%Main*, %String* ) %tmp.2( %Main* %vtpm.9, %String* %vtpm.8 )
	store %Main* %vtpm.14, %Main** %tmp.0
	br label %case.exit.0

br_exit.3.0:
	br label %abort

case.exit.0:
	%tmp.3 = load %Main*, %Main** %tmp.0
	%vtpm.15 = load %Main*, %Main** %vtpm.1
	%vtpm.16 = icmp eq %Main* %vtpm.15, null
	br i1 %vtpm.16, label %abort, label %ok.2

ok.2:
	%vtpm.17 = getelementptr %Main, %Main* %vtpm.15, i32 0, i32 0
	%vtpm.18 = load %_Main_vtable*, %_Main_vtable** %vtpm.17
	%vtpm.19 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.18, i32 0, i32 7
	%tmp.4 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.19
	%vtpm.20 = call %Main*(%Main*, %String* ) %tmp.4( %Main* %vtpm.15, %String* @String.3 )
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
	%vtpm.29 = getelementptr %Main, %Main* %vtpm.27, i32 0, i32 1
	store %String* null, %String** %vtpm.29
	%vtpm.30 = getelementptr %Main, %Main* %vtpm.27, i32 0, i32 1
	%vtpm.31 = load %Main*, %Main** %vtpm.23
	%vtpm.32 = getelementptr %Main, %Main* %vtpm.31, i32 0, i32 1
	store %String* @String.1, %String** %vtpm.32
	ret %Main* %vtpm.27

abort:
	call void @abort(  )
	unreachable
}

