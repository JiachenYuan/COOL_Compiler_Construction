; ModuleID = 'typename_o.ll'
source_filename = "typename_o.ll"

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
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %Main* (%Main*, %String*)*, %Main* (%Main*, i32)*, %String* (%Main*)*, i32 (%Main*)*, %String* (%Main*)*, %Object* (%Main*)* }
%Main = type { %_Main_vtable* }
%_Base_vtable = type { i32, i32, i8*, %Base* ()*, %Object* (%Base*)*, %String* (%Base*)*, %Base* (%Base*)*, %String* (%Base*, %Object*, %String*)*, %String* (%Base*, %String*)* }
%Base = type { %_Base_vtable* }
%_Derived_vtable = type { i32, i32, i8*, %Derived* ()*, %Object* (%Derived*)*, %String* (%Derived*)*, %Derived* (%Derived*)*, %String* (%Derived*, %Object*, %String*)*, %String* (%Derived*, %String*)* }
%Derived = type { %_Derived_vtable* }

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
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %Main* (%Main*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Main* (%Main*, %String*)*), %Main* (%Main*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Main* (%Main*, i32)*), %String* (%Main*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Main*)*), i32 (%Main*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Main*)*), %String* (%Main*)* @Main_func, %Object* (%Main*)* @Main_main }
@str.Base = internal constant [5 x i8] c"Base\00"
@_Base_vtable_prototype = constant %_Base_vtable { i32 6, i32 ptrtoint (%Base* getelementptr (%Base, %Base* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Base, i32 0, i32 0), %Base* ()* @Base_new, %Object* (%Base*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Base*)*), %String* (%Base*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Base*)*), %Base* (%Base*)* bitcast (%Object* (%Object*)* @Object_copy to %Base* (%Base*)*), %String* (%Base*, %Object*, %String*)* @Base_identify, %String* (%Base*, %String*)* @Base_test }
@str.Derived = internal constant [8 x i8] c"Derived\00"
@_Derived_vtable_prototype = constant %_Derived_vtable { i32 7, i32 ptrtoint (%Derived* getelementptr (%Derived, %Derived* null, i32 1) to i32), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @str.Derived, i32 0, i32 0), %Derived* ()* @Derived_new, %Object* (%Derived*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Derived*)*), %String* (%Derived*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Derived*)*), %Derived* (%Derived*)* bitcast (%Object* (%Object*)* @Object_copy to %Derived* (%Derived*)*), %String* (%Derived*, %Object*, %String*)* bitcast (%String* (%Base*, %Object*, %String*)* @Base_identify to %String* (%Derived*, %Object*, %String*)*), %String* (%Derived*, %String*)* bitcast (%String* (%Base*, %String*)* @Base_test to %String* (%Derived*, %String*)*) }
@global_str.3 = internal constant [14 x i8] c"<basic class>\00"
@String.3 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.3, i32 0, i32 0) }
@global_str.2 = internal constant [1 x i8] zeroinitializer
@String.2 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @global_str.2, i32 0, i32 0) }
@global_str.1 = internal constant [2 x i8] c"\0A\00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [14 x i8] c"typename_o.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.0, i32 0, i32 0) }

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
  %vtpm.27.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.27.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_main.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_main.exit:                                   ; preds = %entry
  %vtpm.29.i = bitcast i8* %vtpm.27.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.29.i, align 8
  %vtpm.129.i.i = tail call i8* @malloc(i32 8)
  %malloc.null.i.i = icmp eq i8* %vtpm.129.i.i, null
  br i1 %malloc.null.i.i, label %abort.i.i, label %Main_func.exit

abort.i.i:                                        ; preds = %Main_main.exit
  tail call void @abort()
  unreachable

Main_func.exit:                                   ; preds = %Main_main.exit
  %vtpm.28.i = bitcast i8* %vtpm.27.i to %Main*
  %vtpm.131.i.i = bitcast i8* %vtpm.129.i.i to %_Derived_vtable**
  store %_Derived_vtable* @_Derived_vtable_prototype, %_Derived_vtable** %vtpm.131.i.i, align 8
  %0 = bitcast i8* %vtpm.129.i.i to %Base*
  %vtpm.6.i = tail call %String* @Base_test(%Base* nonnull %0, %String* nonnull @String.2)
  %vtpm.18.i = load %_Main_vtable*, %_Main_vtable** %vtpm.29.i, align 8
  %vtpm.19.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.18.i, i64 0, i32 7
  %tmp.1.i = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.19.i, align 8
  %vtpm.20.i = tail call %Main* %tmp.1.i(%Main* nonnull %vtpm.28.i, %String* %vtpm.6.i)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %String* @Main_func(%Main* nocapture readnone %self) {
entry:
  %vtpm.129.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.129.i, null
  br i1 %malloc.null.i, label %abort.i, label %Derived_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Derived_new.exit:                                 ; preds = %entry
  %vtpm.131.i = bitcast i8* %vtpm.129.i to %_Derived_vtable**
  store %_Derived_vtable* @_Derived_vtable_prototype, %_Derived_vtable** %vtpm.131.i, align 8
  %0 = bitcast i8* %vtpm.129.i to %Base*
  %vtpm.6 = tail call %String* @Base_test(%Base* nonnull %0, %String* nonnull @String.2)
  ret %String* %vtpm.6
}

define %Object* @Main_main(%Main* %self) {
entry:
  %vtpm.10 = icmp eq %Main* %self, null
  br i1 %vtpm.10, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.11 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.12 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.13 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.12, i64 0, i32 11
  %tmp.0 = load %String* (%Main*)*, %String* (%Main*)** %vtpm.13, align 8
  %vtpm.14 = tail call %String* %tmp.0(%Main* nonnull %self)
  %vtpm.18 = load %_Main_vtable*, %_Main_vtable** %vtpm.11, align 8
  %vtpm.19 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.18, i64 0, i32 7
  %tmp.1 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.19, align 8
  %vtpm.20 = tail call %Main* %tmp.1(%Main* nonnull %self, %String* %vtpm.14)
  %vtpm.22 = bitcast %Main* %self to %Object*
  ret %Object* %vtpm.22

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.27 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.27, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.28 = bitcast i8* %vtpm.27 to %Main*
  %vtpm.29 = bitcast i8* %vtpm.27 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.29, align 8
  ret %Main* %vtpm.28

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %String* @Base_identify(%Base* nocapture readnone %self, %Object* %thing, %String* %s) {
entry:
  %vtpm.35 = icmp eq %Object* %thing, null
  br i1 %vtpm.35, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.36 = getelementptr %Object, %Object* %thing, i64 0, i32 0
  %vtpm.37 = load %_Object_vtable*, %_Object_vtable** %vtpm.36, align 8
  %vtpm.38 = getelementptr %_Object_vtable, %_Object_vtable* %vtpm.37, i64 0, i32 5
  %tmp.0 = load %String* (%Object*)*, %String* (%Object*)** %vtpm.38, align 8
  %vtpm.39 = tail call %String* %tmp.0(%Object* nonnull %thing)
  %vtpm.41 = icmp eq %String* %s, null
  br i1 %vtpm.41, label %abort, label %ok.1

ok.1:                                             ; preds = %ok.0
  %vtpm.42 = getelementptr %String, %String* %s, i64 0, i32 0
  %vtpm.43 = load %_String_vtable*, %_String_vtable** %vtpm.42, align 8
  %vtpm.44 = getelementptr %_String_vtable, %_String_vtable* %vtpm.43, i64 0, i32 8
  %tmp.1 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.44, align 8
  %vtpm.45 = tail call %String* %tmp.1(%String* nonnull %s, %String* %vtpm.39)
  %vtpm.46 = icmp eq %String* %vtpm.45, null
  br i1 %vtpm.46, label %abort, label %ok.2

ok.2:                                             ; preds = %ok.1
  %vtpm.47 = getelementptr %String, %String* %vtpm.45, i64 0, i32 0
  %vtpm.48 = load %_String_vtable*, %_String_vtable** %vtpm.47, align 8
  %vtpm.49 = getelementptr %_String_vtable, %_String_vtable* %vtpm.48, i64 0, i32 8
  %tmp.2 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.49, align 8
  %vtpm.50 = tail call %String* %tmp.2(%String* nonnull %vtpm.45, %String* nonnull @String.1)
  ret %String* %vtpm.50

abort:                                            ; preds = %ok.1, %ok.0, %entry
  tail call void @abort()
  unreachable
}

define %String* @Base_test(%Base* %self, %String* %s) {
entry:
  %vtpm.27.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.27.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.29.i = bitcast i8* %vtpm.27.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.29.i, align 8
  %vtpm.58 = icmp eq %Base* %self, null
  br i1 %vtpm.58, label %abort, label %ok.0

ok.0:                                             ; preds = %Main_new.exit
  %vtpm.59 = getelementptr %Base, %Base* %self, i64 0, i32 0
  %vtpm.60 = load %_Base_vtable*, %_Base_vtable** %vtpm.59, align 8
  %vtpm.61 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.60, i64 0, i32 7
  %tmp.0 = load %String* (%Base*, %Object*, %String*)*, %String* (%Base*, %Object*, %String*)** %vtpm.61, align 8
  %vtpm.62 = bitcast i8* %vtpm.27.i to %Object*
  %vtpm.63 = tail call %String* %tmp.0(%Base* nonnull %self, %Object* nonnull %vtpm.62, %String* %s)
  %vtpm.129.i = tail call i8* @malloc(i32 8)
  %malloc.null.i1 = icmp eq i8* %vtpm.129.i, null
  br i1 %malloc.null.i1, label %abort.i2, label %Derived_new.exit

abort.i2:                                         ; preds = %ok.0
  tail call void @abort()
  unreachable

Derived_new.exit:                                 ; preds = %ok.0
  %vtpm.131.i = bitcast i8* %vtpm.129.i to %_Derived_vtable**
  store %_Derived_vtable* @_Derived_vtable_prototype, %_Derived_vtable** %vtpm.131.i, align 8
  %vtpm.69 = load %_Base_vtable*, %_Base_vtable** %vtpm.59, align 8
  %vtpm.70 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.69, i64 0, i32 7
  %tmp.1 = load %String* (%Base*, %Object*, %String*)*, %String* (%Base*, %Object*, %String*)** %vtpm.70, align 8
  %vtpm.71 = bitcast i8* %vtpm.129.i to %Object*
  %vtpm.72 = tail call %String* %tmp.1(%Base* nonnull %self, %Object* nonnull %vtpm.71, %String* %s)
  %vtpm.122.i = tail call i8* @malloc(i32 8)
  %malloc.null.i3 = icmp eq i8* %vtpm.122.i, null
  br i1 %malloc.null.i3, label %abort.i4, label %Base_new.exit

abort.i4:                                         ; preds = %Derived_new.exit
  tail call void @abort()
  unreachable

Base_new.exit:                                    ; preds = %Derived_new.exit
  %vtpm.124.i = bitcast i8* %vtpm.122.i to %_Base_vtable**
  store %_Base_vtable* @_Base_vtable_prototype, %_Base_vtable** %vtpm.124.i, align 8
  %vtpm.78 = load %_Base_vtable*, %_Base_vtable** %vtpm.59, align 8
  %vtpm.79 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.78, i64 0, i32 7
  %tmp.2 = load %String* (%Base*, %Object*, %String*)*, %String* (%Base*, %Object*, %String*)** %vtpm.79, align 8
  %vtpm.80 = bitcast i8* %vtpm.122.i to %Object*
  %vtpm.81 = tail call %String* %tmp.2(%Base* nonnull %self, %Object* nonnull %vtpm.80, %String* %s)
  %vtpm.83 = icmp eq %String* %s, null
  br i1 %vtpm.83, label %abort, label %ok.3

ok.3:                                             ; preds = %Base_new.exit
  %vtpm.84 = getelementptr %String, %String* %s, i64 0, i32 0
  %vtpm.85 = load %_String_vtable*, %_String_vtable** %vtpm.84, align 8
  %vtpm.86 = getelementptr %_String_vtable, %_String_vtable* %vtpm.85, i64 0, i32 8
  %tmp.3 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.86, align 8
  %vtpm.87 = tail call %String* %tmp.3(%String* nonnull %s, %String* %vtpm.81)
  %vtpm.88 = icmp eq %String* %vtpm.87, null
  br i1 %vtpm.88, label %abort, label %ok.4

ok.4:                                             ; preds = %ok.3
  %vtpm.89 = getelementptr %String, %String* %vtpm.87, i64 0, i32 0
  %vtpm.90 = load %_String_vtable*, %_String_vtable** %vtpm.89, align 8
  %vtpm.91 = getelementptr %_String_vtable, %_String_vtable* %vtpm.90, i64 0, i32 8
  %tmp.4 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.91, align 8
  %vtpm.92 = tail call %String* %tmp.4(%String* nonnull %vtpm.87, %String* %vtpm.72)
  %vtpm.93 = icmp eq %String* %vtpm.92, null
  br i1 %vtpm.93, label %abort, label %ok.5

ok.5:                                             ; preds = %ok.4
  %vtpm.94 = getelementptr %String, %String* %vtpm.92, i64 0, i32 0
  %vtpm.95 = load %_String_vtable*, %_String_vtable** %vtpm.94, align 8
  %vtpm.96 = getelementptr %_String_vtable, %_String_vtable* %vtpm.95, i64 0, i32 8
  %tmp.5 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.96, align 8
  %vtpm.97 = tail call %String* %tmp.5(%String* nonnull %vtpm.92, %String* %vtpm.63)
  %vtpm.129.i5 = tail call i8* @malloc(i32 8)
  %malloc.null.i6 = icmp eq i8* %vtpm.129.i5, null
  br i1 %malloc.null.i6, label %abort.i9, label %Derived_new.exit10

abort.i9:                                         ; preds = %ok.5
  tail call void @abort()
  unreachable

Derived_new.exit10:                               ; preds = %ok.5
  %vtpm.131.i8 = bitcast i8* %vtpm.129.i5 to %_Derived_vtable**
  store %_Derived_vtable* @_Derived_vtable_prototype, %_Derived_vtable** %vtpm.131.i8, align 8
  %vtpm.105 = load %_Base_vtable*, %_Base_vtable** %vtpm.59, align 8
  %vtpm.106 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.105, i64 0, i32 7
  %tmp.6 = load %String* (%Base*, %Object*, %String*)*, %String* (%Base*, %Object*, %String*)** %vtpm.106, align 8
  %vtpm.107 = bitcast i8* %vtpm.129.i5 to %Object*
  %vtpm.108 = tail call %String* %tmp.6(%Base* nonnull %self, %Object* nonnull %vtpm.107, %String* %vtpm.97)
  %vtpm.114 = load %_Base_vtable*, %_Base_vtable** %vtpm.59, align 8
  %vtpm.115 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.114, i64 0, i32 7
  %tmp.7 = load %String* (%Base*, %Object*, %String*)*, %String* (%Base*, %Object*, %String*)** %vtpm.115, align 8
  %vtpm.116 = bitcast %Base* %self to %Object*
  %vtpm.117 = tail call %String* %tmp.7(%Base* nonnull %self, %Object* nonnull %vtpm.116, %String* %vtpm.108)
  ret %String* %vtpm.117

abort:                                            ; preds = %ok.4, %ok.3, %Base_new.exit, %Main_new.exit
  tail call void @abort()
  unreachable
}

define %Base* @Base_new() {
entry:
  %vtpm.122 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.122, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.123 = bitcast i8* %vtpm.122 to %Base*
  %vtpm.124 = bitcast i8* %vtpm.122 to %_Base_vtable**
  store %_Base_vtable* @_Base_vtable_prototype, %_Base_vtable** %vtpm.124, align 8
  ret %Base* %vtpm.123

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %Derived* @Derived_new() {
entry:
  %vtpm.129 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.129, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.130 = bitcast i8* %vtpm.129 to %Derived*
  %vtpm.131 = bitcast i8* %vtpm.129 to %_Derived_vtable**
  store %_Derived_vtable* @_Derived_vtable_prototype, %_Derived_vtable** %vtpm.131, align 8
  ret %Derived* %vtpm.130

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}
