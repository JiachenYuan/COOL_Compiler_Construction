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

@str.Book = internal constant [5 x i8] c"Book\00"
%Book = type {
	%_Book_vtable*,
	%String*,
	%String*
}

%_Book_vtable = type {
	i32,
	i32,
	i8*,
	%Book* () *,
	%Object* (%Book*) *,
	%String* (%Book*) *,
	%Book* (%Book*) *,
	%Book* (%Book*,%String*) *,
	%Book* (%Book*,i32) *,
	%String* (%Book*) *,
	i32 (%Book*) *,
	%Book* (%Book*,%String*,%String*) *,
	%Object* (%Book*) *,
	%String* (%Book*,%String*) *
}

@_Book_vtable_prototype = constant %_Book_vtable {
	i32 5,
	i32 ptrtoint (%Book* getelementptr (%Book, %Book* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Book, i32 0, i32 0),
	%Book* () * @Book_new,
	%Object* (%Book*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Book*) *),
	%String* (%Book*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Book*) *),
	%Book* (%Book*) * bitcast (%Object* (%Object*) * @Object_copy to %Book* (%Book*) *),
	%Book* (%Book*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Book* (%Book*,%String*) *),
	%Book* (%Book*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Book* (%Book*,i32) *),
	%String* (%Book*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Book*) *),
	i32 (%Book*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Book*) *),
	%Book* (%Book*,%String*,%String*) * @Book_initBook,
	%Object* (%Book*) * @Book_getSelf,
	%String* (%Book*,%String*) * @Book_print
}

@str.Article = internal constant [8 x i8] c"Article\00"
%Article = type {
	%_Article_vtable*,
	%String*,
	%String*,
	%String*
}

%_Article_vtable = type {
	i32,
	i32,
	i8*,
	%Article* () *,
	%Object* (%Article*) *,
	%String* (%Article*) *,
	%Article* (%Article*) *,
	%Article* (%Article*,%String*) *,
	%Article* (%Article*,i32) *,
	%String* (%Article*) *,
	i32 (%Article*) *,
	%Book* (%Article*,%String*,%String*) *,
	%Object* (%Article*) *,
	%String* (%Article*,%String*) *,
	%Article* (%Article*,%String*,%String*,%String*) *
}

@_Article_vtable_prototype = constant %_Article_vtable {
	i32 6,
	i32 ptrtoint (%Article* getelementptr (%Article, %Article* null, i32 1) to i32),
	i8* getelementptr ([8 x i8], [8 x i8]* @str.Article, i32 0, i32 0),
	%Article* () * @Article_new,
	%Object* (%Article*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Article*) *),
	%String* (%Article*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Article*) *),
	%Article* (%Article*) * bitcast (%Object* (%Object*) * @Object_copy to %Article* (%Article*) *),
	%Article* (%Article*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Article* (%Article*,%String*) *),
	%Article* (%Article*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Article* (%Article*,i32) *),
	%String* (%Article*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Article*) *),
	i32 (%Article*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Article*) *),
	%Book* (%Article*,%String*,%String*) * bitcast (%Book* (%Book*,%String*,%String*) * @Book_initBook to %Book* (%Article*,%String*,%String*) *),
	%Object* (%Article*) * @Article_getSelf,
	%String* (%Article*,%String*) * @Article_print,
	%Article* (%Article*,%String*,%String*,%String*) * @Article_initArticle
}

@str.BookList = internal constant [9 x i8] c"BookList\00"
%BookList = type {
	%_BookList_vtable*
}

%_BookList_vtable = type {
	i32,
	i32,
	i8*,
	%BookList* () *,
	%Object* (%BookList*) *,
	%String* (%BookList*) *,
	%BookList* (%BookList*) *,
	%BookList* (%BookList*,%String*) *,
	%BookList* (%BookList*,i32) *,
	%String* (%BookList*) *,
	i32 (%BookList*) *,
	i1 (%BookList*) *,
	%Cons* (%BookList*,%Book*) *,
	%Book* (%BookList*) *,
	%BookList* (%BookList*) *,
	%String* (%BookList*,%String*) *
}

@_BookList_vtable_prototype = constant %_BookList_vtable {
	i32 7,
	i32 ptrtoint (%BookList* getelementptr (%BookList, %BookList* null, i32 1) to i32),
	i8* getelementptr ([9 x i8], [9 x i8]* @str.BookList, i32 0, i32 0),
	%BookList* () * @BookList_new,
	%Object* (%BookList*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%BookList*) *),
	%String* (%BookList*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%BookList*) *),
	%BookList* (%BookList*) * bitcast (%Object* (%Object*) * @Object_copy to %BookList* (%BookList*) *),
	%BookList* (%BookList*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %BookList* (%BookList*,%String*) *),
	%BookList* (%BookList*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %BookList* (%BookList*,i32) *),
	%String* (%BookList*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%BookList*) *),
	i32 (%BookList*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%BookList*) *),
	i1 (%BookList*) * @BookList_isNil,
	%Cons* (%BookList*,%Book*) * @BookList_cons,
	%Book* (%BookList*) * @BookList_car,
	%BookList* (%BookList*) * @BookList_cdr,
	%String* (%BookList*,%String*) * @BookList_print_list
}

@str.Cons = internal constant [5 x i8] c"Cons\00"
%Cons = type {
	%_Cons_vtable*,
	%Book*,
	%BookList*
}

%_Cons_vtable = type {
	i32,
	i32,
	i8*,
	%Cons* () *,
	%Object* (%Cons*) *,
	%String* (%Cons*) *,
	%Cons* (%Cons*) *,
	%Cons* (%Cons*,%String*) *,
	%Cons* (%Cons*,i32) *,
	%String* (%Cons*) *,
	i32 (%Cons*) *,
	i1 (%Cons*) *,
	%Cons* (%Cons*,%Book*) *,
	%Book* (%Cons*) *,
	%BookList* (%Cons*) *,
	%String* (%Cons*,%String*) *,
	%Cons* (%Cons*,%Book*,%BookList*) *
}

@_Cons_vtable_prototype = constant %_Cons_vtable {
	i32 8,
	i32 ptrtoint (%Cons* getelementptr (%Cons, %Cons* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Cons, i32 0, i32 0),
	%Cons* () * @Cons_new,
	%Object* (%Cons*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Cons*) *),
	%String* (%Cons*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Cons*) *),
	%Cons* (%Cons*) * bitcast (%Object* (%Object*) * @Object_copy to %Cons* (%Cons*) *),
	%Cons* (%Cons*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Cons* (%Cons*,%String*) *),
	%Cons* (%Cons*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Cons* (%Cons*,i32) *),
	%String* (%Cons*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Cons*) *),
	i32 (%Cons*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Cons*) *),
	i1 (%Cons*) * @Cons_isNil,
	%Cons* (%Cons*,%Book*) * bitcast (%Cons* (%BookList*,%Book*) * @BookList_cons to %Cons* (%Cons*,%Book*) *),
	%Book* (%Cons*) * @Cons_car,
	%BookList* (%Cons*) * @Cons_cdr,
	%String* (%Cons*,%String*) * @Cons_print_list,
	%Cons* (%Cons*,%Book*,%BookList*) * @Cons_init
}

@str.Nil = internal constant [4 x i8] c"Nil\00"
%Nil = type {
	%_Nil_vtable*
}

%_Nil_vtable = type {
	i32,
	i32,
	i8*,
	%Nil* () *,
	%Object* (%Nil*) *,
	%String* (%Nil*) *,
	%Nil* (%Nil*) *,
	%Nil* (%Nil*,%String*) *,
	%Nil* (%Nil*,i32) *,
	%String* (%Nil*) *,
	i32 (%Nil*) *,
	i1 (%Nil*) *,
	%Cons* (%Nil*,%Book*) *,
	%Book* (%Nil*) *,
	%BookList* (%Nil*) *,
	%String* (%Nil*,%String*) *
}

@_Nil_vtable_prototype = constant %_Nil_vtable {
	i32 9,
	i32 ptrtoint (%Nil* getelementptr (%Nil, %Nil* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Nil, i32 0, i32 0),
	%Nil* () * @Nil_new,
	%Object* (%Nil*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Nil*) *),
	%String* (%Nil*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Nil*) *),
	%Nil* (%Nil*) * bitcast (%Object* (%Object*) * @Object_copy to %Nil* (%Nil*) *),
	%Nil* (%Nil*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Nil* (%Nil*,%String*) *),
	%Nil* (%Nil*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Nil* (%Nil*,i32) *),
	%String* (%Nil*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Nil*) *),
	i32 (%Nil*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Nil*) *),
	i1 (%Nil*) * @Nil_isNil,
	%Cons* (%Nil*,%Book*) * bitcast (%Cons* (%BookList*,%Book*) * @BookList_cons to %Cons* (%Nil*,%Book*) *),
	%Book* (%Nil*) * bitcast (%Book* (%BookList*) * @BookList_car to %Book* (%Nil*) *),
	%BookList* (%Nil*) * bitcast (%BookList* (%BookList*) * @BookList_cdr to %BookList* (%Nil*) *),
	%String* (%Nil*,%String*) * @Nil_print_list
}

@str.Main = internal constant [5 x i8] c"Main\00"
%Main = type {
	%_Main_vtable*,
	%BookList*
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
	i32 10,
	i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
	%Main* () * @Main_new,
	%Object* (%Main*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Main*) *),
	%String* (%Main*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Main*) *),
	%Main* (%Main*) * bitcast (%Object* (%Object*) * @Object_copy to %Main* (%Main*) *),
	%String* (%Main*) * @Main_main
}

@global_str.7 = internal constant [30 x i8] c"- dynamic type was Article -\0A\00"
@String.7 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([30 x i8], [30 x i8]* @global_str.7, i32 0, i32 0)
}

@global_str.9 = internal constant [23 x i8] c"Aho, Sethi, and Ullman\00"
@String.9 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([23 x i8], [23 x i8]* @global_str.9, i32 0, i32 0)
}

@global_str.2 = internal constant [2 x i8] c"\0A\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @global_str.2, i32 0, i32 0)
}

@global_str.3 = internal constant [13 x i8] c"author:     \00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @global_str.3, i32 0, i32 0)
}

@global_str.13 = internal constant [14 x i8] c"<basic class>\00"
@String.13 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.13, i32 0, i32 0)
}

@global_str.4 = internal constant [14 x i8] c"periodical:  \00"
@String.4 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @global_str.4, i32 0, i32 0)
}

@global_str.8 = internal constant [45 x i8] c"Compilers, Principles, Techniques, and Tools\00"
@String.8 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([45 x i8], [45 x i8]* @global_str.8, i32 0, i32 0)
}

@global_str.1 = internal constant [13 x i8] c"title:      \00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @global_str.1, i32 0, i32 0)
}

@global_str.5 = internal constant [1 x i8] c"\00"
@String.5 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([1 x i8], [1 x i8]* @global_str.5, i32 0, i32 0)
}

@global_str.11 = internal constant [8 x i8] c"Ulanoff\00"
@String.11 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @global_str.11, i32 0, i32 0)
}

@global_str.0 = internal constant [13 x i8] c"book_list.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @global_str.0, i32 0, i32 0)
}

@global_str.6 = internal constant [27 x i8] c"- dynamic type was Book -\0A\00"
@String.6 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([27 x i8], [27 x i8]* @global_str.6, i32 0, i32 0)
}

@global_str.10 = internal constant [20 x i8] c"The Top 100 CD_ROMs\00"
@String.10 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([20 x i8], [20 x i8]* @global_str.10, i32 0, i32 0)
}

@global_str.12 = internal constant [12 x i8] c"PC Magazine\00"
@String.12 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([12 x i8], [12 x i8]* @global_str.12, i32 0, i32 0)
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
define %Object* @Book_getSelf(%Book* %self) {

entry:
	%vtpm.0 = alloca %Book*
	store %Book* %self, %Book** %vtpm.0
	%vtpm.1 = load %Book*, %Book** %vtpm.0
	%vtpm.2 = bitcast %Book* %vtpm.1 to %Object*
	ret %Object* %vtpm.2

abort:
	call void @abort(  )
	unreachable
}

define %Book* @Book_initBook(%Book* %self, %String* %title_p, %String* %author_p) {

entry:
	%vtpm.4 = alloca %Book*
	%vtpm.5 = alloca %String*
	%vtpm.6 = alloca %String*
	store %Book* %self, %Book** %vtpm.4
	store %String* %title_p, %String** %vtpm.5
	store %String* %author_p, %String** %vtpm.6
	%vtpm.7 = load %String*, %String** %vtpm.5
	%vtpm.8 = load %Book*, %Book** %vtpm.4
	%vtpm.9 = getelementptr %Book, %Book* %vtpm.8, i32 0, i32 1
	store %String* %vtpm.7, %String** %vtpm.9
	%vtpm.10 = load %String*, %String** %vtpm.6
	%vtpm.11 = load %Book*, %Book** %vtpm.4
	%vtpm.12 = getelementptr %Book, %Book* %vtpm.11, i32 0, i32 2
	store %String* %vtpm.10, %String** %vtpm.12
	%vtpm.13 = load %Book*, %Book** %vtpm.4
	ret %Book* %vtpm.13

abort:
	call void @abort(  )
	unreachable
}

define %String* @Book_print(%Book* %self, %String* %s) {

entry:
	%vtpm.15 = alloca %Book*
	%vtpm.16 = alloca %String*
	store %Book* %self, %Book** %vtpm.15
	store %String* %s, %String** %vtpm.16
	%vtpm.17 = load %Book*, %Book** %vtpm.15
	%vtpm.18 = getelementptr %Book, %Book* %vtpm.17, i32 0, i32 1
	%vtpm.19 = load %String*, %String** %vtpm.18
	%vtpm.20 = load %String*, %String** %vtpm.16
	%vtpm.21 = icmp eq %String* %vtpm.20, null
	br i1 %vtpm.21, label %abort, label %ok.0

ok.0:
	%vtpm.22 = getelementptr %String, %String* %vtpm.20, i32 0, i32 0
	%vtpm.23 = load %_String_vtable*, %_String_vtable** %vtpm.22
	%vtpm.24 = getelementptr %_String_vtable, %_String_vtable* %vtpm.23, i32 0, i32 8
	%tmp.0 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.24
	%vtpm.25 = call %String*(%String*, %String* ) %tmp.0( %String* %vtpm.20, %String* @String.1 )
	%vtpm.26 = icmp eq %String* %vtpm.25, null
	br i1 %vtpm.26, label %abort, label %ok.1

ok.1:
	%vtpm.27 = getelementptr %String, %String* %vtpm.25, i32 0, i32 0
	%vtpm.28 = load %_String_vtable*, %_String_vtable** %vtpm.27
	%vtpm.29 = getelementptr %_String_vtable, %_String_vtable* %vtpm.28, i32 0, i32 8
	%tmp.1 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.29
	%vtpm.30 = call %String*(%String*, %String* ) %tmp.1( %String* %vtpm.25, %String* %vtpm.19 )
	%vtpm.31 = icmp eq %String* %vtpm.30, null
	br i1 %vtpm.31, label %abort, label %ok.2

ok.2:
	%vtpm.32 = getelementptr %String, %String* %vtpm.30, i32 0, i32 0
	%vtpm.33 = load %_String_vtable*, %_String_vtable** %vtpm.32
	%vtpm.34 = getelementptr %_String_vtable, %_String_vtable* %vtpm.33, i32 0, i32 8
	%tmp.2 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.34
	%vtpm.35 = call %String*(%String*, %String* ) %tmp.2( %String* %vtpm.30, %String* @String.2 )
	store %String* %vtpm.35, %String** %vtpm.16
	%vtpm.36 = load %Book*, %Book** %vtpm.15
	%vtpm.37 = getelementptr %Book, %Book* %vtpm.36, i32 0, i32 2
	%vtpm.38 = load %String*, %String** %vtpm.37
	%vtpm.39 = load %String*, %String** %vtpm.16
	%vtpm.40 = icmp eq %String* %vtpm.39, null
	br i1 %vtpm.40, label %abort, label %ok.3

ok.3:
	%vtpm.41 = getelementptr %String, %String* %vtpm.39, i32 0, i32 0
	%vtpm.42 = load %_String_vtable*, %_String_vtable** %vtpm.41
	%vtpm.43 = getelementptr %_String_vtable, %_String_vtable* %vtpm.42, i32 0, i32 8
	%tmp.3 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.43
	%vtpm.44 = call %String*(%String*, %String* ) %tmp.3( %String* %vtpm.39, %String* @String.3 )
	%vtpm.45 = icmp eq %String* %vtpm.44, null
	br i1 %vtpm.45, label %abort, label %ok.4

ok.4:
	%vtpm.46 = getelementptr %String, %String* %vtpm.44, i32 0, i32 0
	%vtpm.47 = load %_String_vtable*, %_String_vtable** %vtpm.46
	%vtpm.48 = getelementptr %_String_vtable, %_String_vtable* %vtpm.47, i32 0, i32 8
	%tmp.4 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.48
	%vtpm.49 = call %String*(%String*, %String* ) %tmp.4( %String* %vtpm.44, %String* %vtpm.38 )
	%vtpm.50 = icmp eq %String* %vtpm.49, null
	br i1 %vtpm.50, label %abort, label %ok.5

ok.5:
	%vtpm.51 = getelementptr %String, %String* %vtpm.49, i32 0, i32 0
	%vtpm.52 = load %_String_vtable*, %_String_vtable** %vtpm.51
	%vtpm.53 = getelementptr %_String_vtable, %_String_vtable* %vtpm.52, i32 0, i32 8
	%tmp.5 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.53
	%vtpm.54 = call %String*(%String*, %String* ) %tmp.5( %String* %vtpm.49, %String* @String.2 )
	ret %String* %vtpm.54

abort:
	call void @abort(  )
	unreachable
}

define %Book* @Book_new() {

entry:
	%vtpm.56 = alloca %Book*
	%vtpm.57 = getelementptr %_Book_vtable, %_Book_vtable* @_Book_vtable_prototype, i32 0, i32 1
	%vtpm.58 = load i32, i32* %vtpm.57
	%vtpm.59 = call i8*(i32 ) @malloc( i32 %vtpm.58 )
	%vtpm.60 = bitcast i8* %vtpm.59 to %Book*
	%malloc.null = icmp eq %Book* %vtpm.60, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.61 = getelementptr %Book, %Book* %vtpm.60, i32 0, i32 0
	store %_Book_vtable* @_Book_vtable_prototype, %_Book_vtable** %vtpm.61
	store %Book* %vtpm.60, %Book** %vtpm.56
	%vtpm.62 = getelementptr %Book, %Book* %vtpm.60, i32 0, i32 1
	store %String* null, %String** %vtpm.62
	%vtpm.63 = getelementptr %Book, %Book* %vtpm.60, i32 0, i32 2
	store %String* null, %String** %vtpm.63
	%vtpm.64 = getelementptr %Book, %Book* %vtpm.60, i32 0, i32 1
	%vtpm.65 = load %Book*, %Book** %vtpm.56
	%vtpm.66 = getelementptr %Book, %Book* %vtpm.65, i32 0, i32 1
	store %String* null, %String** %vtpm.66
	%vtpm.67 = getelementptr %Book, %Book* %vtpm.60, i32 0, i32 2
	%vtpm.68 = load %Book*, %Book** %vtpm.56
	%vtpm.69 = getelementptr %Book, %Book* %vtpm.68, i32 0, i32 2
	store %String* null, %String** %vtpm.69
	ret %Book* %vtpm.60

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Article_getSelf(%Article* %self) {

entry:
	%vtpm.71 = alloca %Article*
	store %Article* %self, %Article** %vtpm.71
	%vtpm.72 = load %Article*, %Article** %vtpm.71
	%vtpm.73 = bitcast %Article* %vtpm.72 to %Object*
	ret %Object* %vtpm.73

abort:
	call void @abort(  )
	unreachable
}

define %Article* @Article_initArticle(%Article* %self, %String* %title_p, %String* %author_p, %String* %per_title_p) {

entry:
	%vtpm.75 = alloca %Article*
	%vtpm.76 = alloca %String*
	%vtpm.77 = alloca %String*
	%vtpm.78 = alloca %String*
	store %Article* %self, %Article** %vtpm.75
	store %String* %title_p, %String** %vtpm.76
	store %String* %author_p, %String** %vtpm.77
	store %String* %per_title_p, %String** %vtpm.78
	%vtpm.79 = load %String*, %String** %vtpm.76
	%vtpm.80 = load %String*, %String** %vtpm.77
	%vtpm.81 = load %Article*, %Article** %vtpm.75
	%vtpm.82 = icmp eq %Article* %vtpm.81, null
	br i1 %vtpm.82, label %abort, label %ok.0

ok.0:
	%vtpm.83 = getelementptr %Article, %Article* %vtpm.81, i32 0, i32 0
	%vtpm.84 = load %_Article_vtable*, %_Article_vtable** %vtpm.83
	%vtpm.85 = getelementptr %_Article_vtable, %_Article_vtable* %vtpm.84, i32 0, i32 11
	%tmp.0 = load %Book* (%Article*,%String*,%String*) *, %Book* (%Article*,%String*,%String*) ** %vtpm.85
	%vtpm.86 = call %Book*(%Article*, %String*, %String* ) %tmp.0( %Article* %vtpm.81, %String* %vtpm.79, %String* %vtpm.80 )
	%vtpm.87 = load %String*, %String** %vtpm.78
	%vtpm.88 = load %Article*, %Article** %vtpm.75
	%vtpm.89 = getelementptr %Article, %Article* %vtpm.88, i32 0, i32 3
	store %String* %vtpm.87, %String** %vtpm.89
	%vtpm.90 = load %Article*, %Article** %vtpm.75
	ret %Article* %vtpm.90

abort:
	call void @abort(  )
	unreachable
}

define %String* @Article_print(%Article* %self, %String* %s) {

entry:
	%vtpm.92 = alloca %Article*
	%vtpm.93 = alloca %String*
	store %Article* %self, %Article** %vtpm.92
	store %String* %s, %String** %vtpm.93
	%vtpm.94 = load %String*, %String** %vtpm.93
	%vtpm.95 = load %Article*, %Article** %vtpm.92
	%vtpm.96 = icmp eq %Article* %vtpm.95, null
	br i1 %vtpm.96, label %abort, label %ok.0

ok.0:
	%vtpm.97 = getelementptr %_Book_vtable, %_Book_vtable* @_Book_vtable_prototype, i32 0, i32 13
	%tmp.0 = load %String* (%Book*,%String*) *, %String* (%Book*,%String*) ** %vtpm.97
	%vtpm.98 = bitcast %Article* %vtpm.95 to %Book*
	%vtpm.99 = call %String*(%Book*, %String* ) %tmp.0( %Book* %vtpm.98, %String* %vtpm.94 )
	store %String* %vtpm.99, %String** %vtpm.93
	%vtpm.100 = load %Article*, %Article** %vtpm.92
	%vtpm.101 = getelementptr %Article, %Article* %vtpm.100, i32 0, i32 3
	%vtpm.102 = load %String*, %String** %vtpm.101
	%vtpm.103 = load %String*, %String** %vtpm.93
	%vtpm.104 = icmp eq %String* %vtpm.103, null
	br i1 %vtpm.104, label %abort, label %ok.1

ok.1:
	%vtpm.105 = getelementptr %String, %String* %vtpm.103, i32 0, i32 0
	%vtpm.106 = load %_String_vtable*, %_String_vtable** %vtpm.105
	%vtpm.107 = getelementptr %_String_vtable, %_String_vtable* %vtpm.106, i32 0, i32 8
	%tmp.1 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.107
	%vtpm.108 = call %String*(%String*, %String* ) %tmp.1( %String* %vtpm.103, %String* @String.4 )
	%vtpm.109 = icmp eq %String* %vtpm.108, null
	br i1 %vtpm.109, label %abort, label %ok.2

ok.2:
	%vtpm.110 = getelementptr %String, %String* %vtpm.108, i32 0, i32 0
	%vtpm.111 = load %_String_vtable*, %_String_vtable** %vtpm.110
	%vtpm.112 = getelementptr %_String_vtable, %_String_vtable* %vtpm.111, i32 0, i32 8
	%tmp.2 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.112
	%vtpm.113 = call %String*(%String*, %String* ) %tmp.2( %String* %vtpm.108, %String* %vtpm.102 )
	%vtpm.114 = icmp eq %String* %vtpm.113, null
	br i1 %vtpm.114, label %abort, label %ok.3

ok.3:
	%vtpm.115 = getelementptr %String, %String* %vtpm.113, i32 0, i32 0
	%vtpm.116 = load %_String_vtable*, %_String_vtable** %vtpm.115
	%vtpm.117 = getelementptr %_String_vtable, %_String_vtable* %vtpm.116, i32 0, i32 8
	%tmp.3 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.117
	%vtpm.118 = call %String*(%String*, %String* ) %tmp.3( %String* %vtpm.113, %String* @String.2 )
	ret %String* %vtpm.118

abort:
	call void @abort(  )
	unreachable
}

define %Article* @Article_new() {

entry:
	%vtpm.120 = alloca %Article*
	%vtpm.121 = getelementptr %_Article_vtable, %_Article_vtable* @_Article_vtable_prototype, i32 0, i32 1
	%vtpm.122 = load i32, i32* %vtpm.121
	%vtpm.123 = call i8*(i32 ) @malloc( i32 %vtpm.122 )
	%vtpm.124 = bitcast i8* %vtpm.123 to %Article*
	%malloc.null = icmp eq %Article* %vtpm.124, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.125 = getelementptr %Article, %Article* %vtpm.124, i32 0, i32 0
	store %_Article_vtable* @_Article_vtable_prototype, %_Article_vtable** %vtpm.125
	store %Article* %vtpm.124, %Article** %vtpm.120
	%vtpm.126 = getelementptr %Article, %Article* %vtpm.124, i32 0, i32 1
	store %String* null, %String** %vtpm.126
	%vtpm.127 = getelementptr %Article, %Article* %vtpm.124, i32 0, i32 2
	store %String* null, %String** %vtpm.127
	%vtpm.128 = getelementptr %Article, %Article* %vtpm.124, i32 0, i32 3
	store %String* null, %String** %vtpm.128
	%vtpm.129 = getelementptr %Article, %Article* %vtpm.124, i32 0, i32 1
	%vtpm.130 = load %Article*, %Article** %vtpm.120
	%vtpm.131 = getelementptr %Article, %Article* %vtpm.130, i32 0, i32 1
	store %String* null, %String** %vtpm.131
	%vtpm.132 = getelementptr %Article, %Article* %vtpm.124, i32 0, i32 2
	%vtpm.133 = load %Article*, %Article** %vtpm.120
	%vtpm.134 = getelementptr %Article, %Article* %vtpm.133, i32 0, i32 2
	store %String* null, %String** %vtpm.134
	%vtpm.135 = getelementptr %Article, %Article* %vtpm.124, i32 0, i32 3
	%vtpm.136 = load %Article*, %Article** %vtpm.120
	%vtpm.137 = getelementptr %Article, %Article* %vtpm.136, i32 0, i32 3
	store %String* null, %String** %vtpm.137
	ret %Article* %vtpm.124

abort:
	call void @abort(  )
	unreachable
}

define %Book* @BookList_car(%BookList* %self) {

entry:
	%vtpm.139 = alloca %BookList*
	store %BookList* %self, %BookList** %vtpm.139
	%vtpm.140 = load %BookList*, %BookList** %vtpm.139
	%vtpm.141 = icmp eq %BookList* %vtpm.140, null
	br i1 %vtpm.141, label %abort, label %ok.0

ok.0:
	%vtpm.142 = getelementptr %BookList, %BookList* %vtpm.140, i32 0, i32 0
	%vtpm.143 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.142
	%vtpm.144 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.143, i32 0, i32 4
	%tmp.0 = load %Object* (%BookList*) *, %Object* (%BookList*) ** %vtpm.144
	%vtpm.145 = call %Object*(%BookList* ) %tmp.0( %BookList* %vtpm.140 )
	%vtpm.146 = call %Book* @Book_new(  )
	ret %Book* %vtpm.146

abort:
	call void @abort(  )
	unreachable
}

define %BookList* @BookList_cdr(%BookList* %self) {

entry:
	%vtpm.148 = alloca %BookList*
	store %BookList* %self, %BookList** %vtpm.148
	%vtpm.149 = load %BookList*, %BookList** %vtpm.148
	%vtpm.150 = icmp eq %BookList* %vtpm.149, null
	br i1 %vtpm.150, label %abort, label %ok.0

ok.0:
	%vtpm.151 = getelementptr %BookList, %BookList* %vtpm.149, i32 0, i32 0
	%vtpm.152 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.151
	%vtpm.153 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.152, i32 0, i32 4
	%tmp.0 = load %Object* (%BookList*) *, %Object* (%BookList*) ** %vtpm.153
	%vtpm.154 = call %Object*(%BookList* ) %tmp.0( %BookList* %vtpm.149 )
	%vtpm.155 = call %BookList* @BookList_new(  )
	ret %BookList* %vtpm.155

abort:
	call void @abort(  )
	unreachable
}

define %Cons* @BookList_cons(%BookList* %self, %Book* %hd) {

entry:
	%vtpm.157 = alloca %Cons*
	%vtpm.158 = alloca %BookList*
	%vtpm.159 = alloca %Book*
	store %BookList* %self, %BookList** %vtpm.158
	store %Book* %hd, %Book** %vtpm.159
	%vtpm.160 = call %Cons* @Cons_new(  )
	store %Cons* %vtpm.160, %Cons** %vtpm.157
	%vtpm.161 = load %Book*, %Book** %vtpm.159
	%vtpm.162 = load %BookList*, %BookList** %vtpm.158
	%vtpm.163 = load %Cons*, %Cons** %vtpm.157
	%vtpm.164 = icmp eq %Cons* %vtpm.163, null
	br i1 %vtpm.164, label %abort, label %ok.0

ok.0:
	%vtpm.165 = getelementptr %Cons, %Cons* %vtpm.163, i32 0, i32 0
	%vtpm.166 = load %_Cons_vtable*, %_Cons_vtable** %vtpm.165
	%vtpm.167 = getelementptr %_Cons_vtable, %_Cons_vtable* %vtpm.166, i32 0, i32 16
	%tmp.0 = load %Cons* (%Cons*,%Book*,%BookList*) *, %Cons* (%Cons*,%Book*,%BookList*) ** %vtpm.167
	%vtpm.168 = call %Cons*(%Cons*, %Book*, %BookList* ) %tmp.0( %Cons* %vtpm.163, %Book* %vtpm.161, %BookList* %vtpm.162 )
	ret %Cons* %vtpm.168

abort:
	call void @abort(  )
	unreachable
}

define i1 @BookList_isNil(%BookList* %self) {

entry:
	%vtpm.170 = alloca %BookList*
	store %BookList* %self, %BookList** %vtpm.170
	%vtpm.171 = load %BookList*, %BookList** %vtpm.170
	%vtpm.172 = icmp eq %BookList* %vtpm.171, null
	br i1 %vtpm.172, label %abort, label %ok.0

ok.0:
	%vtpm.173 = getelementptr %BookList, %BookList* %vtpm.171, i32 0, i32 0
	%vtpm.174 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.173
	%vtpm.175 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.174, i32 0, i32 4
	%tmp.0 = load %Object* (%BookList*) *, %Object* (%BookList*) ** %vtpm.175
	%vtpm.176 = call %Object*(%BookList* ) %tmp.0( %BookList* %vtpm.171 )
	ret i1 true

abort:
	call void @abort(  )
	unreachable
}

define %String* @BookList_print_list(%BookList* %self, %String* %s) {

entry:
	%vtpm.178 = alloca %BookList*
	%vtpm.179 = alloca %String*
	store %BookList* %self, %BookList** %vtpm.178
	store %String* %s, %String** %vtpm.179
	ret %String* @String.5

abort:
	call void @abort(  )
	unreachable
}

define %BookList* @BookList_new() {

entry:
	%vtpm.181 = alloca %BookList*
	%vtpm.182 = getelementptr %_BookList_vtable, %_BookList_vtable* @_BookList_vtable_prototype, i32 0, i32 1
	%vtpm.183 = load i32, i32* %vtpm.182
	%vtpm.184 = call i8*(i32 ) @malloc( i32 %vtpm.183 )
	%vtpm.185 = bitcast i8* %vtpm.184 to %BookList*
	%malloc.null = icmp eq %BookList* %vtpm.185, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.186 = getelementptr %BookList, %BookList* %vtpm.185, i32 0, i32 0
	store %_BookList_vtable* @_BookList_vtable_prototype, %_BookList_vtable** %vtpm.186
	store %BookList* %vtpm.185, %BookList** %vtpm.181
	ret %BookList* %vtpm.185

abort:
	call void @abort(  )
	unreachable
}

define %Book* @Cons_car(%Cons* %self) {

entry:
	%vtpm.188 = alloca %Cons*
	store %Cons* %self, %Cons** %vtpm.188
	%vtpm.189 = load %Cons*, %Cons** %vtpm.188
	%vtpm.190 = getelementptr %Cons, %Cons* %vtpm.189, i32 0, i32 1
	%vtpm.191 = load %Book*, %Book** %vtpm.190
	ret %Book* %vtpm.191

abort:
	call void @abort(  )
	unreachable
}

define %BookList* @Cons_cdr(%Cons* %self) {

entry:
	%vtpm.193 = alloca %Cons*
	store %Cons* %self, %Cons** %vtpm.193
	%vtpm.194 = load %Cons*, %Cons** %vtpm.193
	%vtpm.195 = getelementptr %Cons, %Cons* %vtpm.194, i32 0, i32 2
	%vtpm.196 = load %BookList*, %BookList** %vtpm.195
	ret %BookList* %vtpm.196

abort:
	call void @abort(  )
	unreachable
}

define %Cons* @Cons_init(%Cons* %self, %Book* %hd, %BookList* %tl) {

entry:
	%vtpm.198 = alloca %Cons*
	%vtpm.199 = alloca %Book*
	%vtpm.200 = alloca %BookList*
	store %Cons* %self, %Cons** %vtpm.198
	store %Book* %hd, %Book** %vtpm.199
	store %BookList* %tl, %BookList** %vtpm.200
	%vtpm.201 = load %Book*, %Book** %vtpm.199
	%vtpm.202 = load %Cons*, %Cons** %vtpm.198
	%vtpm.203 = getelementptr %Cons, %Cons* %vtpm.202, i32 0, i32 1
	store %Book* %vtpm.201, %Book** %vtpm.203
	%vtpm.204 = load %BookList*, %BookList** %vtpm.200
	%vtpm.205 = load %Cons*, %Cons** %vtpm.198
	%vtpm.206 = getelementptr %Cons, %Cons* %vtpm.205, i32 0, i32 2
	store %BookList* %vtpm.204, %BookList** %vtpm.206
	%vtpm.207 = load %Cons*, %Cons** %vtpm.198
	ret %Cons* %vtpm.207

abort:
	call void @abort(  )
	unreachable
}

define i1 @Cons_isNil(%Cons* %self) {

entry:
	%vtpm.209 = alloca %Cons*
	store %Cons* %self, %Cons** %vtpm.209
	ret i1 false

abort:
	call void @abort(  )
	unreachable
}

define %String* @Cons_print_list(%Cons* %self, %String* %s) {

entry:
	%tmp.0 = alloca %String*
	%vtpm.211 = alloca %Book*
	%vtpm.212 = alloca %Article*
	%vtpm.213 = alloca %Cons*
	%vtpm.214 = alloca %String*
	store %Cons* %self, %Cons** %vtpm.213
	store %String* %s, %String** %vtpm.214
	%vtpm.215 = load %String*, %String** %vtpm.214
	%vtpm.216 = load %Cons*, %Cons** %vtpm.213
	%vtpm.217 = getelementptr %Cons, %Cons* %vtpm.216, i32 0, i32 1
	%vtpm.218 = load %Book*, %Book** %vtpm.217
	%vtpm.219 = icmp eq %Book* %vtpm.218, null
	br i1 %vtpm.219, label %abort, label %ok.0

ok.0:
	%vtpm.220 = getelementptr %Book, %Book* %vtpm.218, i32 0, i32 0
	%vtpm.221 = load %_Book_vtable*, %_Book_vtable** %vtpm.220
	%vtpm.222 = getelementptr %_Book_vtable, %_Book_vtable* %vtpm.221, i32 0, i32 13
	%tmp.1 = load %String* (%Book*,%String*) *, %String* (%Book*,%String*) ** %vtpm.222
	%vtpm.223 = call %String*(%Book*, %String* ) %tmp.1( %Book* %vtpm.218, %String* %vtpm.215 )
	store %String* %vtpm.223, %String** %vtpm.214
	%vtpm.224 = load %Cons*, %Cons** %vtpm.213
	%vtpm.225 = getelementptr %Cons, %Cons* %vtpm.224, i32 0, i32 1
	%vtpm.226 = load %Book*, %Book** %vtpm.225
	%vtpm.227 = icmp eq %Book* %vtpm.226, null
	br i1 %vtpm.227, label %abort, label %ok.1

ok.1:
	%vtpm.228 = getelementptr %Book, %Book* %vtpm.226, i32 0, i32 0
	%vtpm.229 = load %_Book_vtable*, %_Book_vtable** %vtpm.228
	%vtpm.230 = getelementptr %_Book_vtable, %_Book_vtable* %vtpm.229, i32 0, i32 12
	%tmp.2 = load %Object* (%Book*) *, %Object* (%Book*) ** %vtpm.230
	%vtpm.231 = call %Object*(%Book* ) %tmp.2( %Book* %vtpm.226 )
	%tmp.3 = icmp eq %Object* %vtpm.231, null
	br i1 %tmp.3, label %abort, label %ok.2

ok.2:
	%vtpm.232 = getelementptr %Object, %Object* %vtpm.231, i32 0, i32 0
	%vtpm.233 = load %_Object_vtable*, %_Object_vtable** %vtpm.232
	%vtpm.234 = getelementptr %_Object_vtable, %_Object_vtable* %vtpm.233, i32 0, i32 0
	%vtpm.235 = load i32, i32* %vtpm.234
	br label %case.hdr.0

case.hdr.0:
	br label %case.6.0

case.6.0:
	%vtpm.236 = icmp slt i32 %vtpm.235, 6
	br i1 %vtpm.236, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%vtpm.237 = icmp sgt i32 %vtpm.235, 6
	br i1 %vtpm.237, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%vtpm.238 = bitcast %Object* %vtpm.231 to %Article*
	store %Article* %vtpm.238, %Article** %vtpm.212
	%vtpm.239 = load %String*, %String** %vtpm.214
	%vtpm.240 = icmp eq %String* %vtpm.239, null
	br i1 %vtpm.240, label %abort, label %ok.3

ok.3:
	%vtpm.241 = getelementptr %String, %String* %vtpm.239, i32 0, i32 0
	%vtpm.242 = load %_String_vtable*, %_String_vtable** %vtpm.241
	%vtpm.243 = getelementptr %_String_vtable, %_String_vtable* %vtpm.242, i32 0, i32 8
	%tmp.4 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.243
	%vtpm.244 = call %String*(%String*, %String* ) %tmp.4( %String* %vtpm.239, %String* @String.7 )
	store %String* %vtpm.244, %String** %tmp.0
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%vtpm.245 = icmp slt i32 %vtpm.235, 5
	br i1 %vtpm.245, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%vtpm.246 = icmp sgt i32 %vtpm.235, 6
	br i1 %vtpm.246, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	%vtpm.247 = bitcast %Object* %vtpm.231 to %Book*
	store %Book* %vtpm.247, %Book** %vtpm.211
	%vtpm.248 = load %String*, %String** %vtpm.214
	%vtpm.249 = icmp eq %String* %vtpm.248, null
	br i1 %vtpm.249, label %abort, label %ok.4

ok.4:
	%vtpm.250 = getelementptr %String, %String* %vtpm.248, i32 0, i32 0
	%vtpm.251 = load %_String_vtable*, %_String_vtable** %vtpm.250
	%vtpm.252 = getelementptr %_String_vtable, %_String_vtable* %vtpm.251, i32 0, i32 8
	%tmp.5 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.252
	%vtpm.253 = call %String*(%String*, %String* ) %tmp.5( %String* %vtpm.248, %String* @String.6 )
	store %String* %vtpm.253, %String** %tmp.0
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%tmp.6 = load %String*, %String** %tmp.0
	store %String* %tmp.6, %String** %vtpm.214
	%vtpm.254 = load %String*, %String** %vtpm.214
	%vtpm.255 = load %Cons*, %Cons** %vtpm.213
	%vtpm.256 = getelementptr %Cons, %Cons* %vtpm.255, i32 0, i32 2
	%vtpm.257 = load %BookList*, %BookList** %vtpm.256
	%vtpm.258 = icmp eq %BookList* %vtpm.257, null
	br i1 %vtpm.258, label %abort, label %ok.5

ok.5:
	%vtpm.259 = getelementptr %BookList, %BookList* %vtpm.257, i32 0, i32 0
	%vtpm.260 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.259
	%vtpm.261 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.260, i32 0, i32 15
	%tmp.7 = load %String* (%BookList*,%String*) *, %String* (%BookList*,%String*) ** %vtpm.261
	%vtpm.262 = call %String*(%BookList*, %String* ) %tmp.7( %BookList* %vtpm.257, %String* %vtpm.254 )
	ret %String* %vtpm.262

abort:
	call void @abort(  )
	unreachable
}

define %Cons* @Cons_new() {

entry:
	%vtpm.264 = alloca %Cons*
	%vtpm.265 = getelementptr %_Cons_vtable, %_Cons_vtable* @_Cons_vtable_prototype, i32 0, i32 1
	%vtpm.266 = load i32, i32* %vtpm.265
	%vtpm.267 = call i8*(i32 ) @malloc( i32 %vtpm.266 )
	%vtpm.268 = bitcast i8* %vtpm.267 to %Cons*
	%malloc.null = icmp eq %Cons* %vtpm.268, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.269 = getelementptr %Cons, %Cons* %vtpm.268, i32 0, i32 0
	store %_Cons_vtable* @_Cons_vtable_prototype, %_Cons_vtable** %vtpm.269
	store %Cons* %vtpm.268, %Cons** %vtpm.264
	%vtpm.270 = getelementptr %Cons, %Cons* %vtpm.268, i32 0, i32 1
	store %Book* null, %Book** %vtpm.270
	%vtpm.271 = getelementptr %Cons, %Cons* %vtpm.268, i32 0, i32 2
	store %BookList* null, %BookList** %vtpm.271
	%vtpm.272 = getelementptr %Cons, %Cons* %vtpm.268, i32 0, i32 1
	%vtpm.273 = load %Cons*, %Cons** %vtpm.264
	%vtpm.274 = getelementptr %Cons, %Cons* %vtpm.273, i32 0, i32 1
	store %Book* null, %Book** %vtpm.274
	%vtpm.275 = getelementptr %Cons, %Cons* %vtpm.268, i32 0, i32 2
	%vtpm.276 = load %Cons*, %Cons** %vtpm.264
	%vtpm.277 = getelementptr %Cons, %Cons* %vtpm.276, i32 0, i32 2
	store %BookList* null, %BookList** %vtpm.277
	ret %Cons* %vtpm.268

abort:
	call void @abort(  )
	unreachable
}

define i1 @Nil_isNil(%Nil* %self) {

entry:
	%vtpm.279 = alloca %Nil*
	store %Nil* %self, %Nil** %vtpm.279
	ret i1 true

abort:
	call void @abort(  )
	unreachable
}

define %String* @Nil_print_list(%Nil* %self, %String* %s) {

entry:
	%vtpm.281 = alloca %Nil*
	%vtpm.282 = alloca %String*
	store %Nil* %self, %Nil** %vtpm.281
	store %String* %s, %String** %vtpm.282
	%vtpm.283 = load %String*, %String** %vtpm.282
	ret %String* %vtpm.283

abort:
	call void @abort(  )
	unreachable
}

define %Nil* @Nil_new() {

entry:
	%vtpm.285 = alloca %Nil*
	%vtpm.286 = getelementptr %_Nil_vtable, %_Nil_vtable* @_Nil_vtable_prototype, i32 0, i32 1
	%vtpm.287 = load i32, i32* %vtpm.286
	%vtpm.288 = call i8*(i32 ) @malloc( i32 %vtpm.287 )
	%vtpm.289 = bitcast i8* %vtpm.288 to %Nil*
	%malloc.null = icmp eq %Nil* %vtpm.289, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.290 = getelementptr %Nil, %Nil* %vtpm.289, i32 0, i32 0
	store %_Nil_vtable* @_Nil_vtable_prototype, %_Nil_vtable** %vtpm.290
	store %Nil* %vtpm.289, %Nil** %vtpm.285
	ret %Nil* %vtpm.289

abort:
	call void @abort(  )
	unreachable
}

define %String* @Main_main(%Main* %self) {

entry:
	%vtpm.292 = alloca %Book*
	%vtpm.293 = alloca %Article*
	%vtpm.294 = alloca %Main*
	store %Main* %self, %Main** %vtpm.294
	%vtpm.295 = call %Book* @Book_new(  )
	%vtpm.296 = icmp eq %Book* %vtpm.295, null
	br i1 %vtpm.296, label %abort, label %ok.0

ok.0:
	%vtpm.297 = getelementptr %Book, %Book* %vtpm.295, i32 0, i32 0
	%vtpm.298 = load %_Book_vtable*, %_Book_vtable** %vtpm.297
	%vtpm.299 = getelementptr %_Book_vtable, %_Book_vtable* %vtpm.298, i32 0, i32 11
	%tmp.0 = load %Book* (%Book*,%String*,%String*) *, %Book* (%Book*,%String*,%String*) ** %vtpm.299
	%vtpm.300 = call %Book*(%Book*, %String*, %String* ) %tmp.0( %Book* %vtpm.295, %String* @String.8, %String* @String.9 )
	store %Book* %vtpm.300, %Book** %vtpm.292
	%vtpm.301 = call %Article* @Article_new(  )
	%vtpm.302 = icmp eq %Article* %vtpm.301, null
	br i1 %vtpm.302, label %abort, label %ok.1

ok.1:
	%vtpm.303 = getelementptr %Article, %Article* %vtpm.301, i32 0, i32 0
	%vtpm.304 = load %_Article_vtable*, %_Article_vtable** %vtpm.303
	%vtpm.305 = getelementptr %_Article_vtable, %_Article_vtable* %vtpm.304, i32 0, i32 14
	%tmp.1 = load %Article* (%Article*,%String*,%String*,%String*) *, %Article* (%Article*,%String*,%String*,%String*) ** %vtpm.305
	%vtpm.306 = call %Article*(%Article*, %String*, %String*, %String* ) %tmp.1( %Article* %vtpm.301, %String* @String.10, %String* @String.11, %String* @String.12 )
	store %Article* %vtpm.306, %Article** %vtpm.293
	%vtpm.307 = load %Article*, %Article** %vtpm.293
	%vtpm.308 = load %Book*, %Book** %vtpm.292
	%vtpm.309 = call %Nil* @Nil_new(  )
	%vtpm.310 = icmp eq %Nil* %vtpm.309, null
	br i1 %vtpm.310, label %abort, label %ok.2

ok.2:
	%vtpm.311 = getelementptr %Nil, %Nil* %vtpm.309, i32 0, i32 0
	%vtpm.312 = load %_Nil_vtable*, %_Nil_vtable** %vtpm.311
	%vtpm.313 = getelementptr %_Nil_vtable, %_Nil_vtable* %vtpm.312, i32 0, i32 12
	%tmp.2 = load %Cons* (%Nil*,%Book*) *, %Cons* (%Nil*,%Book*) ** %vtpm.313
	%vtpm.314 = call %Cons*(%Nil*, %Book* ) %tmp.2( %Nil* %vtpm.309, %Book* %vtpm.308 )
	%vtpm.315 = icmp eq %Cons* %vtpm.314, null
	br i1 %vtpm.315, label %abort, label %ok.3

ok.3:
	%vtpm.316 = getelementptr %Cons, %Cons* %vtpm.314, i32 0, i32 0
	%vtpm.317 = load %_Cons_vtable*, %_Cons_vtable** %vtpm.316
	%vtpm.318 = getelementptr %_Cons_vtable, %_Cons_vtable* %vtpm.317, i32 0, i32 12
	%tmp.3 = load %Cons* (%Cons*,%Book*) *, %Cons* (%Cons*,%Book*) ** %vtpm.318
	%vtpm.319 = bitcast %Article* %vtpm.307 to %Book*
	%vtpm.320 = call %Cons*(%Cons*, %Book* ) %tmp.3( %Cons* %vtpm.314, %Book* %vtpm.319 )
	%vtpm.321 = load %Main*, %Main** %vtpm.294
	%vtpm.322 = getelementptr %Main, %Main* %vtpm.321, i32 0, i32 1
	%vtpm.323 = bitcast %Cons* %vtpm.320 to %BookList*
	store %BookList* %vtpm.323, %BookList** %vtpm.322
	%vtpm.324 = load %Main*, %Main** %vtpm.294
	%vtpm.325 = getelementptr %Main, %Main* %vtpm.324, i32 0, i32 1
	%vtpm.326 = load %BookList*, %BookList** %vtpm.325
	%vtpm.327 = icmp eq %BookList* %vtpm.326, null
	br i1 %vtpm.327, label %abort, label %ok.4

ok.4:
	%vtpm.328 = getelementptr %BookList, %BookList* %vtpm.326, i32 0, i32 0
	%vtpm.329 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.328
	%vtpm.330 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.329, i32 0, i32 15
	%tmp.4 = load %String* (%BookList*,%String*) *, %String* (%BookList*,%String*) ** %vtpm.330
	%vtpm.331 = call %String*(%BookList*, %String* ) %tmp.4( %BookList* %vtpm.326, %String* @String.5 )
	ret %String* %vtpm.331

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.333 = alloca %Main*
	%vtpm.334 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.335 = load i32, i32* %vtpm.334
	%vtpm.336 = call i8*(i32 ) @malloc( i32 %vtpm.335 )
	%vtpm.337 = bitcast i8* %vtpm.336 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.337, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.338 = getelementptr %Main, %Main* %vtpm.337, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.338
	store %Main* %vtpm.337, %Main** %vtpm.333
	%vtpm.339 = getelementptr %Main, %Main* %vtpm.337, i32 0, i32 1
	store %BookList* null, %BookList** %vtpm.339
	%vtpm.340 = getelementptr %Main, %Main* %vtpm.337, i32 0, i32 1
	%vtpm.341 = load %Main*, %Main** %vtpm.333
	%vtpm.342 = getelementptr %Main, %Main* %vtpm.341, i32 0, i32 1
	store %BookList* null, %BookList** %vtpm.342
	ret %Main* %vtpm.337

abort:
	call void @abort(  )
	unreachable
}

