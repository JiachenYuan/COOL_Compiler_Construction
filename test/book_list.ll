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
	%Object* (%Article*) * bitcast (%Object* (%Book*) * @Book_getSelf to %Object* (%Article*) *),
	%String* (%Article*,%String*) * bitcast (%String* (%Book*,%String*) * @Book_print to %String* (%Article*,%String*) *),
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
	i1 (%Cons*) * bitcast (i1 (%BookList*) * @BookList_isNil to i1 (%Cons*) *),
	%Cons* (%Cons*,%Book*) * bitcast (%Cons* (%BookList*,%Book*) * @BookList_cons to %Cons* (%Cons*,%Book*) *),
	%Book* (%Cons*) * bitcast (%Book* (%BookList*) * @BookList_car to %Book* (%Cons*) *),
	%BookList* (%Cons*) * bitcast (%BookList* (%BookList*) * @BookList_cdr to %BookList* (%Cons*) *),
	%String* (%Cons*,%String*) * bitcast (%String* (%BookList*,%String*) * @BookList_print_list to %String* (%Cons*,%String*) *),
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
	i1 (%Nil*) * bitcast (i1 (%BookList*) * @BookList_isNil to i1 (%Nil*) *),
	%Cons* (%Nil*,%Book*) * bitcast (%Cons* (%BookList*,%Book*) * @BookList_cons to %Cons* (%Nil*,%Book*) *),
	%Book* (%Nil*) * bitcast (%Book* (%BookList*) * @BookList_car to %Book* (%Nil*) *),
	%BookList* (%Nil*) * bitcast (%BookList* (%BookList*) * @BookList_cdr to %BookList* (%Nil*) *),
	%String* (%Nil*,%String*) * bitcast (%String* (%BookList*,%String*) * @BookList_print_list to %String* (%Nil*,%String*) *)
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
	store %String* null, %String** %vtpm.64
	%vtpm.65 = getelementptr %Book, %Book* %vtpm.60, i32 0, i32 2
	store %String* null, %String** %vtpm.65
	ret %Book* %vtpm.60

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Article_getSelf(%Article* %self) {

entry:
	%vtpm.67 = alloca %Article*
	store %Article* %self, %Article** %vtpm.67
	%vtpm.68 = load %Article*, %Article** %vtpm.67
	%vtpm.69 = bitcast %Article* %vtpm.68 to %Object*
	ret %Object* %vtpm.69

abort:
	call void @abort(  )
	unreachable
}

define %Article* @Article_initArticle(%Article* %self, %String* %title_p, %String* %author_p, %String* %per_title_p) {

entry:
	%vtpm.71 = alloca %Article*
	%vtpm.72 = alloca %String*
	%vtpm.73 = alloca %String*
	%vtpm.74 = alloca %String*
	store %Article* %self, %Article** %vtpm.71
	store %String* %title_p, %String** %vtpm.72
	store %String* %author_p, %String** %vtpm.73
	store %String* %per_title_p, %String** %vtpm.74
	%vtpm.75 = load %String*, %String** %vtpm.72
	%vtpm.76 = load %String*, %String** %vtpm.73
	%vtpm.77 = load %Article*, %Article** %vtpm.71
	%vtpm.78 = icmp eq %Article* %vtpm.77, null
	br i1 %vtpm.78, label %abort, label %ok.0

ok.0:
	%vtpm.79 = getelementptr %Article, %Article* %vtpm.77, i32 0, i32 0
	%vtpm.80 = load %_Article_vtable*, %_Article_vtable** %vtpm.79
	%vtpm.81 = getelementptr %_Article_vtable, %_Article_vtable* %vtpm.80, i32 0, i32 11
	%tmp.0 = load %Book* (%Article*,%String*,%String*) *, %Book* (%Article*,%String*,%String*) ** %vtpm.81
	%vtpm.82 = call %Book*(%Article*, %String*, %String* ) %tmp.0( %Article* %vtpm.77, %String* %vtpm.75, %String* %vtpm.76 )
	%vtpm.83 = load %String*, %String** %vtpm.74
	%vtpm.84 = load %Article*, %Article** %vtpm.71
	%vtpm.85 = getelementptr %Article, %Article* %vtpm.84, i32 0, i32 3
	store %String* %vtpm.83, %String** %vtpm.85
	%vtpm.86 = load %Article*, %Article** %vtpm.71
	ret %Article* %vtpm.86

abort:
	call void @abort(  )
	unreachable
}

define %String* @Article_print(%Article* %self, %String* %s) {

entry:
	%vtpm.88 = alloca %Article*
	%vtpm.89 = alloca %String*
	store %Article* %self, %Article** %vtpm.88
	store %String* %s, %String** %vtpm.89
	%vtpm.90 = load %String*, %String** %vtpm.89
	%vtpm.91 = load %Article*, %Article** %vtpm.88
	%vtpm.92 = icmp eq %Article* %vtpm.91, null
	br i1 %vtpm.92, label %abort, label %ok.0

ok.0:
	%vtpm.93 = getelementptr %_Book_vtable, %_Book_vtable* @_Book_vtable_prototype, i32 0, i32 13
	%tmp.0 = load %String* (%Book*,%String*) *, %String* (%Book*,%String*) ** %vtpm.93
	%vtpm.94 = bitcast %Article* %vtpm.91 to %Book*
	%vtpm.95 = call %String*(%Book*, %String* ) %tmp.0( %Book* %vtpm.94, %String* %vtpm.90 )
	store %String* %vtpm.95, %String** %vtpm.89
	%vtpm.96 = load %Article*, %Article** %vtpm.88
	%vtpm.97 = getelementptr %Article, %Article* %vtpm.96, i32 0, i32 3
	%vtpm.98 = load %String*, %String** %vtpm.97
	%vtpm.99 = load %String*, %String** %vtpm.89
	%vtpm.100 = icmp eq %String* %vtpm.99, null
	br i1 %vtpm.100, label %abort, label %ok.1

ok.1:
	%vtpm.101 = getelementptr %String, %String* %vtpm.99, i32 0, i32 0
	%vtpm.102 = load %_String_vtable*, %_String_vtable** %vtpm.101
	%vtpm.103 = getelementptr %_String_vtable, %_String_vtable* %vtpm.102, i32 0, i32 8
	%tmp.1 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.103
	%vtpm.104 = call %String*(%String*, %String* ) %tmp.1( %String* %vtpm.99, %String* @String.4 )
	%vtpm.105 = icmp eq %String* %vtpm.104, null
	br i1 %vtpm.105, label %abort, label %ok.2

ok.2:
	%vtpm.106 = getelementptr %String, %String* %vtpm.104, i32 0, i32 0
	%vtpm.107 = load %_String_vtable*, %_String_vtable** %vtpm.106
	%vtpm.108 = getelementptr %_String_vtable, %_String_vtable* %vtpm.107, i32 0, i32 8
	%tmp.2 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.108
	%vtpm.109 = call %String*(%String*, %String* ) %tmp.2( %String* %vtpm.104, %String* %vtpm.98 )
	%vtpm.110 = icmp eq %String* %vtpm.109, null
	br i1 %vtpm.110, label %abort, label %ok.3

ok.3:
	%vtpm.111 = getelementptr %String, %String* %vtpm.109, i32 0, i32 0
	%vtpm.112 = load %_String_vtable*, %_String_vtable** %vtpm.111
	%vtpm.113 = getelementptr %_String_vtable, %_String_vtable* %vtpm.112, i32 0, i32 8
	%tmp.3 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.113
	%vtpm.114 = call %String*(%String*, %String* ) %tmp.3( %String* %vtpm.109, %String* @String.2 )
	ret %String* %vtpm.114

abort:
	call void @abort(  )
	unreachable
}

define %Article* @Article_new() {

entry:
	%vtpm.116 = alloca %Article*
	%vtpm.117 = getelementptr %_Article_vtable, %_Article_vtable* @_Article_vtable_prototype, i32 0, i32 1
	%vtpm.118 = load i32, i32* %vtpm.117
	%vtpm.119 = call i8*(i32 ) @malloc( i32 %vtpm.118 )
	%vtpm.120 = bitcast i8* %vtpm.119 to %Article*
	%malloc.null = icmp eq %Article* %vtpm.120, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.121 = getelementptr %Article, %Article* %vtpm.120, i32 0, i32 0
	store %_Article_vtable* @_Article_vtable_prototype, %_Article_vtable** %vtpm.121
	store %Article* %vtpm.120, %Article** %vtpm.116
	%vtpm.122 = getelementptr %Article, %Article* %vtpm.120, i32 0, i32 1
	store %String* null, %String** %vtpm.122
	%vtpm.123 = getelementptr %Article, %Article* %vtpm.120, i32 0, i32 2
	store %String* null, %String** %vtpm.123
	%vtpm.124 = getelementptr %Article, %Article* %vtpm.120, i32 0, i32 3
	store %String* null, %String** %vtpm.124
	%vtpm.125 = getelementptr %Article, %Article* %vtpm.120, i32 0, i32 1
	store %String* null, %String** %vtpm.125
	%vtpm.126 = getelementptr %Article, %Article* %vtpm.120, i32 0, i32 2
	store %String* null, %String** %vtpm.126
	%vtpm.127 = getelementptr %Article, %Article* %vtpm.120, i32 0, i32 3
	store %String* null, %String** %vtpm.127
	ret %Article* %vtpm.120

abort:
	call void @abort(  )
	unreachable
}

define %Book* @BookList_car(%BookList* %self) {

entry:
	%vtpm.129 = alloca %BookList*
	store %BookList* %self, %BookList** %vtpm.129
	%vtpm.130 = load %BookList*, %BookList** %vtpm.129
	%vtpm.131 = icmp eq %BookList* %vtpm.130, null
	br i1 %vtpm.131, label %abort, label %ok.0

ok.0:
	%vtpm.132 = getelementptr %BookList, %BookList* %vtpm.130, i32 0, i32 0
	%vtpm.133 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.132
	%vtpm.134 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.133, i32 0, i32 4
	%tmp.0 = load %Object* (%BookList*) *, %Object* (%BookList*) ** %vtpm.134
	%vtpm.135 = call %Object*(%BookList* ) %tmp.0( %BookList* %vtpm.130 )
	%vtpm.136 = call %Book* @Book_new(  )
	ret %Book* %vtpm.136

abort:
	call void @abort(  )
	unreachable
}

define %BookList* @BookList_cdr(%BookList* %self) {

entry:
	%vtpm.138 = alloca %BookList*
	store %BookList* %self, %BookList** %vtpm.138
	%vtpm.139 = load %BookList*, %BookList** %vtpm.138
	%vtpm.140 = icmp eq %BookList* %vtpm.139, null
	br i1 %vtpm.140, label %abort, label %ok.0

ok.0:
	%vtpm.141 = getelementptr %BookList, %BookList* %vtpm.139, i32 0, i32 0
	%vtpm.142 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.141
	%vtpm.143 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.142, i32 0, i32 4
	%tmp.0 = load %Object* (%BookList*) *, %Object* (%BookList*) ** %vtpm.143
	%vtpm.144 = call %Object*(%BookList* ) %tmp.0( %BookList* %vtpm.139 )
	%vtpm.145 = call %BookList* @BookList_new(  )
	ret %BookList* %vtpm.145

abort:
	call void @abort(  )
	unreachable
}

define %Cons* @BookList_cons(%BookList* %self, %Book* %hd) {

entry:
	%vtpm.147 = alloca %Cons*
	%vtpm.148 = alloca %BookList*
	%vtpm.149 = alloca %Book*
	store %BookList* %self, %BookList** %vtpm.148
	store %Book* %hd, %Book** %vtpm.149
	%vtpm.150 = call %Cons* @Cons_new(  )
	store %Cons* %vtpm.150, %Cons** %vtpm.147
	%vtpm.151 = load %Book*, %Book** %vtpm.149
	%vtpm.152 = load %BookList*, %BookList** %vtpm.148
	%vtpm.153 = load %Cons*, %Cons** %vtpm.147
	%vtpm.154 = icmp eq %Cons* %vtpm.153, null
	br i1 %vtpm.154, label %abort, label %ok.0

ok.0:
	%vtpm.155 = getelementptr %Cons, %Cons* %vtpm.153, i32 0, i32 0
	%vtpm.156 = load %_Cons_vtable*, %_Cons_vtable** %vtpm.155
	%vtpm.157 = getelementptr %_Cons_vtable, %_Cons_vtable* %vtpm.156, i32 0, i32 16
	%tmp.0 = load %Cons* (%Cons*,%Book*,%BookList*) *, %Cons* (%Cons*,%Book*,%BookList*) ** %vtpm.157
	%vtpm.158 = call %Cons*(%Cons*, %Book*, %BookList* ) %tmp.0( %Cons* %vtpm.153, %Book* %vtpm.151, %BookList* %vtpm.152 )
	ret %Cons* %vtpm.158

abort:
	call void @abort(  )
	unreachable
}

define i1 @BookList_isNil(%BookList* %self) {

entry:
	%vtpm.160 = alloca %BookList*
	store %BookList* %self, %BookList** %vtpm.160
	%vtpm.161 = load %BookList*, %BookList** %vtpm.160
	%vtpm.162 = icmp eq %BookList* %vtpm.161, null
	br i1 %vtpm.162, label %abort, label %ok.0

ok.0:
	%vtpm.163 = getelementptr %BookList, %BookList* %vtpm.161, i32 0, i32 0
	%vtpm.164 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.163
	%vtpm.165 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.164, i32 0, i32 4
	%tmp.0 = load %Object* (%BookList*) *, %Object* (%BookList*) ** %vtpm.165
	%vtpm.166 = call %Object*(%BookList* ) %tmp.0( %BookList* %vtpm.161 )
	ret i1 true

abort:
	call void @abort(  )
	unreachable
}

define %String* @BookList_print_list(%BookList* %self, %String* %s) {

entry:
	%vtpm.168 = alloca %BookList*
	%vtpm.169 = alloca %String*
	store %BookList* %self, %BookList** %vtpm.168
	store %String* %s, %String** %vtpm.169
	ret %String* @String.5

abort:
	call void @abort(  )
	unreachable
}

define %BookList* @BookList_new() {

entry:
	%vtpm.171 = alloca %BookList*
	%vtpm.172 = getelementptr %_BookList_vtable, %_BookList_vtable* @_BookList_vtable_prototype, i32 0, i32 1
	%vtpm.173 = load i32, i32* %vtpm.172
	%vtpm.174 = call i8*(i32 ) @malloc( i32 %vtpm.173 )
	%vtpm.175 = bitcast i8* %vtpm.174 to %BookList*
	%malloc.null = icmp eq %BookList* %vtpm.175, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.176 = getelementptr %BookList, %BookList* %vtpm.175, i32 0, i32 0
	store %_BookList_vtable* @_BookList_vtable_prototype, %_BookList_vtable** %vtpm.176
	store %BookList* %vtpm.175, %BookList** %vtpm.171
	ret %BookList* %vtpm.175

abort:
	call void @abort(  )
	unreachable
}

define %Book* @Cons_car(%Cons* %self) {

entry:
	%vtpm.178 = alloca %Cons*
	store %Cons* %self, %Cons** %vtpm.178
	%vtpm.179 = load %Cons*, %Cons** %vtpm.178
	%vtpm.180 = getelementptr %Cons, %Cons* %vtpm.179, i32 0, i32 1
	%vtpm.181 = load %Book*, %Book** %vtpm.180
	ret %Book* %vtpm.181

abort:
	call void @abort(  )
	unreachable
}

define %BookList* @Cons_cdr(%Cons* %self) {

entry:
	%vtpm.183 = alloca %Cons*
	store %Cons* %self, %Cons** %vtpm.183
	%vtpm.184 = load %Cons*, %Cons** %vtpm.183
	%vtpm.185 = getelementptr %Cons, %Cons* %vtpm.184, i32 0, i32 2
	%vtpm.186 = load %BookList*, %BookList** %vtpm.185
	ret %BookList* %vtpm.186

abort:
	call void @abort(  )
	unreachable
}

define %Cons* @Cons_init(%Cons* %self, %Book* %hd, %BookList* %tl) {

entry:
	%vtpm.188 = alloca %Cons*
	%vtpm.189 = alloca %Book*
	%vtpm.190 = alloca %BookList*
	store %Cons* %self, %Cons** %vtpm.188
	store %Book* %hd, %Book** %vtpm.189
	store %BookList* %tl, %BookList** %vtpm.190
	%vtpm.191 = load %Book*, %Book** %vtpm.189
	%vtpm.192 = load %Cons*, %Cons** %vtpm.188
	%vtpm.193 = getelementptr %Cons, %Cons* %vtpm.192, i32 0, i32 1
	store %Book* %vtpm.191, %Book** %vtpm.193
	%vtpm.194 = load %BookList*, %BookList** %vtpm.190
	%vtpm.195 = load %Cons*, %Cons** %vtpm.188
	%vtpm.196 = getelementptr %Cons, %Cons* %vtpm.195, i32 0, i32 2
	store %BookList* %vtpm.194, %BookList** %vtpm.196
	%vtpm.197 = load %Cons*, %Cons** %vtpm.188
	ret %Cons* %vtpm.197

abort:
	call void @abort(  )
	unreachable
}

define i1 @Cons_isNil(%Cons* %self) {

entry:
	%vtpm.199 = alloca %Cons*
	store %Cons* %self, %Cons** %vtpm.199
	ret i1 false

abort:
	call void @abort(  )
	unreachable
}

define %String* @Cons_print_list(%Cons* %self, %String* %s) {

entry:
	%tmp.0 = alloca %String*
	%vtpm.201 = alloca %Book*
	%vtpm.202 = alloca %Article*
	%vtpm.203 = alloca %Cons*
	%vtpm.204 = alloca %String*
	store %Cons* %self, %Cons** %vtpm.203
	store %String* %s, %String** %vtpm.204
	%vtpm.205 = load %String*, %String** %vtpm.204
	%vtpm.206 = load %Cons*, %Cons** %vtpm.203
	%vtpm.207 = getelementptr %Cons, %Cons* %vtpm.206, i32 0, i32 1
	%vtpm.208 = load %Book*, %Book** %vtpm.207
	%vtpm.209 = icmp eq %Book* %vtpm.208, null
	br i1 %vtpm.209, label %abort, label %ok.0

ok.0:
	%vtpm.210 = getelementptr %Book, %Book* %vtpm.208, i32 0, i32 0
	%vtpm.211 = load %_Book_vtable*, %_Book_vtable** %vtpm.210
	%vtpm.212 = getelementptr %_Book_vtable, %_Book_vtable* %vtpm.211, i32 0, i32 13
	%tmp.1 = load %String* (%Book*,%String*) *, %String* (%Book*,%String*) ** %vtpm.212
	%vtpm.213 = call %String*(%Book*, %String* ) %tmp.1( %Book* %vtpm.208, %String* %vtpm.205 )
	store %String* %vtpm.213, %String** %vtpm.204
	%vtpm.214 = load %Cons*, %Cons** %vtpm.203
	%vtpm.215 = getelementptr %Cons, %Cons* %vtpm.214, i32 0, i32 1
	%vtpm.216 = load %Book*, %Book** %vtpm.215
	%vtpm.217 = icmp eq %Book* %vtpm.216, null
	br i1 %vtpm.217, label %abort, label %ok.1

ok.1:
	%vtpm.218 = getelementptr %Book, %Book* %vtpm.216, i32 0, i32 0
	%vtpm.219 = load %_Book_vtable*, %_Book_vtable** %vtpm.218
	%vtpm.220 = getelementptr %_Book_vtable, %_Book_vtable* %vtpm.219, i32 0, i32 12
	%tmp.2 = load %Object* (%Book*) *, %Object* (%Book*) ** %vtpm.220
	%vtpm.221 = call %Object*(%Book* ) %tmp.2( %Book* %vtpm.216 )
	%tmp.3 = icmp eq %Object* %vtpm.221, null
	br i1 %tmp.3, label %abort, label %ok.2

ok.2:
	%vtpm.222 = getelementptr %Object, %Object* %vtpm.221, i32 0, i32 0
	%vtpm.223 = load %_Object_vtable*, %_Object_vtable** %vtpm.222
	%vtpm.224 = getelementptr %_Object_vtable, %_Object_vtable* %vtpm.223, i32 0, i32 0
	%vtpm.225 = load i32, i32* %vtpm.224
	br label %case.hdr.0

case.hdr.0:
	br label %case.6.0

case.6.0:
	%vtpm.226 = icmp slt i32 %vtpm.225, 6
	br i1 %vtpm.226, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%vtpm.227 = icmp sgt i32 %vtpm.225, 6
	br i1 %vtpm.227, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%vtpm.228 = bitcast %Object* %vtpm.221 to %Article*
	store %Article* %vtpm.228, %Article** %vtpm.202
	%vtpm.229 = load %String*, %String** %vtpm.204
	%vtpm.230 = icmp eq %String* %vtpm.229, null
	br i1 %vtpm.230, label %abort, label %ok.3

ok.3:
	%vtpm.231 = getelementptr %String, %String* %vtpm.229, i32 0, i32 0
	%vtpm.232 = load %_String_vtable*, %_String_vtable** %vtpm.231
	%vtpm.233 = getelementptr %_String_vtable, %_String_vtable* %vtpm.232, i32 0, i32 8
	%tmp.4 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.233
	%vtpm.234 = call %String*(%String*, %String* ) %tmp.4( %String* %vtpm.229, %String* @String.7 )
	store %String* %vtpm.234, %String** %tmp.0
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%vtpm.235 = icmp slt i32 %vtpm.225, 5
	br i1 %vtpm.235, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%vtpm.236 = icmp sgt i32 %vtpm.225, 6
	br i1 %vtpm.236, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	%vtpm.237 = bitcast %Object* %vtpm.221 to %Book*
	store %Book* %vtpm.237, %Book** %vtpm.201
	%vtpm.238 = load %String*, %String** %vtpm.204
	%vtpm.239 = icmp eq %String* %vtpm.238, null
	br i1 %vtpm.239, label %abort, label %ok.4

ok.4:
	%vtpm.240 = getelementptr %String, %String* %vtpm.238, i32 0, i32 0
	%vtpm.241 = load %_String_vtable*, %_String_vtable** %vtpm.240
	%vtpm.242 = getelementptr %_String_vtable, %_String_vtable* %vtpm.241, i32 0, i32 8
	%tmp.5 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.242
	%vtpm.243 = call %String*(%String*, %String* ) %tmp.5( %String* %vtpm.238, %String* @String.6 )
	store %String* %vtpm.243, %String** %tmp.0
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%tmp.6 = load %String*, %String** %tmp.0
	store %String* %tmp.6, %String** %vtpm.204
	%vtpm.244 = load %String*, %String** %vtpm.204
	%vtpm.245 = load %Cons*, %Cons** %vtpm.203
	%vtpm.246 = getelementptr %Cons, %Cons* %vtpm.245, i32 0, i32 2
	%vtpm.247 = load %BookList*, %BookList** %vtpm.246
	%vtpm.248 = icmp eq %BookList* %vtpm.247, null
	br i1 %vtpm.248, label %abort, label %ok.5

ok.5:
	%vtpm.249 = getelementptr %BookList, %BookList* %vtpm.247, i32 0, i32 0
	%vtpm.250 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.249
	%vtpm.251 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.250, i32 0, i32 15
	%tmp.7 = load %String* (%BookList*,%String*) *, %String* (%BookList*,%String*) ** %vtpm.251
	%vtpm.252 = call %String*(%BookList*, %String* ) %tmp.7( %BookList* %vtpm.247, %String* %vtpm.244 )
	ret %String* %vtpm.252

abort:
	call void @abort(  )
	unreachable
}

define %Cons* @Cons_new() {

entry:
	%vtpm.254 = alloca %Cons*
	%vtpm.255 = getelementptr %_Cons_vtable, %_Cons_vtable* @_Cons_vtable_prototype, i32 0, i32 1
	%vtpm.256 = load i32, i32* %vtpm.255
	%vtpm.257 = call i8*(i32 ) @malloc( i32 %vtpm.256 )
	%vtpm.258 = bitcast i8* %vtpm.257 to %Cons*
	%malloc.null = icmp eq %Cons* %vtpm.258, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.259 = getelementptr %Cons, %Cons* %vtpm.258, i32 0, i32 0
	store %_Cons_vtable* @_Cons_vtable_prototype, %_Cons_vtable** %vtpm.259
	store %Cons* %vtpm.258, %Cons** %vtpm.254
	%vtpm.260 = getelementptr %Cons, %Cons* %vtpm.258, i32 0, i32 1
	store %Book* null, %Book** %vtpm.260
	%vtpm.261 = getelementptr %Cons, %Cons* %vtpm.258, i32 0, i32 2
	store %BookList* null, %BookList** %vtpm.261
	%vtpm.262 = getelementptr %Cons, %Cons* %vtpm.258, i32 0, i32 1
	store %Book* null, %Book** %vtpm.262
	%vtpm.263 = getelementptr %Cons, %Cons* %vtpm.258, i32 0, i32 2
	store %BookList* null, %BookList** %vtpm.263
	ret %Cons* %vtpm.258

abort:
	call void @abort(  )
	unreachable
}

define i1 @Nil_isNil(%Nil* %self) {

entry:
	%vtpm.265 = alloca %Nil*
	store %Nil* %self, %Nil** %vtpm.265
	ret i1 true

abort:
	call void @abort(  )
	unreachable
}

define %String* @Nil_print_list(%Nil* %self, %String* %s) {

entry:
	%vtpm.267 = alloca %Nil*
	%vtpm.268 = alloca %String*
	store %Nil* %self, %Nil** %vtpm.267
	store %String* %s, %String** %vtpm.268
	%vtpm.269 = load %String*, %String** %vtpm.268
	ret %String* %vtpm.269

abort:
	call void @abort(  )
	unreachable
}

define %Nil* @Nil_new() {

entry:
	%vtpm.271 = alloca %Nil*
	%vtpm.272 = getelementptr %_Nil_vtable, %_Nil_vtable* @_Nil_vtable_prototype, i32 0, i32 1
	%vtpm.273 = load i32, i32* %vtpm.272
	%vtpm.274 = call i8*(i32 ) @malloc( i32 %vtpm.273 )
	%vtpm.275 = bitcast i8* %vtpm.274 to %Nil*
	%malloc.null = icmp eq %Nil* %vtpm.275, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.276 = getelementptr %Nil, %Nil* %vtpm.275, i32 0, i32 0
	store %_Nil_vtable* @_Nil_vtable_prototype, %_Nil_vtable** %vtpm.276
	store %Nil* %vtpm.275, %Nil** %vtpm.271
	ret %Nil* %vtpm.275

abort:
	call void @abort(  )
	unreachable
}

define %String* @Main_main(%Main* %self) {

entry:
	%vtpm.278 = alloca %Book*
	%vtpm.279 = alloca %Article*
	%vtpm.280 = alloca %Main*
	store %Main* %self, %Main** %vtpm.280
	%vtpm.281 = call %Book* @Book_new(  )
	%vtpm.282 = icmp eq %Book* %vtpm.281, null
	br i1 %vtpm.282, label %abort, label %ok.0

ok.0:
	%vtpm.283 = getelementptr %Book, %Book* %vtpm.281, i32 0, i32 0
	%vtpm.284 = load %_Book_vtable*, %_Book_vtable** %vtpm.283
	%vtpm.285 = getelementptr %_Book_vtable, %_Book_vtable* %vtpm.284, i32 0, i32 11
	%tmp.0 = load %Book* (%Book*,%String*,%String*) *, %Book* (%Book*,%String*,%String*) ** %vtpm.285
	%vtpm.286 = call %Book*(%Book*, %String*, %String* ) %tmp.0( %Book* %vtpm.281, %String* @String.8, %String* @String.9 )
	store %Book* %vtpm.286, %Book** %vtpm.278
	%vtpm.287 = call %Article* @Article_new(  )
	%vtpm.288 = icmp eq %Article* %vtpm.287, null
	br i1 %vtpm.288, label %abort, label %ok.1

ok.1:
	%vtpm.289 = getelementptr %Article, %Article* %vtpm.287, i32 0, i32 0
	%vtpm.290 = load %_Article_vtable*, %_Article_vtable** %vtpm.289
	%vtpm.291 = getelementptr %_Article_vtable, %_Article_vtable* %vtpm.290, i32 0, i32 14
	%tmp.1 = load %Article* (%Article*,%String*,%String*,%String*) *, %Article* (%Article*,%String*,%String*,%String*) ** %vtpm.291
	%vtpm.292 = call %Article*(%Article*, %String*, %String*, %String* ) %tmp.1( %Article* %vtpm.287, %String* @String.10, %String* @String.11, %String* @String.12 )
	store %Article* %vtpm.292, %Article** %vtpm.279
	%vtpm.293 = load %Article*, %Article** %vtpm.279
	%vtpm.294 = load %Book*, %Book** %vtpm.278
	%vtpm.295 = call %Nil* @Nil_new(  )
	%vtpm.296 = icmp eq %Nil* %vtpm.295, null
	br i1 %vtpm.296, label %abort, label %ok.2

ok.2:
	%vtpm.297 = getelementptr %Nil, %Nil* %vtpm.295, i32 0, i32 0
	%vtpm.298 = load %_Nil_vtable*, %_Nil_vtable** %vtpm.297
	%vtpm.299 = getelementptr %_Nil_vtable, %_Nil_vtable* %vtpm.298, i32 0, i32 12
	%tmp.2 = load %Cons* (%Nil*,%Book*) *, %Cons* (%Nil*,%Book*) ** %vtpm.299
	%vtpm.300 = call %Cons*(%Nil*, %Book* ) %tmp.2( %Nil* %vtpm.295, %Book* %vtpm.294 )
	%vtpm.301 = icmp eq %Cons* %vtpm.300, null
	br i1 %vtpm.301, label %abort, label %ok.3

ok.3:
	%vtpm.302 = getelementptr %Cons, %Cons* %vtpm.300, i32 0, i32 0
	%vtpm.303 = load %_Cons_vtable*, %_Cons_vtable** %vtpm.302
	%vtpm.304 = getelementptr %_Cons_vtable, %_Cons_vtable* %vtpm.303, i32 0, i32 12
	%tmp.3 = load %Cons* (%Cons*,%Book*) *, %Cons* (%Cons*,%Book*) ** %vtpm.304
	%vtpm.305 = bitcast %Article* %vtpm.293 to %Book*
	%vtpm.306 = call %Cons*(%Cons*, %Book* ) %tmp.3( %Cons* %vtpm.300, %Book* %vtpm.305 )
	%vtpm.307 = load %Main*, %Main** %vtpm.280
	%vtpm.308 = getelementptr %Main, %Main* %vtpm.307, i32 0, i32 1
	%vtpm.309 = bitcast %Cons* %vtpm.306 to %BookList*
	store %BookList* %vtpm.309, %BookList** %vtpm.308
	%vtpm.310 = load %Main*, %Main** %vtpm.280
	%vtpm.311 = getelementptr %Main, %Main* %vtpm.310, i32 0, i32 1
	%vtpm.312 = load %BookList*, %BookList** %vtpm.311
	%vtpm.313 = icmp eq %BookList* %vtpm.312, null
	br i1 %vtpm.313, label %abort, label %ok.4

ok.4:
	%vtpm.314 = getelementptr %BookList, %BookList* %vtpm.312, i32 0, i32 0
	%vtpm.315 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.314
	%vtpm.316 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.315, i32 0, i32 15
	%tmp.4 = load %String* (%BookList*,%String*) *, %String* (%BookList*,%String*) ** %vtpm.316
	%vtpm.317 = call %String*(%BookList*, %String* ) %tmp.4( %BookList* %vtpm.312, %String* @String.5 )
	ret %String* %vtpm.317

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.319 = alloca %Main*
	%vtpm.320 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.321 = load i32, i32* %vtpm.320
	%vtpm.322 = call i8*(i32 ) @malloc( i32 %vtpm.321 )
	%vtpm.323 = bitcast i8* %vtpm.322 to %Main*
	%malloc.null = icmp eq %Main* %vtpm.323, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%vtpm.324 = getelementptr %Main, %Main* %vtpm.323, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.324
	store %Main* %vtpm.323, %Main** %vtpm.319
	%vtpm.325 = getelementptr %Main, %Main* %vtpm.323, i32 0, i32 1
	store %BookList* null, %BookList** %vtpm.325
	%vtpm.326 = getelementptr %Main, %Main* %vtpm.323, i32 0, i32 1
	store %BookList* null, %BookList** %vtpm.326
	ret %Main* %vtpm.323

abort:
	call void @abort(  )
	unreachable
}

