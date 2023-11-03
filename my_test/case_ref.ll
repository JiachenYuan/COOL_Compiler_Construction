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

@str.A = internal constant [2 x i8] c"A\00"
%A = type {
	%_A_vtable*,
	i32,
	i1
}

%_A_vtable = type {
	i32,
	i32,
	i8*,
	%A* () *,
	%Object* (%A*) *,
	%String* (%A*) *,
	%A* (%A*) *
}

@_A_vtable_prototype = constant %_A_vtable {
	i32 5,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%A*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A*) *),
	%String* (%A*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A*) *),
	%A* (%A*) * bitcast (%Object* (%Object*) * @Object_copy to %A* (%A*) *)
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
	i1 (%Main*) *
}

@_Main_vtable_prototype = constant %_Main_vtable {
	i32 6,
	i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
	%Main* () * @Main_new,
	%Object* (%Main*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Main*) *),
	%String* (%Main*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Main*) *),
	%Main* (%Main*) * bitcast (%Object* (%Object*) * @Object_copy to %Main* (%Main*) *),
	i1 (%Main*) * @Main.main
}

@str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant [8 x i8] c"case.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.0, i32 0, i32 0)
}

define i32 @main() {
entry:
	%main.obj = call %Main*() @Main_new( )
	%main.retval = call i1(%Main*) @Main.main( %Main* %main.obj )
	ret i32 0
}

define %A* @A_new() {

entry:
	%tmp.0 = alloca %A*
	%tmp.1 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%tmp.2 = load i32, i32* %tmp.1
	%tmp.3 = call i8*(i32 ) @malloc( i32 %tmp.2 )
	%tmp.4 = bitcast i8* %tmp.3 to %A*
	%malloc.null = icmp eq %A* %tmp.4, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%tmp.5 = getelementptr %A, %A* %tmp.4, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %tmp.5
	store %A* %tmp.4, %A** %tmp.0
	%tmp.6 = getelementptr %A, %A* %tmp.4, i32 0, i32 1
	store i32 0, i32* %tmp.6
	%tmp.7 = getelementptr %A, %A* %tmp.4, i32 0, i32 2
	store i1 false, i1* %tmp.7
	%tmp.8 = getelementptr %A, %A* %tmp.4, i32 0, i32 1
	store i32 0, i32* %tmp.8
	%tmp.9 = getelementptr %A, %A* %tmp.4, i32 0, i32 2
	store i1 false, i1* %tmp.9
	ret %A* %tmp.4

abort:
	call void @abort(  )
	unreachable
}

define i1 @Main.main(%Main* %self) {

entry:
	%tmp.1 = alloca %Bool*
	%vtpm.0 = alloca %Main*
	%vtpm.1 = alloca %Object*
	%tmp.0 = alloca %Main*
	store %Main* %self, %Main** %tmp.0
	%tmp.2 = call %A* @A_new(  )
	%tmp.3 = icmp eq %A* %tmp.2, null
	br i1 %tmp.3, label %abort, label %ok.0

ok.0:
	%tmp.4 = getelementptr %A, %A* %tmp.2, i32 0, i32 0
	%tmp.5 = load %_A_vtable*, %_A_vtable** %tmp.4
	%tmp.6 = getelementptr %_A_vtable, %_A_vtable* %tmp.5, i32 0, i32 0
	%tmp.7 = load i32, i32* %tmp.6
	br label %case.hdr.0

case.hdr.0:
	br label %case.6.0

case.6.0:
	%vtpm.2 = icmp slt i32 %tmp.7, 6
	br i1 %vtpm.2, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%vtpm.3 = icmp sgt i32 %tmp.7, 6
	br i1 %vtpm.3, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%tmp.8 = bitcast %A* %tmp.2 to %Main*
	store %Main* %tmp.8, %Main** %vtpm.0
	%tmp.10 = call %Bool* @Bool_new(  )
	call void(%Bool*, i1 ) @Bool_init( %Bool* %tmp.10, i1 false )
	store %Bool* %tmp.10, %Bool** %tmp.1
	br label %case.exit.0

br_exit.6.0:
	br label %case.0.0

case.0.0:
	%vtpm.4 = icmp slt i32 %tmp.7, 0
	br i1 %vtpm.4, label %br_exit.0.0, label %src_gte_br.0.0

src_gte_br.0.0:
	%vtpm.5 = icmp sgt i32 %tmp.7, 6
	br i1 %vtpm.5, label %br_exit.0.0, label %src_lte_mc.0.0

src_lte_mc.0.0:
	%tmp.11 = bitcast %A* %tmp.2 to %Object*
	store %Object* %tmp.11, %Object** %vtpm.1
	%tmp.13 = call %Bool* @Bool_new(  )
	call void(%Bool*, i1 ) @Bool_init( %Bool* %tmp.13, i1 true )
	store %Bool* %tmp.13, %Bool** %tmp.1
	br label %case.exit.0

br_exit.0.0:
	br label %abort

case.exit.0:
	%tmp.14 = load %Bool*, %Bool** %tmp.1
	%tmp.16 = getelementptr %Bool, %Bool* %tmp.14, i32 0, i32 1
	%tmp.15 = load i1, i1* %tmp.16
	ret i1 %tmp.15

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%tmp.17 = alloca %Main*
	%tmp.18 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%tmp.19 = load i32, i32* %tmp.18
	%tmp.20 = call i8*(i32 ) @malloc( i32 %tmp.19 )
	%tmp.21 = bitcast i8* %tmp.20 to %Main*
	%malloc.null = icmp eq %Main* %tmp.21, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%tmp.22 = getelementptr %Main, %Main* %tmp.21, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %tmp.22
	store %Main* %tmp.21, %Main** %tmp.17
	ret %Main* %tmp.21

abort:
	call void @abort(  )
	unreachable
}

