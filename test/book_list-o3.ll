; ModuleID = 'book_list.ll'
source_filename = "book_list.ll"

%_Object_vtable = type { i32, i32, i8*, %Object* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)* }
%Object = type { %_Object_vtable* }
%String = type { %_String_vtable*, i8* }
%_String_vtable = type { i32, i32, i8*, %String* ()*, %Object* (%String*)*, %String* (%String*)*, %String* (%String*)*, i32 (%String*)*, %String* (%String*, %String*)*, %String* (%String*, i32, i32)* }
%_Int_vtable = type { i32, i32, i8*, %Int* ()*, %Object* (%Int*)*, %String* (%Int*)*, %Int* (%Int*)* }
%Int = type { %_Int_vtable*, i32 }
%_Bool_vtable = type { i32, i32, i8*, %Bool* ()*, %Object* (%Bool*)*, %String* (%Bool*)*, %Bool* (%Bool*)* }
%Bool = type { %_Bool_vtable*, i1 }
%_IO_vtable = type { i32, i32, i8*, %IO* ()*, %Object* (%IO*)*, %String* (%IO*)*, %IO* (%IO*)*, %IO* (%IO*, %String*)*, %IO* (%IO*, i32)*, %String* (%IO*)*, i32 (%IO*)* }
%IO = type { %_IO_vtable* }
%_Book_vtable = type { i32, i32, i8*, %Book* ()*, %Object* (%Book*)*, %String* (%Book*)*, %Book* (%Book*)*, %Book* (%Book*, %String*)*, %Book* (%Book*, i32)*, %String* (%Book*)*, i32 (%Book*)*, %Book* (%Book*, %String*, %String*)*, %Object* (%Book*)*, %String* (%Book*, %String*)* }
%Book = type { %_Book_vtable*, %String*, %String* }
%_Article_vtable = type { i32, i32, i8*, %Article* ()*, %Object* (%Article*)*, %String* (%Article*)*, %Article* (%Article*)*, %Article* (%Article*, %String*)*, %Article* (%Article*, i32)*, %String* (%Article*)*, i32 (%Article*)*, %Book* (%Article*, %String*, %String*)*, %Object* (%Article*)*, %String* (%Article*, %String*)*, %Article* (%Article*, %String*, %String*, %String*)* }
%Article = type { %_Article_vtable*, %String*, %String*, %String* }
%_BookList_vtable = type { i32, i32, i8*, %BookList* ()*, %Object* (%BookList*)*, %String* (%BookList*)*, %BookList* (%BookList*)*, %BookList* (%BookList*, %String*)*, %BookList* (%BookList*, i32)*, %String* (%BookList*)*, i32 (%BookList*)*, i1 (%BookList*)*, %Cons* (%BookList*, %Book*)*, %Book* (%BookList*)*, %BookList* (%BookList*)*, %String* (%BookList*, %String*)* }
%BookList = type { %_BookList_vtable* }
%Cons = type { %_Cons_vtable*, %Book*, %BookList* }
%_Cons_vtable = type { i32, i32, i8*, %Cons* ()*, %Object* (%Cons*)*, %String* (%Cons*)*, %Cons* (%Cons*)*, %Cons* (%Cons*, %String*)*, %Cons* (%Cons*, i32)*, %String* (%Cons*)*, i32 (%Cons*)*, i1 (%Cons*)*, %Cons* (%Cons*, %Book*)*, %Book* (%Cons*)*, %BookList* (%Cons*)*, %String* (%Cons*, %String*)*, %Cons* (%Cons*, %Book*, %BookList*)* }
%_Nil_vtable = type { i32, i32, i8*, %Nil* ()*, %Object* (%Nil*)*, %String* (%Nil*)*, %Nil* (%Nil*)*, %Nil* (%Nil*, %String*)*, %Nil* (%Nil*, i32)*, %String* (%Nil*)*, i32 (%Nil*)*, i1 (%Nil*)*, %Cons* (%Nil*, %Book*)*, %Book* (%Nil*)*, %BookList* (%Nil*)*, %String* (%Nil*, %String*)* }
%Nil = type { %_Nil_vtable* }
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %String* (%Main*)* }
%Main = type { %_Main_vtable*, %BookList* }

@str.Object = internal constant [7 x i8] c"Object\00"
@_Object_vtable_prototype = local_unnamed_addr constant %_Object_vtable { i32 0, i32 ptrtoint (%Object* getelementptr (%Object, %Object* null, i32 1) to i32), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.Object, i32 0, i32 0), %Object* ()* @Object_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy }
@str.Int = internal constant [4 x i8] c"Int\00"
@_Int_vtable_prototype = local_unnamed_addr constant %_Int_vtable { i32 1, i32 ptrtoint (%Int* getelementptr (%Int, %Int* null, i32 1) to i32), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.Int, i32 0, i32 0), %Int* ()* @Int_new, %Object* (%Int*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Int*)*), %String* (%Int*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Int*)*), %Int* (%Int*)* bitcast (%Object* (%Object*)* @Object_copy to %Int* (%Int*)*) }
@str.Bool = internal constant [5 x i8] c"Bool\00"
@_Bool_vtable_prototype = local_unnamed_addr constant %_Bool_vtable { i32 2, i32 ptrtoint (%Bool* getelementptr (%Bool, %Bool* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Bool, i32 0, i32 0), %Bool* ()* @Bool_new, %Object* (%Bool*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Bool*)*), %String* (%Bool*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Bool*)*), %Bool* (%Bool*)* bitcast (%Object* (%Object*)* @Object_copy to %Bool* (%Bool*)*) }
@str.String = internal constant [7 x i8] c"String\00"
@_String_vtable_prototype = constant %_String_vtable { i32 3, i32 ptrtoint (%String* getelementptr (%String, %String* null, i32 1) to i32), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.String, i32 0, i32 0), %String* ()* @String_new, %Object* (%String*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%String*)*), %String* (%String*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%String*)*), %String* (%String*)* bitcast (%Object* (%Object*)* @Object_copy to %String* (%String*)*), i32 (%String*)* @String_length, %String* (%String*, %String*)* @String_concat, %String* (%String*, i32, i32)* @String_substr }
@str.IO = internal constant [3 x i8] c"IO\00"
@_IO_vtable_prototype = local_unnamed_addr constant %_IO_vtable { i32 4, i32 ptrtoint (%IO* getelementptr (%IO, %IO* null, i32 1) to i32), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.IO, i32 0, i32 0), %IO* ()* @IO_new, %Object* (%IO*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%IO*)*), %String* (%IO*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%IO*)*), %IO* (%IO*)* bitcast (%Object* (%Object*)* @Object_copy to %IO* (%IO*)*), %IO* (%IO*, %String*)* @IO_out_string, %IO* (%IO*, i32)* @IO_out_int, %String* (%IO*)* @IO_in_string, i32 (%IO*)* @IO_in_int }
@str.Book = internal constant [5 x i8] c"Book\00"
@_Book_vtable_prototype = constant %_Book_vtable { i32 5, i32 ptrtoint (%Book* getelementptr (%Book, %Book* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Book, i32 0, i32 0), %Book* ()* @Book_new, %Object* (%Book*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Book*)*), %String* (%Book*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Book*)*), %Book* (%Book*)* bitcast (%Object* (%Object*)* @Object_copy to %Book* (%Book*)*), %Book* (%Book*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Book* (%Book*, %String*)*), %Book* (%Book*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Book* (%Book*, i32)*), %String* (%Book*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Book*)*), i32 (%Book*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Book*)*), %Book* (%Book*, %String*, %String*)* @Book_initBook, %Object* (%Book*)* @Book_getSelf, %String* (%Book*, %String*)* @Book_print }
@str.Article = internal constant [8 x i8] c"Article\00"
@_Article_vtable_prototype = constant %_Article_vtable { i32 6, i32 ptrtoint (%Article* getelementptr (%Article, %Article* null, i32 1) to i32), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @str.Article, i32 0, i32 0), %Article* ()* @Article_new, %Object* (%Article*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Article*)*), %String* (%Article*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Article*)*), %Article* (%Article*)* bitcast (%Object* (%Object*)* @Object_copy to %Article* (%Article*)*), %Article* (%Article*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Article* (%Article*, %String*)*), %Article* (%Article*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Article* (%Article*, i32)*), %String* (%Article*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Article*)*), i32 (%Article*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Article*)*), %Book* (%Article*, %String*, %String*)* bitcast (%Book* (%Book*, %String*, %String*)* @Book_initBook to %Book* (%Article*, %String*, %String*)*), %Object* (%Article*)* bitcast (%Object* (%Book*)* @Book_getSelf to %Object* (%Article*)*), %String* (%Article*, %String*)* bitcast (%String* (%Book*, %String*)* @Book_print to %String* (%Article*, %String*)*), %Article* (%Article*, %String*, %String*, %String*)* @Article_initArticle }
@str.BookList = internal constant [9 x i8] c"BookList\00"
@_BookList_vtable_prototype = constant %_BookList_vtable { i32 7, i32 ptrtoint (%BookList* getelementptr (%BookList, %BookList* null, i32 1) to i32), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str.BookList, i32 0, i32 0), %BookList* ()* @BookList_new, %Object* (%BookList*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%BookList*)*), %String* (%BookList*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%BookList*)*), %BookList* (%BookList*)* bitcast (%Object* (%Object*)* @Object_copy to %BookList* (%BookList*)*), %BookList* (%BookList*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %BookList* (%BookList*, %String*)*), %BookList* (%BookList*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %BookList* (%BookList*, i32)*), %String* (%BookList*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%BookList*)*), i32 (%BookList*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%BookList*)*), i1 (%BookList*)* @BookList_isNil, %Cons* (%BookList*, %Book*)* @BookList_cons, %Book* (%BookList*)* @BookList_car, %BookList* (%BookList*)* @BookList_cdr, %String* (%BookList*, %String*)* @BookList_print_list }
@str.Cons = internal constant [5 x i8] c"Cons\00"
@_Cons_vtable_prototype = constant %_Cons_vtable { i32 8, i32 ptrtoint (%Cons* getelementptr (%Cons, %Cons* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Cons, i32 0, i32 0), %Cons* ()* @Cons_new, %Object* (%Cons*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Cons*)*), %String* (%Cons*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Cons*)*), %Cons* (%Cons*)* bitcast (%Object* (%Object*)* @Object_copy to %Cons* (%Cons*)*), %Cons* (%Cons*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Cons* (%Cons*, %String*)*), %Cons* (%Cons*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Cons* (%Cons*, i32)*), %String* (%Cons*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Cons*)*), i32 (%Cons*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Cons*)*), i1 (%Cons*)* bitcast (i1 (%BookList*)* @BookList_isNil to i1 (%Cons*)*), %Cons* (%Cons*, %Book*)* bitcast (%Cons* (%BookList*, %Book*)* @BookList_cons to %Cons* (%Cons*, %Book*)*), %Book* (%Cons*)* bitcast (%Book* (%BookList*)* @BookList_car to %Book* (%Cons*)*), %BookList* (%Cons*)* bitcast (%BookList* (%BookList*)* @BookList_cdr to %BookList* (%Cons*)*), %String* (%Cons*, %String*)* bitcast (%String* (%BookList*, %String*)* @BookList_print_list to %String* (%Cons*, %String*)*), %Cons* (%Cons*, %Book*, %BookList*)* @Cons_init }
@str.Nil = internal constant [4 x i8] c"Nil\00"
@_Nil_vtable_prototype = constant %_Nil_vtable { i32 9, i32 ptrtoint (%Nil* getelementptr (%Nil, %Nil* null, i32 1) to i32), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.Nil, i32 0, i32 0), %Nil* ()* @Nil_new, %Object* (%Nil*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Nil*)*), %String* (%Nil*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Nil*)*), %Nil* (%Nil*)* bitcast (%Object* (%Object*)* @Object_copy to %Nil* (%Nil*)*), %Nil* (%Nil*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Nil* (%Nil*, %String*)*), %Nil* (%Nil*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Nil* (%Nil*, i32)*), %String* (%Nil*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Nil*)*), i32 (%Nil*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Nil*)*), i1 (%Nil*)* bitcast (i1 (%BookList*)* @BookList_isNil to i1 (%Nil*)*), %Cons* (%Nil*, %Book*)* bitcast (%Cons* (%BookList*, %Book*)* @BookList_cons to %Cons* (%Nil*, %Book*)*), %Book* (%Nil*)* bitcast (%Book* (%BookList*)* @BookList_car to %Book* (%Nil*)*), %BookList* (%Nil*)* bitcast (%BookList* (%BookList*)* @BookList_cdr to %BookList* (%Nil*)*), %String* (%Nil*, %String*)* bitcast (%String* (%BookList*, %String*)* @BookList_print_list to %String* (%Nil*, %String*)*) }
@str.Main = internal constant [5 x i8] c"Main\00"
@_Main_vtable_prototype = constant %_Main_vtable { i32 10, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %String* (%Main*)* @Main_main }
@global_str.7 = internal constant [30 x i8] c"- dynamic type was Article -\0A\00"
@String.7 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @global_str.7, i32 0, i32 0) }
@global_str.9 = internal constant [23 x i8] c"Aho, Sethi, and Ullman\00"
@String.9 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @global_str.9, i32 0, i32 0) }
@global_str.2 = internal constant [2 x i8] c"\0A\00"
@String.2 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @global_str.2, i32 0, i32 0) }
@global_str.3 = internal constant [13 x i8] c"author:     \00"
@String.3 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @global_str.3, i32 0, i32 0) }
@global_str.13 = internal constant [14 x i8] c"<basic class>\00"
@String.13 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.13, i32 0, i32 0) }
@global_str.4 = internal constant [14 x i8] c"periodical:  \00"
@String.4 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.4, i32 0, i32 0) }
@global_str.8 = internal constant [45 x i8] c"Compilers, Principles, Techniques, and Tools\00"
@String.8 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @global_str.8, i32 0, i32 0) }
@global_str.1 = internal constant [13 x i8] c"title:      \00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.5 = internal constant [1 x i8] zeroinitializer
@String.5 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @global_str.5, i32 0, i32 0) }
@global_str.11 = internal constant [8 x i8] c"Ulanoff\00"
@String.11 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_str.11, i32 0, i32 0) }
@global_str.0 = internal constant [13 x i8] c"book_list.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @global_str.0, i32 0, i32 0) }
@global_str.6 = internal constant [27 x i8] c"- dynamic type was Book -\0A\00"
@String.6 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @global_str.6, i32 0, i32 0) }
@global_str.10 = internal constant [20 x i8] c"The Top 100 CD_ROMs\00"
@String.10 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @global_str.10, i32 0, i32 0) }
@global_str.12 = internal constant [12 x i8] c"PC Magazine\00"
@String.12 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_str.12, i32 0, i32 0) }

declare void @abort() local_unnamed_addr

declare i8* @malloc(i32) local_unnamed_addr

declare %Object* @Object_abort(%Object*)

declare %String* @Object_type_name(%Object*)

declare %Object* @Object_copy(%Object*)

declare i32 @String_length(%String*)

declare %String* @String_concat(%String*, %String*)

declare %String* @String_substr(%String*, i32, i32)

declare %IO* @IO_out_string(%IO*, %String*)

declare %IO* @IO_out_int(%IO*, i32)

declare %String* @IO_in_string(%IO*)

declare i32 @IO_in_int(%IO*)

define i32 @main() local_unnamed_addr {
entry:
  %vtpm.322.i = tail call i8* @malloc(i32 16)
  %malloc.null.i = icmp eq i8* %vtpm.322.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.323.i = bitcast i8* %vtpm.322.i to %Main*
  %vtpm.324.i = bitcast i8* %vtpm.322.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.324.i, align 8
  %vtpm.325.i = getelementptr i8, i8* %vtpm.322.i, i64 8
  %0 = bitcast i8* %vtpm.325.i to %BookList**
  store %BookList* null, %BookList** %0, align 8
  %main.retval = tail call %String* @Main_main(%Main* nonnull %vtpm.323.i)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define %Object* @Book_getSelf(%Book* readnone %self) #0 {
entry:
  %vtpm.2 = bitcast %Book* %self to %Object*
  ret %Object* %vtpm.2
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define %Book* @Book_initBook(%Book* returned writeonly %self, %String* %title_p, %String* %author_p) #1 {
entry:
  %vtpm.9 = getelementptr %Book, %Book* %self, i64 0, i32 1
  store %String* %title_p, %String** %vtpm.9, align 8
  %vtpm.12 = getelementptr %Book, %Book* %self, i64 0, i32 2
  store %String* %author_p, %String** %vtpm.12, align 8
  ret %Book* %self
}

define %String* @Book_print(%Book* nocapture readonly %self, %String* %s) {
entry:
  %vtpm.18 = getelementptr %Book, %Book* %self, i64 0, i32 1
  %vtpm.19 = load %String*, %String** %vtpm.18, align 8
  %vtpm.21 = icmp eq %String* %s, null
  br i1 %vtpm.21, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.22 = getelementptr %String, %String* %s, i64 0, i32 0
  %vtpm.23 = load %_String_vtable*, %_String_vtable** %vtpm.22, align 8
  %vtpm.24 = getelementptr %_String_vtable, %_String_vtable* %vtpm.23, i64 0, i32 8
  %tmp.0 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.24, align 8
  %vtpm.25 = tail call %String* %tmp.0(%String* nonnull %s, %String* nonnull @String.1)
  %vtpm.26 = icmp eq %String* %vtpm.25, null
  br i1 %vtpm.26, label %abort, label %ok.1

ok.1:                                             ; preds = %ok.0
  %vtpm.27 = getelementptr %String, %String* %vtpm.25, i64 0, i32 0
  %vtpm.28 = load %_String_vtable*, %_String_vtable** %vtpm.27, align 8
  %vtpm.29 = getelementptr %_String_vtable, %_String_vtable* %vtpm.28, i64 0, i32 8
  %tmp.1 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.29, align 8
  %vtpm.30 = tail call %String* %tmp.1(%String* nonnull %vtpm.25, %String* %vtpm.19)
  %vtpm.31 = icmp eq %String* %vtpm.30, null
  br i1 %vtpm.31, label %abort, label %ok.2

ok.2:                                             ; preds = %ok.1
  %vtpm.32 = getelementptr %String, %String* %vtpm.30, i64 0, i32 0
  %vtpm.33 = load %_String_vtable*, %_String_vtable** %vtpm.32, align 8
  %vtpm.34 = getelementptr %_String_vtable, %_String_vtable* %vtpm.33, i64 0, i32 8
  %tmp.2 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.34, align 8
  %vtpm.35 = tail call %String* %tmp.2(%String* nonnull %vtpm.30, %String* nonnull @String.2)
  %vtpm.37 = getelementptr %Book, %Book* %self, i64 0, i32 2
  %vtpm.38 = load %String*, %String** %vtpm.37, align 8
  %vtpm.40 = icmp eq %String* %vtpm.35, null
  br i1 %vtpm.40, label %abort, label %ok.3

ok.3:                                             ; preds = %ok.2
  %vtpm.41 = getelementptr %String, %String* %vtpm.35, i64 0, i32 0
  %vtpm.42 = load %_String_vtable*, %_String_vtable** %vtpm.41, align 8
  %vtpm.43 = getelementptr %_String_vtable, %_String_vtable* %vtpm.42, i64 0, i32 8
  %tmp.3 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.43, align 8
  %vtpm.44 = tail call %String* %tmp.3(%String* nonnull %vtpm.35, %String* nonnull @String.3)
  %vtpm.45 = icmp eq %String* %vtpm.44, null
  br i1 %vtpm.45, label %abort, label %ok.4

ok.4:                                             ; preds = %ok.3
  %vtpm.46 = getelementptr %String, %String* %vtpm.44, i64 0, i32 0
  %vtpm.47 = load %_String_vtable*, %_String_vtable** %vtpm.46, align 8
  %vtpm.48 = getelementptr %_String_vtable, %_String_vtable* %vtpm.47, i64 0, i32 8
  %tmp.4 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.48, align 8
  %vtpm.49 = tail call %String* %tmp.4(%String* nonnull %vtpm.44, %String* %vtpm.38)
  %vtpm.50 = icmp eq %String* %vtpm.49, null
  br i1 %vtpm.50, label %abort, label %ok.5

ok.5:                                             ; preds = %ok.4
  %vtpm.51 = getelementptr %String, %String* %vtpm.49, i64 0, i32 0
  %vtpm.52 = load %_String_vtable*, %_String_vtable** %vtpm.51, align 8
  %vtpm.53 = getelementptr %_String_vtable, %_String_vtable* %vtpm.52, i64 0, i32 8
  %tmp.5 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.53, align 8
  %vtpm.54 = tail call %String* %tmp.5(%String* nonnull %vtpm.49, %String* nonnull @String.2)
  ret %String* %vtpm.54

abort:                                            ; preds = %ok.4, %ok.3, %ok.2, %ok.1, %ok.0, %entry
  tail call void @abort()
  unreachable
}

define %Book* @Book_new() {
entry:
  %vtpm.59 = tail call i8* @malloc(i32 24)
  %malloc.null = icmp eq i8* %vtpm.59, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.60 = bitcast i8* %vtpm.59 to %Book*
  %vtpm.61 = bitcast i8* %vtpm.59 to %_Book_vtable**
  store %_Book_vtable* @_Book_vtable_prototype, %_Book_vtable** %vtpm.61, align 8
  %vtpm.62 = getelementptr i8, i8* %vtpm.59, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %vtpm.62, i8 0, i64 16, i1 false)
  ret %Book* %vtpm.60

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define %Object* @Article_getSelf(%Article* readnone %self) local_unnamed_addr #0 {
entry:
  %vtpm.69 = bitcast %Article* %self to %Object*
  ret %Object* %vtpm.69
}

define %Article* @Article_initArticle(%Article* returned %self, %String* %title_p, %String* %author_p, %String* %per_title_p) {
entry:
  %vtpm.78 = icmp eq %Article* %self, null
  br i1 %vtpm.78, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.79 = getelementptr %Article, %Article* %self, i64 0, i32 0
  %vtpm.80 = load %_Article_vtable*, %_Article_vtable** %vtpm.79, align 8
  %vtpm.81 = getelementptr %_Article_vtable, %_Article_vtable* %vtpm.80, i64 0, i32 11
  %tmp.0 = load %Book* (%Article*, %String*, %String*)*, %Book* (%Article*, %String*, %String*)** %vtpm.81, align 8
  %vtpm.82 = tail call %Book* %tmp.0(%Article* nonnull %self, %String* %title_p, %String* %author_p)
  %vtpm.85 = getelementptr %Article, %Article* %self, i64 0, i32 3
  store %String* %per_title_p, %String** %vtpm.85, align 8
  ret %Article* %self

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %String* @Article_print(%Article* readonly %self, %String* %s) local_unnamed_addr {
entry:
  %vtpm.92 = icmp eq %Article* %self, null
  br i1 %vtpm.92, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %0 = getelementptr %Article, %Article* %self, i64 0, i32 1
  %vtpm.19.i = load %String*, %String** %0, align 8
  %vtpm.21.i = icmp eq %String* %s, null
  br i1 %vtpm.21.i, label %abort.i, label %ok.0.i

ok.0.i:                                           ; preds = %ok.0
  %vtpm.22.i = getelementptr %String, %String* %s, i64 0, i32 0
  %vtpm.23.i = load %_String_vtable*, %_String_vtable** %vtpm.22.i, align 8
  %vtpm.24.i = getelementptr %_String_vtable, %_String_vtable* %vtpm.23.i, i64 0, i32 8
  %tmp.0.i = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.24.i, align 8
  %vtpm.25.i = tail call %String* %tmp.0.i(%String* nonnull %s, %String* nonnull @String.1)
  %vtpm.26.i = icmp eq %String* %vtpm.25.i, null
  br i1 %vtpm.26.i, label %abort.i, label %ok.1.i

ok.1.i:                                           ; preds = %ok.0.i
  %vtpm.27.i = getelementptr %String, %String* %vtpm.25.i, i64 0, i32 0
  %vtpm.28.i = load %_String_vtable*, %_String_vtable** %vtpm.27.i, align 8
  %vtpm.29.i = getelementptr %_String_vtable, %_String_vtable* %vtpm.28.i, i64 0, i32 8
  %tmp.1.i = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.29.i, align 8
  %vtpm.30.i = tail call %String* %tmp.1.i(%String* nonnull %vtpm.25.i, %String* %vtpm.19.i)
  %vtpm.31.i = icmp eq %String* %vtpm.30.i, null
  br i1 %vtpm.31.i, label %abort.i, label %ok.2.i

ok.2.i:                                           ; preds = %ok.1.i
  %vtpm.32.i = getelementptr %String, %String* %vtpm.30.i, i64 0, i32 0
  %vtpm.33.i = load %_String_vtable*, %_String_vtable** %vtpm.32.i, align 8
  %vtpm.34.i = getelementptr %_String_vtable, %_String_vtable* %vtpm.33.i, i64 0, i32 8
  %tmp.2.i = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.34.i, align 8
  %vtpm.35.i = tail call %String* %tmp.2.i(%String* nonnull %vtpm.30.i, %String* nonnull @String.2)
  %1 = getelementptr %Article, %Article* %self, i64 0, i32 2
  %vtpm.38.i = load %String*, %String** %1, align 8
  %vtpm.40.i = icmp eq %String* %vtpm.35.i, null
  br i1 %vtpm.40.i, label %abort.i, label %ok.3.i

ok.3.i:                                           ; preds = %ok.2.i
  %vtpm.41.i = getelementptr %String, %String* %vtpm.35.i, i64 0, i32 0
  %vtpm.42.i = load %_String_vtable*, %_String_vtable** %vtpm.41.i, align 8
  %vtpm.43.i = getelementptr %_String_vtable, %_String_vtable* %vtpm.42.i, i64 0, i32 8
  %tmp.3.i = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.43.i, align 8
  %vtpm.44.i = tail call %String* %tmp.3.i(%String* nonnull %vtpm.35.i, %String* nonnull @String.3)
  %vtpm.45.i = icmp eq %String* %vtpm.44.i, null
  br i1 %vtpm.45.i, label %abort.i, label %ok.4.i

ok.4.i:                                           ; preds = %ok.3.i
  %vtpm.46.i = getelementptr %String, %String* %vtpm.44.i, i64 0, i32 0
  %vtpm.47.i = load %_String_vtable*, %_String_vtable** %vtpm.46.i, align 8
  %vtpm.48.i = getelementptr %_String_vtable, %_String_vtable* %vtpm.47.i, i64 0, i32 8
  %tmp.4.i = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.48.i, align 8
  %vtpm.49.i = tail call %String* %tmp.4.i(%String* nonnull %vtpm.44.i, %String* %vtpm.38.i)
  %vtpm.50.i = icmp eq %String* %vtpm.49.i, null
  br i1 %vtpm.50.i, label %abort.i, label %Book_print.exit

abort.i:                                          ; preds = %ok.4.i, %ok.3.i, %ok.2.i, %ok.1.i, %ok.0.i, %ok.0
  tail call void @abort()
  unreachable

Book_print.exit:                                  ; preds = %ok.4.i
  %vtpm.51.i = getelementptr %String, %String* %vtpm.49.i, i64 0, i32 0
  %vtpm.52.i = load %_String_vtable*, %_String_vtable** %vtpm.51.i, align 8
  %vtpm.53.i = getelementptr %_String_vtable, %_String_vtable* %vtpm.52.i, i64 0, i32 8
  %tmp.5.i = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.53.i, align 8
  %vtpm.54.i = tail call %String* %tmp.5.i(%String* nonnull %vtpm.49.i, %String* nonnull @String.2)
  %vtpm.97 = getelementptr %Article, %Article* %self, i64 0, i32 3
  %vtpm.98 = load %String*, %String** %vtpm.97, align 8
  %vtpm.100 = icmp eq %String* %vtpm.54.i, null
  br i1 %vtpm.100, label %abort, label %ok.1

ok.1:                                             ; preds = %Book_print.exit
  %vtpm.101 = getelementptr %String, %String* %vtpm.54.i, i64 0, i32 0
  %vtpm.102 = load %_String_vtable*, %_String_vtable** %vtpm.101, align 8
  %vtpm.103 = getelementptr %_String_vtable, %_String_vtable* %vtpm.102, i64 0, i32 8
  %tmp.1 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.103, align 8
  %vtpm.104 = tail call %String* %tmp.1(%String* nonnull %vtpm.54.i, %String* nonnull @String.4)
  %vtpm.105 = icmp eq %String* %vtpm.104, null
  br i1 %vtpm.105, label %abort, label %ok.2

ok.2:                                             ; preds = %ok.1
  %vtpm.106 = getelementptr %String, %String* %vtpm.104, i64 0, i32 0
  %vtpm.107 = load %_String_vtable*, %_String_vtable** %vtpm.106, align 8
  %vtpm.108 = getelementptr %_String_vtable, %_String_vtable* %vtpm.107, i64 0, i32 8
  %tmp.2 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.108, align 8
  %vtpm.109 = tail call %String* %tmp.2(%String* nonnull %vtpm.104, %String* %vtpm.98)
  %vtpm.110 = icmp eq %String* %vtpm.109, null
  br i1 %vtpm.110, label %abort, label %ok.3

ok.3:                                             ; preds = %ok.2
  %vtpm.111 = getelementptr %String, %String* %vtpm.109, i64 0, i32 0
  %vtpm.112 = load %_String_vtable*, %_String_vtable** %vtpm.111, align 8
  %vtpm.113 = getelementptr %_String_vtable, %_String_vtable* %vtpm.112, i64 0, i32 8
  %tmp.3 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.113, align 8
  %vtpm.114 = tail call %String* %tmp.3(%String* nonnull %vtpm.109, %String* nonnull @String.2)
  ret %String* %vtpm.114

abort:                                            ; preds = %ok.2, %ok.1, %Book_print.exit, %entry
  tail call void @abort()
  unreachable
}

define %Article* @Article_new() {
entry:
  %vtpm.119 = tail call i8* @malloc(i32 32)
  %malloc.null = icmp eq i8* %vtpm.119, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.120 = bitcast i8* %vtpm.119 to %Article*
  %vtpm.121 = bitcast i8* %vtpm.119 to %_Article_vtable**
  store %_Article_vtable* @_Article_vtable_prototype, %_Article_vtable** %vtpm.121, align 8
  %vtpm.122 = getelementptr i8, i8* %vtpm.119, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(24) %vtpm.122, i8 0, i64 24, i1 false)
  ret %Article* %vtpm.120

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Book* @BookList_car(%BookList* %self) {
entry:
  %vtpm.131 = icmp eq %BookList* %self, null
  br i1 %vtpm.131, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.132 = getelementptr %BookList, %BookList* %self, i64 0, i32 0
  %vtpm.133 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.132, align 8
  %vtpm.134 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.133, i64 0, i32 4
  %tmp.0 = load %Object* (%BookList*)*, %Object* (%BookList*)** %vtpm.134, align 8
  %vtpm.135 = tail call %Object* %tmp.0(%BookList* nonnull %self)
  %vtpm.59.i = tail call i8* @malloc(i32 24)
  %malloc.null.i = icmp eq i8* %vtpm.59.i, null
  br i1 %malloc.null.i, label %abort.i, label %Book_new.exit

abort.i:                                          ; preds = %ok.0
  tail call void @abort()
  unreachable

Book_new.exit:                                    ; preds = %ok.0
  %vtpm.60.i = bitcast i8* %vtpm.59.i to %Book*
  %vtpm.61.i = bitcast i8* %vtpm.59.i to %_Book_vtable**
  store %_Book_vtable* @_Book_vtable_prototype, %_Book_vtable** %vtpm.61.i, align 8
  %vtpm.62.i = getelementptr i8, i8* %vtpm.59.i, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %vtpm.62.i, i8 0, i64 16, i1 false)
  ret %Book* %vtpm.60.i

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %BookList* @BookList_cdr(%BookList* %self) {
entry:
  %vtpm.140 = icmp eq %BookList* %self, null
  br i1 %vtpm.140, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.141 = getelementptr %BookList, %BookList* %self, i64 0, i32 0
  %vtpm.142 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.141, align 8
  %vtpm.143 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.142, i64 0, i32 4
  %tmp.0 = load %Object* (%BookList*)*, %Object* (%BookList*)** %vtpm.143, align 8
  %vtpm.144 = tail call %Object* %tmp.0(%BookList* nonnull %self)
  %vtpm.174.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.174.i, null
  br i1 %malloc.null.i, label %abort.i, label %BookList_new.exit

abort.i:                                          ; preds = %ok.0
  tail call void @abort()
  unreachable

BookList_new.exit:                                ; preds = %ok.0
  %vtpm.175.i = bitcast i8* %vtpm.174.i to %BookList*
  %vtpm.176.i = bitcast i8* %vtpm.174.i to %_BookList_vtable**
  store %_BookList_vtable* @_BookList_vtable_prototype, %_BookList_vtable** %vtpm.176.i, align 8
  ret %BookList* %vtpm.175.i

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Cons* @BookList_cons(%BookList* %self, %Book* %hd) {
entry:
  %vtpm.257.i = tail call i8* @malloc(i32 24)
  %malloc.null.i = icmp eq i8* %vtpm.257.i, null
  br i1 %malloc.null.i, label %abort.i, label %Cons_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Cons_new.exit:                                    ; preds = %entry
  %vtpm.258.i = bitcast i8* %vtpm.257.i to %Cons*
  %vtpm.259.i = bitcast i8* %vtpm.257.i to %_Cons_vtable**
  store %_Cons_vtable* @_Cons_vtable_prototype, %_Cons_vtable** %vtpm.259.i, align 8
  %vtpm.260.i = getelementptr i8, i8* %vtpm.257.i, i64 8
  %0 = bitcast i8* %vtpm.260.i to %Book**
  store %Book* %hd, %Book** %0, align 8
  %vtpm.196.i = getelementptr i8, i8* %vtpm.257.i, i64 16
  %1 = bitcast i8* %vtpm.196.i to %BookList**
  store %BookList* %self, %BookList** %1, align 8
  ret %Cons* %vtpm.258.i
}

define i1 @BookList_isNil(%BookList* %self) {
entry:
  %vtpm.162 = icmp eq %BookList* %self, null
  br i1 %vtpm.162, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.163 = getelementptr %BookList, %BookList* %self, i64 0, i32 0
  %vtpm.164 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.163, align 8
  %vtpm.165 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.164, i64 0, i32 4
  %tmp.0 = load %Object* (%BookList*)*, %Object* (%BookList*)** %vtpm.165, align 8
  %vtpm.166 = tail call %Object* %tmp.0(%BookList* nonnull %self)
  ret i1 true

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define nonnull %String* @BookList_print_list(%BookList* nocapture readnone %self, %String* nocapture readnone %s) #0 {
entry:
  ret %String* @String.5
}

define %BookList* @BookList_new() {
entry:
  %vtpm.174 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.174, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.175 = bitcast i8* %vtpm.174 to %BookList*
  %vtpm.176 = bitcast i8* %vtpm.174 to %_BookList_vtable**
  store %_BookList_vtable* @_BookList_vtable_prototype, %_BookList_vtable** %vtpm.176, align 8
  ret %BookList* %vtpm.175

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn
define %Book* @Cons_car(%Cons* nocapture readonly %self) local_unnamed_addr #2 {
entry:
  %vtpm.180 = getelementptr %Cons, %Cons* %self, i64 0, i32 1
  %vtpm.181 = load %Book*, %Book** %vtpm.180, align 8
  ret %Book* %vtpm.181
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn
define %BookList* @Cons_cdr(%Cons* nocapture readonly %self) local_unnamed_addr #2 {
entry:
  %vtpm.185 = getelementptr %Cons, %Cons* %self, i64 0, i32 2
  %vtpm.186 = load %BookList*, %BookList** %vtpm.185, align 8
  ret %BookList* %vtpm.186
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define %Cons* @Cons_init(%Cons* returned writeonly %self, %Book* %hd, %BookList* %tl) #1 {
entry:
  %vtpm.193 = getelementptr %Cons, %Cons* %self, i64 0, i32 1
  store %Book* %hd, %Book** %vtpm.193, align 8
  %vtpm.196 = getelementptr %Cons, %Cons* %self, i64 0, i32 2
  store %BookList* %tl, %BookList** %vtpm.196, align 8
  ret %Cons* %self
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i1 @Cons_isNil(%Cons* nocapture readnone %self) local_unnamed_addr #0 {
entry:
  ret i1 false
}

define %String* @Cons_print_list(%Cons* nocapture readonly %self, %String* %s) local_unnamed_addr {
entry:
  %vtpm.207 = getelementptr %Cons, %Cons* %self, i64 0, i32 1
  %vtpm.208 = load %Book*, %Book** %vtpm.207, align 8
  %vtpm.209 = icmp eq %Book* %vtpm.208, null
  br i1 %vtpm.209, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.210 = getelementptr %Book, %Book* %vtpm.208, i64 0, i32 0
  %vtpm.211 = load %_Book_vtable*, %_Book_vtable** %vtpm.210, align 8
  %vtpm.212 = getelementptr %_Book_vtable, %_Book_vtable* %vtpm.211, i64 0, i32 13
  %tmp.1 = load %String* (%Book*, %String*)*, %String* (%Book*, %String*)** %vtpm.212, align 8
  %vtpm.213 = tail call %String* %tmp.1(%Book* nonnull %vtpm.208, %String* %s)
  %vtpm.216 = load %Book*, %Book** %vtpm.207, align 8
  %vtpm.217 = icmp eq %Book* %vtpm.216, null
  br i1 %vtpm.217, label %abort, label %ok.1

ok.1:                                             ; preds = %ok.0
  %vtpm.218 = getelementptr %Book, %Book* %vtpm.216, i64 0, i32 0
  %vtpm.219 = load %_Book_vtable*, %_Book_vtable** %vtpm.218, align 8
  %vtpm.220 = getelementptr %_Book_vtable, %_Book_vtable* %vtpm.219, i64 0, i32 12
  %tmp.2 = load %Object* (%Book*)*, %Object* (%Book*)** %vtpm.220, align 8
  %vtpm.221 = tail call %Object* %tmp.2(%Book* nonnull %vtpm.216)
  %tmp.3 = icmp eq %Object* %vtpm.221, null
  br i1 %tmp.3, label %abort, label %ok.2

ok.2:                                             ; preds = %ok.1
  %vtpm.222 = getelementptr %Object, %Object* %vtpm.221, i64 0, i32 0
  %vtpm.223 = load %_Object_vtable*, %_Object_vtable** %vtpm.222, align 8
  %vtpm.224 = getelementptr %_Object_vtable, %_Object_vtable* %vtpm.223, i64 0, i32 0
  %vtpm.225 = load i32, i32* %vtpm.224, align 4
  %.not = icmp eq i32 %vtpm.225, 6
  br i1 %.not, label %src_lte_mc.6.0, label %case.5.0

src_lte_mc.6.0:                                   ; preds = %ok.2
  %vtpm.230 = icmp eq %String* %vtpm.213, null
  br i1 %vtpm.230, label %abort, label %case.exit.0

case.5.0:                                         ; preds = %ok.2
  %0 = add i32 %vtpm.225, -7
  %1 = icmp ult i32 %0, -2
  %vtpm.239 = icmp eq %String* %vtpm.213, null
  %or.cond = select i1 %1, i1 true, i1 %vtpm.239
  br i1 %or.cond, label %abort, label %case.exit.0

case.exit.0:                                      ; preds = %case.5.0, %src_lte_mc.6.0
  %String.6.sink = phi %String* [ @String.7, %src_lte_mc.6.0 ], [ @String.6, %case.5.0 ]
  %vtpm.240 = getelementptr %String, %String* %vtpm.213, i64 0, i32 0
  %vtpm.241 = load %_String_vtable*, %_String_vtable** %vtpm.240, align 8
  %vtpm.242 = getelementptr %_String_vtable, %_String_vtable* %vtpm.241, i64 0, i32 8
  %tmp.5 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.242, align 8
  %vtpm.243 = tail call %String* %tmp.5(%String* nonnull %vtpm.213, %String* nonnull %String.6.sink)
  %vtpm.246 = getelementptr %Cons, %Cons* %self, i64 0, i32 2
  %vtpm.247 = load %BookList*, %BookList** %vtpm.246, align 8
  %vtpm.248 = icmp eq %BookList* %vtpm.247, null
  br i1 %vtpm.248, label %abort, label %ok.5

ok.5:                                             ; preds = %case.exit.0
  %vtpm.249 = getelementptr %BookList, %BookList* %vtpm.247, i64 0, i32 0
  %vtpm.250 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.249, align 8
  %vtpm.251 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.250, i64 0, i32 15
  %tmp.7 = load %String* (%BookList*, %String*)*, %String* (%BookList*, %String*)** %vtpm.251, align 8
  %vtpm.252 = tail call %String* %tmp.7(%BookList* nonnull %vtpm.247, %String* %vtpm.243)
  ret %String* %vtpm.252

abort:                                            ; preds = %case.5.0, %case.exit.0, %src_lte_mc.6.0, %ok.1, %ok.0, %entry
  tail call void @abort()
  unreachable
}

define %Cons* @Cons_new() {
entry:
  %vtpm.257 = tail call i8* @malloc(i32 24)
  %malloc.null = icmp eq i8* %vtpm.257, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.258 = bitcast i8* %vtpm.257 to %Cons*
  %vtpm.259 = bitcast i8* %vtpm.257 to %_Cons_vtable**
  store %_Cons_vtable* @_Cons_vtable_prototype, %_Cons_vtable** %vtpm.259, align 8
  %vtpm.260 = getelementptr i8, i8* %vtpm.257, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %vtpm.260, i8 0, i64 16, i1 false)
  ret %Cons* %vtpm.258

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i1 @Nil_isNil(%Nil* nocapture readnone %self) local_unnamed_addr #0 {
entry:
  ret i1 true
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define %String* @Nil_print_list(%Nil* nocapture readnone %self, %String* readnone returned %s) local_unnamed_addr #0 {
entry:
  ret %String* %s
}

define %Nil* @Nil_new() {
entry:
  %vtpm.274 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.274, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.275 = bitcast i8* %vtpm.274 to %Nil*
  %vtpm.276 = bitcast i8* %vtpm.274 to %_Nil_vtable**
  store %_Nil_vtable* @_Nil_vtable_prototype, %_Nil_vtable** %vtpm.276, align 8
  ret %Nil* %vtpm.275

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %String* @Main_main(%Main* nocapture writeonly %self) {
entry:
  %vtpm.59.i = tail call i8* @malloc(i32 24)
  %malloc.null.i = icmp eq i8* %vtpm.59.i, null
  br i1 %malloc.null.i, label %abort.i, label %Book_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Book_new.exit:                                    ; preds = %entry
  %vtpm.61.i = bitcast i8* %vtpm.59.i to %_Book_vtable**
  store %_Book_vtable* @_Book_vtable_prototype, %_Book_vtable** %vtpm.61.i, align 8
  %vtpm.62.i = getelementptr i8, i8* %vtpm.59.i, i64 8
  %0 = bitcast i8* %vtpm.62.i to %String**
  store %String* @String.8, %String** %0, align 8
  %vtpm.12.i = getelementptr i8, i8* %vtpm.59.i, i64 16
  %1 = bitcast i8* %vtpm.12.i to %String**
  store %String* @String.9, %String** %1, align 8
  %vtpm.119.i = tail call i8* @malloc(i32 32)
  %malloc.null.i1 = icmp eq i8* %vtpm.119.i, null
  br i1 %malloc.null.i1, label %abort.i2, label %Article_initArticle.exit

abort.i2:                                         ; preds = %Book_new.exit
  tail call void @abort()
  unreachable

Article_initArticle.exit:                         ; preds = %Book_new.exit
  %vtpm.121.i = bitcast i8* %vtpm.119.i to %_Article_vtable**
  store %_Article_vtable* @_Article_vtable_prototype, %_Article_vtable** %vtpm.121.i, align 8
  %vtpm.122.i = getelementptr i8, i8* %vtpm.119.i, i64 8
  %2 = bitcast i8* %vtpm.122.i to %String**
  store %String* @String.10, %String** %2, align 8
  %vtpm.12.i6 = getelementptr i8, i8* %vtpm.119.i, i64 16
  %3 = bitcast i8* %vtpm.12.i6 to %String**
  store %String* @String.11, %String** %3, align 8
  %vtpm.85.i = getelementptr i8, i8* %vtpm.119.i, i64 24
  %4 = bitcast i8* %vtpm.85.i to %String**
  store %String* @String.12, %String** %4, align 8
  %vtpm.274.i = tail call i8* @malloc(i32 8)
  %malloc.null.i3 = icmp eq i8* %vtpm.274.i, null
  br i1 %malloc.null.i3, label %abort.i4, label %Nil_new.exit

abort.i4:                                         ; preds = %Article_initArticle.exit
  tail call void @abort()
  unreachable

Nil_new.exit:                                     ; preds = %Article_initArticle.exit
  %vtpm.276.i = bitcast i8* %vtpm.274.i to %_Nil_vtable**
  store %_Nil_vtable* @_Nil_vtable_prototype, %_Nil_vtable** %vtpm.276.i, align 8
  %vtpm.257.i.i = tail call i8* @malloc(i32 24)
  %malloc.null.i.i = icmp eq i8* %vtpm.257.i.i, null
  br i1 %malloc.null.i.i, label %abort.i.i, label %ok.3

abort.i.i:                                        ; preds = %Nil_new.exit
  tail call void @abort()
  unreachable

ok.3:                                             ; preds = %Nil_new.exit
  %vtpm.259.i.i = bitcast i8* %vtpm.257.i.i to %_Cons_vtable**
  store %_Cons_vtable* @_Cons_vtable_prototype, %_Cons_vtable** %vtpm.259.i.i, align 8
  %vtpm.260.i.i = getelementptr i8, i8* %vtpm.257.i.i, i64 8
  %5 = bitcast i8* %vtpm.260.i.i to i8**
  store i8* %vtpm.59.i, i8** %5, align 8
  %vtpm.196.i.i = getelementptr i8, i8* %vtpm.257.i.i, i64 16
  %6 = bitcast i8* %vtpm.196.i.i to i8**
  store i8* %vtpm.274.i, i8** %6, align 8
  %vtpm.257.i.i7 = tail call i8* @malloc(i32 24)
  %malloc.null.i.i8 = icmp eq i8* %vtpm.257.i.i7, null
  br i1 %malloc.null.i.i8, label %abort.i.i9, label %ok.4

abort.i.i9:                                       ; preds = %ok.3
  tail call void @abort()
  unreachable

ok.4:                                             ; preds = %ok.3
  %vtpm.259.i.i10 = bitcast i8* %vtpm.257.i.i7 to %_Cons_vtable**
  store %_Cons_vtable* @_Cons_vtable_prototype, %_Cons_vtable** %vtpm.259.i.i10, align 8
  %vtpm.260.i.i11 = getelementptr i8, i8* %vtpm.257.i.i7, i64 8
  %7 = bitcast i8* %vtpm.260.i.i11 to i8**
  store i8* %vtpm.119.i, i8** %7, align 8
  %vtpm.196.i.i12 = getelementptr i8, i8* %vtpm.257.i.i7, i64 16
  %8 = bitcast i8* %vtpm.196.i.i12 to i8**
  store i8* %vtpm.257.i.i, i8** %8, align 8
  %vtpm.308 = getelementptr %Main, %Main* %self, i64 0, i32 1
  %9 = bitcast %BookList** %vtpm.308 to i8**
  store i8* %vtpm.257.i.i7, i8** %9, align 8
  %vtpm.309 = bitcast i8* %vtpm.257.i.i7 to %BookList*
  %vtpm.314 = bitcast i8* %vtpm.257.i.i7 to %_BookList_vtable**
  %vtpm.315 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.314, align 8
  %vtpm.316 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.315, i64 0, i32 15
  %tmp.4 = load %String* (%BookList*, %String*)*, %String* (%BookList*, %String*)** %vtpm.316, align 8
  %vtpm.317 = tail call %String* %tmp.4(%BookList* nonnull %vtpm.309, %String* nonnull @String.5)
  ret %String* %vtpm.317
}

define %Main* @Main_new() {
entry:
  %vtpm.322 = tail call i8* @malloc(i32 16)
  %malloc.null = icmp eq i8* %vtpm.322, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.323 = bitcast i8* %vtpm.322 to %Main*
  %vtpm.324 = bitcast i8* %vtpm.322 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.324, align 8
  %vtpm.325 = getelementptr i8, i8* %vtpm.322, i64 8
  %0 = bitcast i8* %vtpm.325 to %BookList**
  store %BookList* null, %BookList** %0, align 8
  ret %Main* %vtpm.323

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly }
attributes #2 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn writeonly }
