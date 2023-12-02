declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
declare %Object* @Object_new()
declare %Object* @Object_abort(%Object*)
declare %String* @Object_type_name(%Object*)
declare %Object* @Object_copy(%Object*)
declare %IO* @IO_new()
declare %IO* @IO_out_string(%IO*, %String*)
declare %IO* @IO_out_int(%IO*, i32)
declare %String* @IO_in_string(%IO*)
declare i32 @IO_in_int(%IO*)
declare %String* @String_new()
declare i32 @String_length(%String*)
declare %String* @String_concat(%String*, %String*)
declare %String* @String_substr(%String*, i32, i32)
declare %Int* @Int_new()
declare void @Int_init(%Int*, i32)
declare %Bool* @Bool_new()
declare void @Bool_init(%Bool*, i1)
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
	%Object* (%Main*) * @Main.main
}

@str.3 = internal constant [14 x i8] c"<basic class>\00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.3, i32 0, i32 0)
}

@str.2 = internal constant [6 x i8] c"main\0A\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([6 x i8], [6 x i8]* @str.2, i32 0, i32 0)
}

@str.1 = internal constant [8 x i8] c"object\0A\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant [14 x i8] c"case-order.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.0, i32 0, i32 0)
}

define i32 @main() {
entry:
	%main.obj = call %Main*() @Main_new( )
	%main.retval = call %Object*(%Main*) @Main.main( %Main* %main.obj )
	ret i32 0
}

define %Object* @Main.main(%Main* %self) {

entry:
	%tmp.1 = alloca %Object*
	%tmp.2 = alloca %Main*
	%vtpm.0 = alloca %Object*
	%vtpm.1 = alloca %Main*
	%tmp.0 = alloca %Main*
	store %Main* %self, %Main** %tmp.0
	%tmp.3 = load %Main*, %Main** %tmp.0
	%tmp.4 = bitcast %Main* %tmp.3 to %Object*
	store %Object* %tmp.4, %Object** %tmp.1
	%tmp.5 = load %Object*, %Object** %tmp.1
	%tmp.6 = icmp eq %Object* %tmp.5, null
	br i1 %tmp.6, label %abort, label %ok.0

ok.0:
	%tmp.7 = getelementptr %Object, %Object* %tmp.5, i32 0, i32 0
	%tmp.8 = load %_Object_vtable*, %_Object_vtable** %tmp.7
	%tmp.9 = getelementptr %_Object_vtable, %_Object_vtable* %tmp.8, i32 0, i32 0
	%tmp.10 = load i32, i32* %tmp.9
	br label %case.hdr.0

case.hdr.0:
	br label %case.5.0

case.5.0:
	%vtpm.2 = icmp slt i32 %tmp.10, 5
	br i1 %vtpm.2, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%vtpm.3 = icmp sgt i32 %tmp.10, 5
	br i1 %vtpm.3, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	%tmp.11 = bitcast %Object* %tmp.5 to %Main*
	store %Main* %tmp.11, %Main** %vtpm.1
	%tmp.12 = load %Main*, %Main** %tmp.0
	%tmp.13 = icmp eq %Main* %tmp.12, null
	br i1 %tmp.13, label %abort, label %ok.1

ok.1:
	%tmp.14 = getelementptr %Main, %Main* %tmp.12, i32 0, i32 0
	%tmp.15 = load %_Main_vtable*, %_Main_vtable** %tmp.14
	%tmp.16 = getelementptr %_Main_vtable, %_Main_vtable* %tmp.15, i32 0, i32 7
	%tmp.17 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.16
	%tmp.18 = call %Main*(%Main*, %String* ) %tmp.17( %Main* %tmp.12, %String* @String.2 )
	store %Main* %tmp.18, %Main** %tmp.2
	br label %case.exit.0

br_exit.5.0:
	br label %case.0.0

case.0.0:
	%vtpm.4 = icmp slt i32 %tmp.10, 0
	br i1 %vtpm.4, label %br_exit.0.0, label %src_gte_br.0.0

src_gte_br.0.0:
	%vtpm.5 = icmp sgt i32 %tmp.10, 5
	br i1 %vtpm.5, label %br_exit.0.0, label %src_lte_mc.0.0

src_lte_mc.0.0:
	store %Object* %tmp.5, %Object** %vtpm.0
	%tmp.19 = load %Main*, %Main** %tmp.0
	%tmp.20 = icmp eq %Main* %tmp.19, null
	br i1 %tmp.20, label %abort, label %ok.2

ok.2:
	%tmp.21 = getelementptr %Main, %Main* %tmp.19, i32 0, i32 0
	%tmp.22 = load %_Main_vtable*, %_Main_vtable** %tmp.21
	%tmp.23 = getelementptr %_Main_vtable, %_Main_vtable* %tmp.22, i32 0, i32 7
	%tmp.24 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.23
	%tmp.25 = call %Main*(%Main*, %String* ) %tmp.24( %Main* %tmp.19, %String* @String.1 )
	store %Main* %tmp.25, %Main** %tmp.2
	br label %case.exit.0

br_exit.0.0:
	br label %abort

case.exit.0:
	%tmp.26 = load %Main*, %Main** %tmp.2
	%tmp.27 = bitcast %Main* %tmp.26 to %Object*
	ret %Object* %tmp.27

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%tmp.28 = alloca %Main*
	%tmp.29 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%tmp.30 = load i32, i32* %tmp.29
	%tmp.31 = call i8*(i32 ) @malloc( i32 %tmp.30 )
	%tmp.32 = bitcast i8* %tmp.31 to %Main*
	%malloc.null = icmp eq %Main* %tmp.32, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%tmp.33 = getelementptr %Main, %Main* %tmp.32, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %tmp.33
	store %Main* %tmp.32, %Main** %tmp.28
	ret %Main* %tmp.32

abort:
	call void @abort(  )
	unreachable
}

