; ModuleID = 'dispatch7_o.ll'
source_filename = "dispatch7_o.ll"

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
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %Main* (%Main*, %String*)*, %Main* (%Main*, i32)*, %String* (%Main*)*, i32 (%Main*)*, %Object* (%Main*)* }
%Main = type { %_Main_vtable* }
%_Foo_vtable = type { i32, i32, i8*, %Foo* ()*, %Object* (%Foo*)*, %String* (%Foo*)*, %Foo* (%Foo*)*, %Foo* (%Foo*)* }
%Foo = type { %_Foo_vtable* }
%_Bar_vtable = type { i32, i32, i8*, %Bar* ()*, %Object* (%Bar*)*, %String* (%Bar*)*, %Bar* (%Bar*)*, %Bar* (%Bar*)*, i32 (%Bar*, i32)* }
%Bar = type { %_Bar_vtable* }

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
@str.Main = internal constant [5 x i8] c"Main\00"
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %Main* (%Main*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Main* (%Main*, %String*)*), %Main* (%Main*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Main* (%Main*, i32)*), %String* (%Main*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Main*)*), i32 (%Main*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Main*)*), %Object* (%Main*)* @Main_main }
@str.Foo = internal constant [4 x i8] c"Foo\00"
@_Foo_vtable_prototype = constant %_Foo_vtable { i32 6, i32 ptrtoint (%Foo* getelementptr (%Foo, %Foo* null, i32 1) to i32), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.Foo, i32 0, i32 0), %Foo* ()* @Foo_new, %Object* (%Foo*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Foo*)*), %String* (%Foo*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Foo*)*), %Foo* (%Foo*)* bitcast (%Object* (%Object*)* @Object_copy to %Foo* (%Foo*)*), %Foo* (%Foo*)* @Foo_a }
@str.Bar = internal constant [4 x i8] c"Bar\00"
@_Bar_vtable_prototype = constant %_Bar_vtable { i32 7, i32 ptrtoint (%Bar* getelementptr (%Bar, %Bar* null, i32 1) to i32), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.Bar, i32 0, i32 0), %Bar* ()* @Bar_new, %Object* (%Bar*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Bar*)*), %String* (%Bar*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Bar*)*), %Bar* (%Bar*)* bitcast (%Object* (%Object*)* @Object_copy to %Bar* (%Bar*)*), %Bar* (%Bar*)* bitcast (%Foo* (%Foo*)* @Foo_a to %Bar* (%Bar*)*), i32 (%Bar*, i32)* @Bar_b }
@global_str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [15 x i8] c"dispatch7_o.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_str.0, i32 0, i32 0) }

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
  %vtpm.23.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.23.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.25.i = bitcast i8* %vtpm.23.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.25.i, align 8
  %vtpm.46.i.i = tail call i8* @malloc(i32 8)
  %malloc.null.i.i = icmp eq i8* %vtpm.46.i.i, null
  br i1 %malloc.null.i.i, label %abort.i.i, label %Main_main.exit

abort.i.i:                                        ; preds = %Main_new.exit
  tail call void @abort()
  unreachable

Main_main.exit:                                   ; preds = %Main_new.exit
  %vtpm.24.i = bitcast i8* %vtpm.23.i to %Main*
  %vtpm.48.i.i = bitcast i8* %vtpm.46.i.i to %_Bar_vtable**
  store %_Bar_vtable* @_Bar_vtable_prototype, %_Bar_vtable** %vtpm.48.i.i, align 8
  %vtpm.15.i = load %_Main_vtable*, %_Main_vtable** %vtpm.25.i, align 8
  %vtpm.16.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.15.i, i64 0, i32 8
  %tmp.2.i = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.16.i, align 8
  %vtpm.17.i = tail call %Main* %tmp.2.i(%Main* nonnull %vtpm.24.i, i32 1)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %Object* @Main_main(%Main* %self) {
entry:
  %vtpm.46.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.46.i, null
  br i1 %malloc.null.i, label %abort.i, label %ok.1

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

ok.1:                                             ; preds = %entry
  %vtpm.48.i = bitcast i8* %vtpm.46.i to %_Bar_vtable**
  store %_Bar_vtable* @_Bar_vtable_prototype, %_Bar_vtable** %vtpm.48.i, align 8
  %vtpm.13 = icmp eq %Main* %self, null
  br i1 %vtpm.13, label %abort, label %ok.2

ok.2:                                             ; preds = %ok.1
  %vtpm.14 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.15 = load %_Main_vtable*, %_Main_vtable** %vtpm.14, align 8
  %vtpm.16 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.15, i64 0, i32 8
  %tmp.2 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.16, align 8
  %vtpm.17 = tail call %Main* %tmp.2(%Main* nonnull %self, i32 1)
  %vtpm.18 = bitcast %Main* %vtpm.17 to %Object*
  ret %Object* %vtpm.18

abort:                                            ; preds = %ok.1
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.23 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.23, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.24 = bitcast i8* %vtpm.23 to %Main*
  %vtpm.25 = bitcast i8* %vtpm.23 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.25, align 8
  ret %Main* %vtpm.24

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define %Foo* @Foo_a(%Foo* readnone returned %self) #0 {
entry:
  ret %Foo* %self
}

define %Foo* @Foo_new() {
entry:
  %vtpm.33 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.33, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.34 = bitcast i8* %vtpm.33 to %Foo*
  %vtpm.35 = bitcast i8* %vtpm.33 to %_Foo_vtable**
  store %_Foo_vtable* @_Foo_vtable_prototype, %_Foo_vtable** %vtpm.35, align 8
  ret %Foo* %vtpm.34

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define %Bar* @Bar_a(%Bar* readnone returned %self) local_unnamed_addr #0 {
entry:
  ret %Bar* %self
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @Bar_b(%Bar* nocapture readnone %self, i32 %y) #0 {
entry:
  ret i32 1
}

define %Bar* @Bar_new() {
entry:
  %vtpm.46 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.46, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.47 = bitcast i8* %vtpm.46 to %Bar*
  %vtpm.48 = bitcast i8* %vtpm.46 to %_Bar_vtable**
  store %_Bar_vtable* @_Bar_vtable_prototype, %_Bar_vtable** %vtpm.48, align 8
  ret %Bar* %vtpm.47

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
