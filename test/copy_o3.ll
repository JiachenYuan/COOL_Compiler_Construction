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
	%_A_vtable*,
	i32,
	i1,
	%String*,
	i32
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

@str.AA = internal constant [3 x i8] c"AA\00"
%AA = type {
	%_AA_vtable*,
	i32,
	i1,
	%String*,
	i32,
	i1,
	i32
}

%_AA_vtable = type {
	i32,
	i32,
	i8*,
	%AA* () *,
	%Object* (%AA*) *,
	%String* (%AA*) *,
	%AA* (%AA*) *,
	i32 (%AA*,i32) *,
	i32 (%AA*) *
}

@_AA_vtable_prototype = constant %_AA_vtable {
	i32 7,
	i32 ptrtoint (%AA* getelementptr (%AA, %AA* null, i32 1) to i32),
	i8* getelementptr ([3 x i8], [3 x i8]* @str.AA, i32 0, i32 0),
	%AA* () * @AA_new,
	%Object* (%AA*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%AA*) *),
	%String* (%AA*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%AA*) *),
	%AA* (%AA*) * bitcast (%Object* (%Object*) * @Object_copy to %AA* (%AA*) *),
	i32 (%AA*,i32) * @AA_set,
	i32 (%AA*) * @AA_get
}

@global_str.3 = internal constant [14 x i8] c"<basic class>\00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.3, i32 0, i32 0)
}

@global_str.2 = internal constant [8 x i8] c"Error2\0A\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @global_str.2, i32 0, i32 0)
}

@global_str.1 = internal constant [8 x i8] c"Error1\0A\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.0 = internal constant [11 x i8] c"copy_o3.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([11 x i8], [11 x i8]* @global_str.0, i32 0, i32 0)
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
	%vtpm.0 = alloca %A*
	%vtpm.1 = alloca %A*
	%tmp.0 = alloca %Int*
	%vtpm.2 = alloca %AA*
	%vtpm.3 = alloca %Object*
	%tmp.1 = alloca %Main*
	%vtpm.4 = alloca %AA*
	%vtpm.5 = alloca %Object*
	%vtpm.6 = alloca %Main*
	store %Main* %self, %Main** %vtpm.6
	store %A* null, %A** %vtpm.0
	store %A* null, %A** %vtpm.1
	%vtpm.7 = call %AA* @AA_new(  )
	%vtpm.8 = bitcast %AA* %vtpm.7 to %A*
	store %A* %vtpm.8, %A** %vtpm.0
	%vtpm.9 = load %A*, %A** %vtpm.0
	%tmp.2 = icmp eq %A* %vtpm.9, null
	br i1 %tmp.2, label %abort, label %ok.0

ok.0:
	%vtpm.10 = getelementptr %A, %A* %vtpm.9, i32 0, i32 0
	%vtpm.11 = load %_A_vtable*, %_A_vtable** %vtpm.10
	%vtpm.12 = getelementptr %_A_vtable, %_A_vtable* %vtpm.11, i32 0, i32 0
	%vtpm.13 = load i32, i32* %vtpm.12
	br label %case.hdr.0

case.hdr.0:
	br label %case.7.0

case.7.0:
	%vtpm.14 = icmp slt i32 %vtpm.13, 7
	br i1 %vtpm.14, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%vtpm.15 = icmp sgt i32 %vtpm.13, 7
	br i1 %vtpm.15, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%vtpm.16 = bitcast %A* %vtpm.9 to %AA*
	store %AA* %vtpm.16, %AA** %vtpm.2
	%vtpm.17 = load %AA*, %AA** %vtpm.2
	%vtpm.18 = icmp eq %AA* %vtpm.17, null
	br i1 %vtpm.18, label %abort, label %ok.1

ok.1:
	%vtpm.19 = getelementptr %AA, %AA* %vtpm.17, i32 0, i32 0
	%vtpm.20 = load %_AA_vtable*, %_AA_vtable** %vtpm.19
	%vtpm.21 = getelementptr %_AA_vtable, %_AA_vtable* %vtpm.20, i32 0, i32 7
	%tmp.3 = load i32 (%AA*,i32) *, i32 (%AA*,i32) ** %vtpm.21
	%vtpm.22 = call i32(%AA*, i32 ) %tmp.3( %AA* %vtpm.17, i32 42 )
	%vtpm.23 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.23, i32 %vtpm.22 )
	%vtpm.25 = bitcast %Int* %vtpm.23 to %Object*
	%vtpm.26 = bitcast %Object* %vtpm.25 to %Int*
	store %Int* %vtpm.26, %Int** %tmp.0
	br label %case.exit.0

br_exit.7.0:
	br label %case.0.0

case.0.0:
	%vtpm.27 = icmp slt i32 %vtpm.13, 0
	br i1 %vtpm.27, label %br_exit.0.0, label %src_gte_br.0.0

src_gte_br.0.0:
	%vtpm.28 = icmp sgt i32 %vtpm.13, 7
	br i1 %vtpm.28, label %br_exit.0.0, label %src_lte_mc.0.0

src_lte_mc.0.0:
	%vtpm.29 = bitcast %A* %vtpm.9 to %Object*
	store %Object* %vtpm.29, %Object** %vtpm.3
	%vtpm.30 = load %Main*, %Main** %vtpm.6
	%vtpm.31 = icmp eq %Main* %vtpm.30, null
	br i1 %vtpm.31, label %abort, label %ok.2

ok.2:
	%vtpm.32 = getelementptr %Main, %Main* %vtpm.30, i32 0, i32 0
	%vtpm.33 = load %_Main_vtable*, %_Main_vtable** %vtpm.32
	%vtpm.34 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.33, i32 0, i32 7
	%tmp.4 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.34
	%vtpm.35 = call %Main*(%Main*, %String* ) %tmp.4( %Main* %vtpm.30, %String* @String.1 )
	%vtpm.36 = bitcast %Main* %vtpm.35 to %Object*
	%vtpm.37 = bitcast %Object* %vtpm.36 to %Int*
	store %Int* %vtpm.37, %Int** %tmp.0
	br label %case.exit.0

br_exit.0.0:
	br label %abort

case.exit.0:
	%tmp.5 = load %Int*, %Int** %tmp.0
	%vtpm.38 = load %A*, %A** %vtpm.0
	%vtpm.39 = icmp eq %A* %vtpm.38, null
	br i1 %vtpm.39, label %abort, label %ok.3

ok.3:
	%vtpm.40 = getelementptr %A, %A* %vtpm.38, i32 0, i32 0
	%vtpm.41 = load %_A_vtable*, %_A_vtable** %vtpm.40
	%vtpm.42 = getelementptr %_A_vtable, %_A_vtable* %vtpm.41, i32 0, i32 6
	%tmp.6 = load %A* (%A*) *, %A* (%A*) ** %vtpm.42
	%vtpm.43 = call %A*(%A* ) %tmp.6( %A* %vtpm.38 )
	store %A* %vtpm.43, %A** %vtpm.1
	%vtpm.44 = load %A*, %A** %vtpm.1
	%tmp.7 = icmp eq %A* %vtpm.44, null
	br i1 %tmp.7, label %abort, label %ok.4

ok.4:
	%vtpm.45 = getelementptr %A, %A* %vtpm.44, i32 0, i32 0
	%vtpm.46 = load %_A_vtable*, %_A_vtable** %vtpm.45
	%vtpm.47 = getelementptr %_A_vtable, %_A_vtable* %vtpm.46, i32 0, i32 0
	%vtpm.48 = load i32, i32* %vtpm.47
	br label %case.hdr.1

case.hdr.1:
	br label %case.7.1

case.7.1:
	%vtpm.49 = icmp slt i32 %vtpm.48, 7
	br i1 %vtpm.49, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%vtpm.50 = icmp sgt i32 %vtpm.48, 7
	br i1 %vtpm.50, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	%vtpm.51 = bitcast %A* %vtpm.44 to %AA*
	store %AA* %vtpm.51, %AA** %vtpm.4
	%vtpm.52 = load %AA*, %AA** %vtpm.4
	%vtpm.53 = icmp eq %AA* %vtpm.52, null
	br i1 %vtpm.53, label %abort, label %ok.5

ok.5:
	%vtpm.54 = getelementptr %AA, %AA* %vtpm.52, i32 0, i32 0
	%vtpm.55 = load %_AA_vtable*, %_AA_vtable** %vtpm.54
	%vtpm.56 = getelementptr %_AA_vtable, %_AA_vtable* %vtpm.55, i32 0, i32 8
	%tmp.8 = load i32 (%AA*) *, i32 (%AA*) ** %vtpm.56
	%vtpm.57 = call i32(%AA* ) %tmp.8( %AA* %vtpm.52 )
	%vtpm.58 = load %Main*, %Main** %vtpm.6
	%vtpm.59 = icmp eq %Main* %vtpm.58, null
	br i1 %vtpm.59, label %abort, label %ok.6

ok.6:
	%vtpm.60 = getelementptr %Main, %Main* %vtpm.58, i32 0, i32 0
	%vtpm.61 = load %_Main_vtable*, %_Main_vtable** %vtpm.60
	%vtpm.62 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.61, i32 0, i32 8
	%tmp.9 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.62
	%vtpm.63 = call %Main*(%Main*, i32 ) %tmp.9( %Main* %vtpm.58, i32 %vtpm.57 )
	store %Main* %vtpm.63, %Main** %tmp.1
	br label %case.exit.1

br_exit.7.1:
	br label %case.0.1

case.0.1:
	%vtpm.64 = icmp slt i32 %vtpm.48, 0
	br i1 %vtpm.64, label %br_exit.0.1, label %src_gte_br.0.1

src_gte_br.0.1:
	%vtpm.65 = icmp sgt i32 %vtpm.48, 7
	br i1 %vtpm.65, label %br_exit.0.1, label %src_lte_mc.0.1

src_lte_mc.0.1:
	%vtpm.66 = bitcast %A* %vtpm.44 to %Object*
	store %Object* %vtpm.66, %Object** %vtpm.5
	%vtpm.67 = load %Main*, %Main** %vtpm.6
	%vtpm.68 = icmp eq %Main* %vtpm.67, null
	br i1 %vtpm.68, label %abort, label %ok.7

ok.7:
	%vtpm.69 = getelementptr %Main, %Main* %vtpm.67, i32 0, i32 0
	%vtpm.70 = load %_Main_vtable*, %_Main_vtable** %vtpm.69
	%vtpm.71 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.70, i32 0, i32 7
	%tmp.10 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.71
	%vtpm.72 = call %Main*(%Main*, %String* ) %tmp.10( %Main* %vtpm.67, %String* @String.2 )
	store %Main* %vtpm.72, %Main** %tmp.1
	br label %case.exit.1

br_exit.0.1:
	br label %abort

case.exit.1:
	%tmp.11 = load %Main*, %Main** %tmp.1
	%vtpm.73 = load %Main*, %Main** %vtpm.6
	ret %Main* %vtpm.73

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.75 = alloca %Main*
	%vtpm.76 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.77 = load i32, i32* %vtpm.76
	%vtpm.78 = call i8*(i32 ) @malloc( i32 %vtpm.77 )
	%vtpm.79 = bitcast i8* %vtpm.78 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.79, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.80 = getelementptr %Main, %Main* %vtpm.79, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.80
	store %Main* %vtpm.79, %Main** %vtpm.75
	ret %Main* %vtpm.79

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%vtpm.82 = alloca %A*
	%vtpm.83 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%vtpm.84 = load i32, i32* %vtpm.83
	%vtpm.85 = call i8*(i32 ) @malloc( i32 %vtpm.84 )
	%vtpm.86 = bitcast i8* %vtpm.85 to %A*
	%malloc.null = icmp eq %A* %vtpm.86, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.87 = getelementptr %A, %A* %vtpm.86, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.87
	store %A* %vtpm.86, %A** %vtpm.82
	%vtpm.88 = getelementptr %A, %A* %vtpm.86, i32 0, i32 1
	store i32 0, i32* %vtpm.88
	%vtpm.89 = getelementptr %A, %A* %vtpm.86, i32 0, i32 2
	store i1 false, i1* %vtpm.89
	%vtpm.90 = getelementptr %A, %A* %vtpm.86, i32 0, i32 3
	store %String* null, %String** %vtpm.90
	%vtpm.91 = getelementptr %A, %A* %vtpm.86, i32 0, i32 4
	store i32 0, i32* %vtpm.91
	%vtpm.92 = getelementptr %A, %A* %vtpm.86, i32 0, i32 1
	store i32 0, i32* %vtpm.92
	%vtpm.93 = getelementptr %A, %A* %vtpm.86, i32 0, i32 2
	store i1 false, i1* %vtpm.93
	%vtpm.94 = getelementptr %A, %A* %vtpm.86, i32 0, i32 3
	store %String* null, %String** %vtpm.94
	%vtpm.95 = getelementptr %A, %A* %vtpm.86, i32 0, i32 4
	store i32 0, i32* %vtpm.95
	ret %A* %vtpm.86

abort:
	call void @abort(  )
	unreachable
}

define i32 @AA_get(%AA* %self) {

entry:
	%vtpm.97 = alloca %AA*
	store %AA* %self, %AA** %vtpm.97
	%vtpm.98 = load %AA*, %AA** %vtpm.97
	%vtpm.99 = getelementptr %AA, %AA* %vtpm.98, i32 0, i32 6
	%vtpm.100 = load i32, i32* %vtpm.99
	ret i32 %vtpm.100

abort:
	call void @abort(  )
	unreachable
}

define i32 @AA_set(%AA* %self, i32 %x) {

entry:
	%vtpm.102 = alloca %AA*
	%vtpm.103 = alloca i32
	store %AA* %self, %AA** %vtpm.102
	store i32 %x, i32* %vtpm.103
	%vtpm.104 = load i32, i32* %vtpm.103
	%vtpm.105 = load %AA*, %AA** %vtpm.102
	%vtpm.106 = getelementptr %AA, %AA* %vtpm.105, i32 0, i32 6
	store i32 %vtpm.104, i32* %vtpm.106
	ret i32 %vtpm.104

abort:
	call void @abort(  )
	unreachable
}

define %AA* @AA_new() {

entry:
	%vtpm.108 = alloca %AA*
	%vtpm.109 = getelementptr %_AA_vtable, %_AA_vtable* @_AA_vtable_prototype, i32 0, i32 1
	%vtpm.110 = load i32, i32* %vtpm.109
	%vtpm.111 = call i8*(i32 ) @malloc( i32 %vtpm.110 )
	%vtpm.112 = bitcast i8* %vtpm.111 to %AA*
	%malloc.null = icmp eq %AA* %vtpm.112, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.113 = getelementptr %AA, %AA* %vtpm.112, i32 0, i32 0
	store %_AA_vtable* @_AA_vtable_prototype, %_AA_vtable** %vtpm.113
	store %AA* %vtpm.112, %AA** %vtpm.108
	%vtpm.114 = getelementptr %AA, %AA* %vtpm.112, i32 0, i32 1
	store i32 0, i32* %vtpm.114
	%vtpm.115 = getelementptr %AA, %AA* %vtpm.112, i32 0, i32 2
	store i1 false, i1* %vtpm.115
	%vtpm.116 = getelementptr %AA, %AA* %vtpm.112, i32 0, i32 3
	store %String* null, %String** %vtpm.116
	%vtpm.117 = getelementptr %AA, %AA* %vtpm.112, i32 0, i32 4
	store i32 0, i32* %vtpm.117
	%vtpm.118 = getelementptr %AA, %AA* %vtpm.112, i32 0, i32 5
	store i1 false, i1* %vtpm.118
	%vtpm.119 = getelementptr %AA, %AA* %vtpm.112, i32 0, i32 6
	store i32 0, i32* %vtpm.119
	%vtpm.120 = getelementptr %AA, %AA* %vtpm.112, i32 0, i32 1
	store i32 0, i32* %vtpm.120
	%vtpm.121 = getelementptr %AA, %AA* %vtpm.112, i32 0, i32 2
	store i1 false, i1* %vtpm.121
	%vtpm.122 = getelementptr %AA, %AA* %vtpm.112, i32 0, i32 3
	store %String* null, %String** %vtpm.122
	%vtpm.123 = getelementptr %AA, %AA* %vtpm.112, i32 0, i32 4
	store i32 0, i32* %vtpm.123
	%vtpm.124 = getelementptr %AA, %AA* %vtpm.112, i32 0, i32 5
	store i1 false, i1* %vtpm.124
	%vtpm.125 = getelementptr %AA, %AA* %vtpm.112, i32 0, i32 6
	store i32 0, i32* %vtpm.125
	ret %AA* %vtpm.112

abort:
	call void @abort(  )
	unreachable
}

