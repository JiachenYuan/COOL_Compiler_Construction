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
	%Gamma*
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
	i32 (%Main*) *,
	i32 (%Main*) *
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
	i32 (%Main*) * @Main_func,
	i32 (%Main*) * @Main_main
}

@str.Gamma = internal constant [6 x i8] c"Gamma\00"
%Gamma = type {
	%_Gamma_vtable*
}

%_Gamma_vtable = type {
	i32,
	i32,
	i8*,
	%Gamma* () *,
	%Object* (%Gamma*) *,
	%String* (%Gamma*) *,
	%Gamma* (%Gamma*) *
}

@_Gamma_vtable_prototype = constant %_Gamma_vtable {
	i32 6,
	i32 ptrtoint (%Gamma* getelementptr (%Gamma, %Gamma* null, i32 1) to i32),
	i8* getelementptr ([6 x i8], [6 x i8]* @str.Gamma, i32 0, i32 0),
	%Gamma* () * @Gamma_new,
	%Object* (%Gamma*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Gamma*) *),
	%String* (%Gamma*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Gamma*) *),
	%Gamma* (%Gamma*) * bitcast (%Object* (%Object*) * @Object_copy to %Gamma* (%Gamma*) *)
}

@str.Beta = internal constant [5 x i8] c"Beta\00"
%Beta = type {
	%_Beta_vtable*
}

%_Beta_vtable = type {
	i32,
	i32,
	i8*,
	%Beta* () *,
	%Object* (%Beta*) *,
	%String* (%Beta*) *,
	%Beta* (%Beta*) *
}

@_Beta_vtable_prototype = constant %_Beta_vtable {
	i32 7,
	i32 ptrtoint (%Beta* getelementptr (%Beta, %Beta* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Beta, i32 0, i32 0),
	%Beta* () * @Beta_new,
	%Object* (%Beta*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Beta*) *),
	%String* (%Beta*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Beta*) *),
	%Beta* (%Beta*) * bitcast (%Object* (%Object*) * @Object_copy to %Beta* (%Beta*) *)
}

@str.Alpha = internal constant [6 x i8] c"Alpha\00"
%Alpha = type {
	%_Alpha_vtable*
}

%_Alpha_vtable = type {
	i32,
	i32,
	i8*,
	%Alpha* () *,
	%Object* (%Alpha*) *,
	%String* (%Alpha*) *,
	%Alpha* (%Alpha*) *
}

@_Alpha_vtable_prototype = constant %_Alpha_vtable {
	i32 8,
	i32 ptrtoint (%Alpha* getelementptr (%Alpha, %Alpha* null, i32 1) to i32),
	i8* getelementptr ([6 x i8], [6 x i8]* @str.Alpha, i32 0, i32 0),
	%Alpha* () * @Alpha_new,
	%Object* (%Alpha*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Alpha*) *),
	%String* (%Alpha*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Alpha*) *),
	%Alpha* (%Alpha*) * bitcast (%Object* (%Object*) * @Object_copy to %Alpha* (%Alpha*) *)
}

@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.0 = internal constant [14 x i8] c"typcase2_o.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.0, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main* @Main_new(  )
	%main.retval = call i32(%Main* ) @Main_main( %Main* %main.obj )
	ret i32 0
}

declare %Object* @Object_new()
declare %Int* @Int_new()
declare %Bool* @Bool_new()
declare %String* @String_new()
declare %IO* @IO_new()
define i32 @Main_func(%Main* %self) {

entry:
	%tmp.0 = alloca %Int*
	%vtpm.0 = alloca %Beta*
	%vtpm.1 = alloca %Alpha*
	%vtpm.2 = alloca %Gamma*
	%vtpm.3 = alloca %Object*
	%vtpm.4 = alloca %Main*
	store %Main* %self, %Main** %vtpm.4
	%vtpm.5 = load %Main*, %Main** %vtpm.4
	%vtpm.6 = getelementptr %Main, %Main* %vtpm.5, i32 0, i32 1
	%vtpm.7 = load %Gamma*, %Gamma** %vtpm.6
	%tmp.1 = icmp eq %Gamma* %vtpm.7, null
	br i1 %tmp.1, label %abort, label %ok.0

ok.0:
	%vtpm.8 = getelementptr %Gamma, %Gamma* %vtpm.7, i32 0, i32 0
	%vtpm.9 = load %_Gamma_vtable*, %_Gamma_vtable** %vtpm.8
	%vtpm.10 = getelementptr %_Gamma_vtable, %_Gamma_vtable* %vtpm.9, i32 0, i32 0
	%vtpm.11 = load i32, i32* %vtpm.10
	br label %case.hdr.0

case.hdr.0:
	br label %case.8.0

case.8.0:
	%vtpm.12 = icmp slt i32 %vtpm.11, 8
	br i1 %vtpm.12, label %br_exit.8.0, label %src_gte_br.8.0

src_gte_br.8.0:
	%vtpm.13 = icmp sgt i32 %vtpm.11, 8
	br i1 %vtpm.13, label %br_exit.8.0, label %src_lte_mc.8.0

src_lte_mc.8.0:
	%vtpm.14 = bitcast %Gamma* %vtpm.7 to %Alpha*
	store %Alpha* %vtpm.14, %Alpha** %vtpm.1
	%vtpm.15 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.15, i32 2 )
	store %Int* %vtpm.15, %Int** %tmp.0
	br label %case.exit.0

br_exit.8.0:
	br label %case.7.0

case.7.0:
	%vtpm.17 = icmp slt i32 %vtpm.11, 7
	br i1 %vtpm.17, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%vtpm.18 = icmp sgt i32 %vtpm.11, 8
	br i1 %vtpm.18, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%vtpm.19 = bitcast %Gamma* %vtpm.7 to %Beta*
	store %Beta* %vtpm.19, %Beta** %vtpm.0
	%vtpm.20 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.20, i32 1 )
	store %Int* %vtpm.20, %Int** %tmp.0
	br label %case.exit.0

br_exit.7.0:
	br label %case.6.0

case.6.0:
	%vtpm.22 = icmp slt i32 %vtpm.11, 6
	br i1 %vtpm.22, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%vtpm.23 = icmp sgt i32 %vtpm.11, 8
	br i1 %vtpm.23, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	store %Gamma* %vtpm.7, %Gamma** %vtpm.2
	%vtpm.24 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.24, i32 3 )
	store %Int* %vtpm.24, %Int** %tmp.0
	br label %case.exit.0

br_exit.6.0:
	br label %case.0.0

case.0.0:
	%vtpm.26 = icmp slt i32 %vtpm.11, 0
	br i1 %vtpm.26, label %br_exit.0.0, label %src_gte_br.0.0

src_gte_br.0.0:
	%vtpm.27 = icmp sgt i32 %vtpm.11, 8
	br i1 %vtpm.27, label %br_exit.0.0, label %src_lte_mc.0.0

src_lte_mc.0.0:
	%vtpm.28 = bitcast %Gamma* %vtpm.7 to %Object*
	store %Object* %vtpm.28, %Object** %vtpm.3
	%vtpm.29 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.29, i32 0 )
	store %Int* %vtpm.29, %Int** %tmp.0
	br label %case.exit.0

br_exit.0.0:
	br label %abort

case.exit.0:
	%tmp.2 = load %Int*, %Int** %tmp.0
	%vtpm.31 = getelementptr %Int, %Int* %tmp.2, i32 0, i32 1
	%vtpm.32 = load i32, i32* %vtpm.31
	ret i32 %vtpm.32

abort:
	call void @abort(  )
	unreachable
}

define i32 @Main_main(%Main* %self) {

entry:
	%vtpm.34 = alloca %Main*
	store %Main* %self, %Main** %vtpm.34
	%vtpm.35 = load %Main*, %Main** %vtpm.34
	%vtpm.36 = icmp eq %Main* %vtpm.35, null
	br i1 %vtpm.36, label %abort, label %ok.0

ok.0:
	%vtpm.37 = getelementptr %Main, %Main* %vtpm.35, i32 0, i32 0
	%vtpm.38 = load %_Main_vtable*, %_Main_vtable** %vtpm.37
	%vtpm.39 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.38, i32 0, i32 11
	%tmp.0 = load i32 (%Main*) *, i32 (%Main*) ** %vtpm.39
	%vtpm.40 = call i32(%Main* ) %tmp.0( %Main* %vtpm.35 )
	%vtpm.41 = load %Main*, %Main** %vtpm.34
	%vtpm.42 = icmp eq %Main* %vtpm.41, null
	br i1 %vtpm.42, label %abort, label %ok.1

ok.1:
	%vtpm.43 = getelementptr %Main, %Main* %vtpm.41, i32 0, i32 0
	%vtpm.44 = load %_Main_vtable*, %_Main_vtable** %vtpm.43
	%vtpm.45 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.44, i32 0, i32 8
	%tmp.1 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.45
	%vtpm.46 = call %Main*(%Main*, i32 ) %tmp.1( %Main* %vtpm.41, i32 %vtpm.40 )
	ret i32 0

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.48 = alloca %Main*
	%vtpm.49 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.50 = load i32, i32* %vtpm.49
	%vtpm.51 = call i8*(i32 ) @malloc( i32 %vtpm.50 )
	%vtpm.52 = bitcast i8* %vtpm.51 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.52, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.53 = getelementptr %Main, %Main* %vtpm.52, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.53
	store %Main* %vtpm.52, %Main** %vtpm.48
	%vtpm.54 = getelementptr %Main, %Main* %vtpm.52, i32 0, i32 1
	store %Gamma* null, %Gamma** %vtpm.54
	%vtpm.55 = getelementptr %Main, %Main* %vtpm.52, i32 0, i32 1
	%vtpm.56 = call %Alpha* @Alpha_new(  )
	%vtpm.57 = load %Main*, %Main** %vtpm.48
	%vtpm.58 = getelementptr %Main, %Main* %vtpm.57, i32 0, i32 1
	%vtpm.59 = bitcast %Alpha* %vtpm.56 to %Gamma*
	store %Gamma* %vtpm.59, %Gamma** %vtpm.58
	ret %Main* %vtpm.52

abort:
	call void @abort(  )
	unreachable
}

define %Gamma* @Gamma_new() {

entry:
	%vtpm.61 = alloca %Gamma*
	%vtpm.62 = getelementptr %_Gamma_vtable, %_Gamma_vtable* @_Gamma_vtable_prototype, i32 0, i32 1
	%vtpm.63 = load i32, i32* %vtpm.62
	%vtpm.64 = call i8*(i32 ) @malloc( i32 %vtpm.63 )
	%vtpm.65 = bitcast i8* %vtpm.64 to %Gamma*
	%malloc.null = icmp eq %Gamma* %vtpm.65, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.66 = getelementptr %Gamma, %Gamma* %vtpm.65, i32 0, i32 0
	store %_Gamma_vtable* @_Gamma_vtable_prototype, %_Gamma_vtable** %vtpm.66
	store %Gamma* %vtpm.65, %Gamma** %vtpm.61
	ret %Gamma* %vtpm.65

abort:
	call void @abort(  )
	unreachable
}

define %Beta* @Beta_new() {

entry:
	%vtpm.68 = alloca %Beta*
	%vtpm.69 = getelementptr %_Beta_vtable, %_Beta_vtable* @_Beta_vtable_prototype, i32 0, i32 1
	%vtpm.70 = load i32, i32* %vtpm.69
	%vtpm.71 = call i8*(i32 ) @malloc( i32 %vtpm.70 )
	%vtpm.72 = bitcast i8* %vtpm.71 to %Beta*
	%malloc.null = icmp eq %Beta* %vtpm.72, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.73 = getelementptr %Beta, %Beta* %vtpm.72, i32 0, i32 0
	store %_Beta_vtable* @_Beta_vtable_prototype, %_Beta_vtable** %vtpm.73
	store %Beta* %vtpm.72, %Beta** %vtpm.68
	ret %Beta* %vtpm.72

abort:
	call void @abort(  )
	unreachable
}

define %Alpha* @Alpha_new() {

entry:
	%vtpm.75 = alloca %Alpha*
	%vtpm.76 = getelementptr %_Alpha_vtable, %_Alpha_vtable* @_Alpha_vtable_prototype, i32 0, i32 1
	%vtpm.77 = load i32, i32* %vtpm.76
	%vtpm.78 = call i8*(i32 ) @malloc( i32 %vtpm.77 )
	%vtpm.79 = bitcast i8* %vtpm.78 to %Alpha*
	%malloc.null = icmp eq %Alpha* %vtpm.79, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.80 = getelementptr %Alpha, %Alpha* %vtpm.79, i32 0, i32 0
	store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.80
	store %Alpha* %vtpm.79, %Alpha** %vtpm.75
	ret %Alpha* %vtpm.79

abort:
	call void @abort(  )
	unreachable
}

