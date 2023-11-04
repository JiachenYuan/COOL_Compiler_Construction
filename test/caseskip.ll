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
	%A* (%A*) *
}

@_A_vtable_prototype = constant %_A_vtable {
	i32 6,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%A*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A*) *),
	%String* (%A*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A*) *),
	%A* (%A*) * bitcast (%Object* (%Object*) * @Object_copy to %A* (%A*) *)
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
	%B* (%B*) *
}

@_B_vtable_prototype = constant %_B_vtable {
	i32 7,
	i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0),
	%B* () * @B_new,
	%Object* (%B*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%B*) *),
	%String* (%B*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%B*) *),
	%B* (%B*) * bitcast (%Object* (%Object*) * @Object_copy to %B* (%B*) *)
}

@str.B1 = internal constant [3 x i8] c"B1\00"
%B1 = type {
	%_B1_vtable*
}

%_B1_vtable = type {
	i32,
	i32,
	i8*,
	%B1* () *,
	%Object* (%B1*) *,
	%String* (%B1*) *,
	%B1* (%B1*) *
}

@_B1_vtable_prototype = constant %_B1_vtable {
	i32 8,
	i32 ptrtoint (%B1* getelementptr (%B1, %B1* null, i32 1) to i32),
	i8* getelementptr ([3 x i8], [3 x i8]* @str.B1, i32 0, i32 0),
	%B1* () * @B1_new,
	%Object* (%B1*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%B1*) *),
	%String* (%B1*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%B1*) *),
	%B1* (%B1*) * bitcast (%Object* (%Object*) * @Object_copy to %B1* (%B1*) *)
}

@str.B2 = internal constant [3 x i8] c"B2\00"
%B2 = type {
	%_B2_vtable*
}

%_B2_vtable = type {
	i32,
	i32,
	i8*,
	%B2* () *,
	%Object* (%B2*) *,
	%String* (%B2*) *,
	%B2* (%B2*) *
}

@_B2_vtable_prototype = constant %_B2_vtable {
	i32 9,
	i32 ptrtoint (%B2* getelementptr (%B2, %B2* null, i32 1) to i32),
	i8* getelementptr ([3 x i8], [3 x i8]* @str.B2, i32 0, i32 0),
	%B2* () * @B2_new,
	%Object* (%B2*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%B2*) *),
	%String* (%B2*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%B2*) *),
	%B2* (%B2*) * bitcast (%Object* (%Object*) * @Object_copy to %B2* (%B2*) *)
}

@str.E = internal constant [2 x i8] c"E\00"
%E = type {
	%_E_vtable*
}

%_E_vtable = type {
	i32,
	i32,
	i8*,
	%E* () *,
	%Object* (%E*) *,
	%String* (%E*) *,
	%E* (%E*) *
}

@_E_vtable_prototype = constant %_E_vtable {
	i32 10,
	i32 ptrtoint (%E* getelementptr (%E, %E* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.E, i32 0, i32 0),
	%E* () * @E_new,
	%Object* (%E*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%E*) *),
	%String* (%E*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%E*) *),
	%E* (%E*) * bitcast (%Object* (%Object*) * @Object_copy to %E* (%E*) *)
}

@str.F = internal constant [2 x i8] c"F\00"
%F = type {
	%_F_vtable*
}

%_F_vtable = type {
	i32,
	i32,
	i8*,
	%F* () *,
	%Object* (%F*) *,
	%String* (%F*) *,
	%F* (%F*) *
}

@_F_vtable_prototype = constant %_F_vtable {
	i32 11,
	i32 ptrtoint (%F* getelementptr (%F, %F* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.F, i32 0, i32 0),
	%F* () * @F_new,
	%Object* (%F*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%F*) *),
	%String* (%F*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%F*) *),
	%F* (%F*) * bitcast (%Object* (%Object*) * @Object_copy to %F* (%F*) *)
}

@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.0 = internal constant [12 x i8] c"caseskip.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([12 x i8], [12 x i8]* @global_str.0, i32 0, i32 0)
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
	%vtpm.0 = alloca %B*
	%vtpm.1 = alloca %Object*
	%vtpm.2 = alloca i32
	%tmp.0 = alloca %Int*
	%vtpm.3 = alloca %A*
	%vtpm.4 = alloca %B1*
	%vtpm.5 = alloca %E*
	%vtpm.6 = alloca %Main*
	store %Main* %self, %Main** %vtpm.6
	%vtpm.7 = call %B* @B_new(  )
	store %B* %vtpm.7, %B** %vtpm.0
	store %Object* null, %Object** %vtpm.1
	store i32 0, i32* %vtpm.2
	%vtpm.8 = load %B*, %B** %vtpm.0
	%tmp.1 = icmp eq %B* %vtpm.8, null
	br i1 %tmp.1, label %abort, label %ok.0

ok.0:
	%vtpm.9 = getelementptr %B, %B* %vtpm.8, i32 0, i32 0
	%vtpm.10 = load %_B_vtable*, %_B_vtable** %vtpm.9
	%vtpm.11 = getelementptr %_B_vtable, %_B_vtable* %vtpm.10, i32 0, i32 0
	%vtpm.12 = load i32, i32* %vtpm.11
	br label %case.hdr.0

case.hdr.0:
	br label %case.10.0

case.10.0:
	%vtpm.13 = icmp slt i32 %vtpm.12, 10
	br i1 %vtpm.13, label %br_exit.10.0, label %src_gte_br.10.0

src_gte_br.10.0:
	%vtpm.14 = icmp sgt i32 %vtpm.12, 10
	br i1 %vtpm.14, label %br_exit.10.0, label %src_lte_mc.10.0

src_lte_mc.10.0:
	%vtpm.15 = bitcast %B* %vtpm.8 to %E*
	store %E* %vtpm.15, %E** %vtpm.5
	%vtpm.16 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.16, i32 17 )
	store %Int* %vtpm.16, %Int** %tmp.0
	br label %case.exit.0

br_exit.10.0:
	br label %case.8.0

case.8.0:
	%vtpm.18 = icmp slt i32 %vtpm.12, 8
	br i1 %vtpm.18, label %br_exit.8.0, label %src_gte_br.8.0

src_gte_br.8.0:
	%vtpm.19 = icmp sgt i32 %vtpm.12, 8
	br i1 %vtpm.19, label %br_exit.8.0, label %src_lte_mc.8.0

src_lte_mc.8.0:
	%vtpm.20 = bitcast %B* %vtpm.8 to %B1*
	store %B1* %vtpm.20, %B1** %vtpm.4
	%vtpm.21 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.21, i32 3 )
	store %Int* %vtpm.21, %Int** %tmp.0
	br label %case.exit.0

br_exit.8.0:
	br label %case.6.0

case.6.0:
	%vtpm.23 = icmp slt i32 %vtpm.12, 6
	br i1 %vtpm.23, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%vtpm.24 = icmp sgt i32 %vtpm.12, 11
	br i1 %vtpm.24, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%vtpm.25 = bitcast %B* %vtpm.8 to %A*
	store %A* %vtpm.25, %A** %vtpm.3
	%vtpm.26 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.26, i32 2 )
	store %Int* %vtpm.26, %Int** %tmp.0
	br label %case.exit.0

br_exit.6.0:
	br label %abort

case.exit.0:
	%tmp.2 = load %Int*, %Int** %tmp.0
	%vtpm.28 = load %Main*, %Main** %vtpm.6
	%vtpm.29 = icmp eq %Main* %vtpm.28, null
	br i1 %vtpm.29, label %abort, label %ok.1

ok.1:
	%vtpm.30 = getelementptr %Main, %Main* %vtpm.28, i32 0, i32 0
	%vtpm.31 = load %_Main_vtable*, %_Main_vtable** %vtpm.30
	%vtpm.32 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.31, i32 0, i32 8
	%tmp.3 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.32
	%vtpm.33 = getelementptr %Int, %Int* %tmp.2, i32 0, i32 1
	%vtpm.34 = load i32, i32* %vtpm.33
	%vtpm.35 = call %Main*(%Main*, i32 ) %tmp.3( %Main* %vtpm.28, i32 %vtpm.34 )
	%vtpm.36 = bitcast %Main* %vtpm.35 to %Object*
	ret %Object* %vtpm.36

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.38 = alloca %Main*
	%vtpm.39 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.40 = load i32, i32* %vtpm.39
	%vtpm.41 = call i8*(i32 ) @malloc( i32 %vtpm.40 )
	%vtpm.42 = bitcast i8* %vtpm.41 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.42, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.43 = getelementptr %Main, %Main* %vtpm.42, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.43
	store %Main* %vtpm.42, %Main** %vtpm.38
	ret %Main* %vtpm.42

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%vtpm.45 = alloca %A*
	%vtpm.46 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%vtpm.47 = load i32, i32* %vtpm.46
	%vtpm.48 = call i8*(i32 ) @malloc( i32 %vtpm.47 )
	%vtpm.49 = bitcast i8* %vtpm.48 to %A*
	%malloc.null = icmp eq %A* %vtpm.49, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.50 = getelementptr %A, %A* %vtpm.49, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.50
	store %A* %vtpm.49, %A** %vtpm.45
	ret %A* %vtpm.49

abort:
	call void @abort(  )
	unreachable
}

define %B* @B_new() {

entry:
	%vtpm.52 = alloca %B*
	%vtpm.53 = getelementptr %_B_vtable, %_B_vtable* @_B_vtable_prototype, i32 0, i32 1
	%vtpm.54 = load i32, i32* %vtpm.53
	%vtpm.55 = call i8*(i32 ) @malloc( i32 %vtpm.54 )
	%vtpm.56 = bitcast i8* %vtpm.55 to %B*
	%malloc.null = icmp eq %B* %vtpm.56, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.57 = getelementptr %B, %B* %vtpm.56, i32 0, i32 0
	store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.57
	store %B* %vtpm.56, %B** %vtpm.52
	ret %B* %vtpm.56

abort:
	call void @abort(  )
	unreachable
}

define %B1* @B1_new() {

entry:
	%vtpm.59 = alloca %B1*
	%vtpm.60 = getelementptr %_B1_vtable, %_B1_vtable* @_B1_vtable_prototype, i32 0, i32 1
	%vtpm.61 = load i32, i32* %vtpm.60
	%vtpm.62 = call i8*(i32 ) @malloc( i32 %vtpm.61 )
	%vtpm.63 = bitcast i8* %vtpm.62 to %B1*
	%malloc.null = icmp eq %B1* %vtpm.63, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.64 = getelementptr %B1, %B1* %vtpm.63, i32 0, i32 0
	store %_B1_vtable* @_B1_vtable_prototype, %_B1_vtable** %vtpm.64
	store %B1* %vtpm.63, %B1** %vtpm.59
	ret %B1* %vtpm.63

abort:
	call void @abort(  )
	unreachable
}

define %B2* @B2_new() {

entry:
	%vtpm.66 = alloca %B2*
	%vtpm.67 = getelementptr %_B2_vtable, %_B2_vtable* @_B2_vtable_prototype, i32 0, i32 1
	%vtpm.68 = load i32, i32* %vtpm.67
	%vtpm.69 = call i8*(i32 ) @malloc( i32 %vtpm.68 )
	%vtpm.70 = bitcast i8* %vtpm.69 to %B2*
	%malloc.null = icmp eq %B2* %vtpm.70, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.71 = getelementptr %B2, %B2* %vtpm.70, i32 0, i32 0
	store %_B2_vtable* @_B2_vtable_prototype, %_B2_vtable** %vtpm.71
	store %B2* %vtpm.70, %B2** %vtpm.66
	ret %B2* %vtpm.70

abort:
	call void @abort(  )
	unreachable
}

define %E* @E_new() {

entry:
	%vtpm.73 = alloca %E*
	%vtpm.74 = getelementptr %_E_vtable, %_E_vtable* @_E_vtable_prototype, i32 0, i32 1
	%vtpm.75 = load i32, i32* %vtpm.74
	%vtpm.76 = call i8*(i32 ) @malloc( i32 %vtpm.75 )
	%vtpm.77 = bitcast i8* %vtpm.76 to %E*
	%malloc.null = icmp eq %E* %vtpm.77, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.78 = getelementptr %E, %E* %vtpm.77, i32 0, i32 0
	store %_E_vtable* @_E_vtable_prototype, %_E_vtable** %vtpm.78
	store %E* %vtpm.77, %E** %vtpm.73
	ret %E* %vtpm.77

abort:
	call void @abort(  )
	unreachable
}

define %F* @F_new() {

entry:
	%vtpm.80 = alloca %F*
	%vtpm.81 = getelementptr %_F_vtable, %_F_vtable* @_F_vtable_prototype, i32 0, i32 1
	%vtpm.82 = load i32, i32* %vtpm.81
	%vtpm.83 = call i8*(i32 ) @malloc( i32 %vtpm.82 )
	%vtpm.84 = bitcast i8* %vtpm.83 to %F*
	%malloc.null = icmp eq %F* %vtpm.84, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.85 = getelementptr %F, %F* %vtpm.84, i32 0, i32 0
	store %_F_vtable* @_F_vtable_prototype, %_F_vtable** %vtpm.85
	store %F* %vtpm.84, %F** %vtpm.80
	ret %F* %vtpm.84

abort:
	call void @abort(  )
	unreachable
}

