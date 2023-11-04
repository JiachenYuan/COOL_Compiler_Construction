; ModuleID = 'copy_o3.ll'
source_filename = "copy_o3.ll"

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
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %Main* (%Main*, %String*)*, %Main* (%Main*, i32)*, %String* (%Main*)*, i32 (%Main*)*, %Main* (%Main*)* }
%Main = type { %_Main_vtable* }
%_A_vtable = type { i32, i32, i8*, %A* ()*, %Object* (%A*)*, %String* (%A*)*, %A* (%A*)* }
%A = type { %_A_vtable*, i32, i1, %String*, i32 }
%_AA_vtable = type { i32, i32, i8*, %AA* ()*, %Object* (%AA*)*, %String* (%AA*)*, %AA* (%AA*)*, i32 (%AA*, i32)*, i32 (%AA*)* }
%AA = type { %_AA_vtable*, i32, i1, %String*, i32, i1, i32 }

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
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %Main* (%Main*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Main* (%Main*, %String*)*), %Main* (%Main*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Main* (%Main*, i32)*), %String* (%Main*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Main*)*), i32 (%Main*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Main*)*), %Main* (%Main*)* @Main_main }
@str.A = internal constant [2 x i8] c"A\00"
@_A_vtable_prototype = constant %_A_vtable { i32 6, i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0), %A* ()* @A_new, %Object* (%A*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%A*)*), %String* (%A*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%A*)*), %A* (%A*)* bitcast (%Object* (%Object*)* @Object_copy to %A* (%A*)*) }
@str.AA = internal constant [3 x i8] c"AA\00"
@_AA_vtable_prototype = constant %_AA_vtable { i32 7, i32 ptrtoint (%AA* getelementptr (%AA, %AA* null, i32 1) to i32), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.AA, i32 0, i32 0), %AA* ()* @AA_new, %Object* (%AA*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%AA*)*), %String* (%AA*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%AA*)*), %AA* (%AA*)* bitcast (%Object* (%Object*)* @Object_copy to %AA* (%AA*)*), i32 (%AA*, i32)* @AA_set, i32 (%AA*)* @AA_get }
@global_str.3 = internal constant [14 x i8] c"<basic class>\00"
@String.3 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @global_str.3, i32 0, i32 0) }
@global_str.2 = internal constant [8 x i8] c"Error2\0A\00"
@String.2 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_str.2, i32 0, i32 0) }
@global_str.1 = internal constant [8 x i8] c"Error1\0A\00"
@String.1 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_str.1, i32 0, i32 0) }
@global_str.0 = internal constant [11 x i8] c"copy_o3.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @global_str.0, i32 0, i32 0) }

declare void @abort() local_unnamed_addr

declare i8* @malloc(i32) local_unnamed_addr

declare %Object* @Object_abort(%Object*)

declare %String* @Object_type_name(%Object*)

declare %Object* @Object_copy(%Object*)

declare void @Int_init(%Int*, i32) local_unnamed_addr

declare i32 @String_length(%String*)

declare %String* @String_concat(%String*, %String*)

declare %String* @String_substr(%String*, i32, i32)

declare %IO* @IO_out_string(%IO*, %String*)

declare %IO* @IO_out_int(%IO*, i32)

declare %String* @IO_in_string(%IO*)

declare i32 @IO_in_int(%IO*)

define i32 @main() local_unnamed_addr {
entry:
  %vtpm.78.i = tail call i8* @malloc(i32 8)
  %malloc.null.i = icmp eq i8* %vtpm.78.i, null
  br i1 %malloc.null.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.79.i = bitcast i8* %vtpm.78.i to %Main*
  %vtpm.80.i = bitcast i8* %vtpm.78.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.80.i, align 8
  %main.retval = tail call %Main* @Main_main(%Main* nonnull %vtpm.79.i)
  ret i32 0
}

declare %Object* @Object_new()

declare %Int* @Int_new()

declare %Bool* @Bool_new()

declare %String* @String_new()

declare %IO* @IO_new()

define %Main* @Main_main(%Main* returned %self) {
entry:
  %vtpm.111.i = tail call i8* @malloc(i32 40)
  %malloc.null.i = icmp eq i8* %vtpm.111.i, null
  br i1 %malloc.null.i, label %abort.i, label %ok.3

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

ok.3:                                             ; preds = %entry
  %vtpm.113.i = bitcast i8* %vtpm.111.i to %_AA_vtable**
  store %_AA_vtable* @_AA_vtable_prototype, %_AA_vtable** %vtpm.113.i, align 8
  %vtpm.114.i = getelementptr i8, i8* %vtpm.111.i, i64 8
  %vtpm.116.i = getelementptr i8, i8* %vtpm.111.i, i64 16
  %vtpm.119.i = getelementptr i8, i8* %vtpm.111.i, i64 32
  %0 = bitcast i8* %vtpm.119.i to i32*
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(5) %vtpm.114.i, i8 0, i64 5, i1 false)
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(13) %vtpm.116.i, i8 0, i64 13, i1 false)
  %vtpm.8 = bitcast i8* %vtpm.111.i to %A*
  store i32 42, i32* %0, align 4
  %vtpm.23 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.23, i32 42)
  %vtpm.10 = bitcast i8* %vtpm.111.i to %_A_vtable**
  %vtpm.41.pre = load %_A_vtable*, %_A_vtable** %vtpm.10, align 8
  %vtpm.42.phi.trans.insert = getelementptr %_A_vtable, %_A_vtable* %vtpm.41.pre, i64 0, i32 6
  %tmp.6.pre = load %A* (%A*)*, %A* (%A*)** %vtpm.42.phi.trans.insert, align 8
  %vtpm.43 = tail call %A* %tmp.6.pre(%A* nonnull %vtpm.8)
  %tmp.7 = icmp eq %A* %vtpm.43, null
  br i1 %tmp.7, label %abort, label %ok.4

ok.4:                                             ; preds = %ok.3
  %vtpm.45 = getelementptr %A, %A* %vtpm.43, i64 0, i32 0
  %vtpm.46 = load %_A_vtable*, %_A_vtable** %vtpm.45, align 8
  %vtpm.47 = getelementptr %_A_vtable, %_A_vtable* %vtpm.46, i64 0, i32 0
  %vtpm.48 = load i32, i32* %vtpm.47, align 4
  %.not4 = icmp eq i32 %vtpm.48, 7
  br i1 %.not4, label %ok.5, label %case.0.1

ok.5:                                             ; preds = %ok.4
  %vtpm.51 = bitcast %A* %vtpm.43 to %AA*
  %vtpm.56 = getelementptr %_A_vtable, %_A_vtable* %vtpm.46, i64 1, i32 2
  %1 = bitcast i8** %vtpm.56 to i32 (%AA*)**
  %tmp.8 = load i32 (%AA*)*, i32 (%AA*)** %1, align 8
  %vtpm.57 = tail call i32 %tmp.8(%AA* nonnull %vtpm.51)
  %vtpm.59 = icmp eq %Main* %self, null
  br i1 %vtpm.59, label %abort, label %ok.6

ok.6:                                             ; preds = %ok.5
  %vtpm.60 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.61 = load %_Main_vtable*, %_Main_vtable** %vtpm.60, align 8
  %vtpm.62 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.61, i64 0, i32 8
  %tmp.9 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %vtpm.62, align 8
  %vtpm.63 = tail call %Main* %tmp.9(%Main* nonnull %self, i32 %vtpm.57)
  br label %case.exit.1

case.0.1:                                         ; preds = %ok.4
  %2 = icmp ugt i32 %vtpm.48, 7
  %vtpm.68 = icmp eq %Main* %self, null
  %or.cond5 = select i1 %2, i1 true, i1 %vtpm.68
  br i1 %or.cond5, label %abort, label %ok.7

ok.7:                                             ; preds = %case.0.1
  %vtpm.69 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.70 = load %_Main_vtable*, %_Main_vtable** %vtpm.69, align 8
  %vtpm.71 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.70, i64 0, i32 7
  %tmp.10 = load %Main* (%Main*, %String*)*, %Main* (%Main*, %String*)** %vtpm.71, align 8
  %vtpm.72 = tail call %Main* %tmp.10(%Main* nonnull %self, %String* nonnull @String.2)
  br label %case.exit.1

case.exit.1:                                      ; preds = %ok.7, %ok.6
  ret %Main* %self

abort:                                            ; preds = %case.0.1, %ok.5, %ok.3
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.78 = tail call i8* @malloc(i32 8)
  %malloc.null = icmp eq i8* %vtpm.78, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.79 = bitcast i8* %vtpm.78 to %Main*
  %vtpm.80 = bitcast i8* %vtpm.78 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.80, align 8
  ret %Main* %vtpm.79

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

define %A* @A_new() {
entry:
  %vtpm.85 = tail call i8* @malloc(i32 32)
  %malloc.null = icmp eq i8* %vtpm.85, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.86 = bitcast i8* %vtpm.85 to %A*
  %vtpm.87 = bitcast i8* %vtpm.85 to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.87, align 8
  %vtpm.88 = getelementptr i8, i8* %vtpm.85, i64 8
  %vtpm.90 = getelementptr i8, i8* %vtpm.85, i64 16
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(5) %vtpm.88, i8 0, i64 5, i1 false)
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(12) %vtpm.90, i8 0, i64 12, i1 false)
  ret %A* %vtpm.86

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn
define i32 @AA_get(%AA* nocapture readonly %self) #0 {
entry:
  %vtpm.99 = getelementptr %AA, %AA* %self, i64 0, i32 6
  %vtpm.100 = load i32, i32* %vtpm.99, align 4
  ret i32 %vtpm.100
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define i32 @AA_set(%AA* nocapture writeonly %self, i32 returned %x) #1 {
entry:
  %vtpm.106 = getelementptr %AA, %AA* %self, i64 0, i32 6
  store i32 %x, i32* %vtpm.106, align 4
  ret i32 %x
}

define %AA* @AA_new() {
entry:
  %vtpm.111 = tail call i8* @malloc(i32 40)
  %malloc.null = icmp eq i8* %vtpm.111, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %vtpm.112 = bitcast i8* %vtpm.111 to %AA*
  %vtpm.113 = bitcast i8* %vtpm.111 to %_AA_vtable**
  store %_AA_vtable* @_AA_vtable_prototype, %_AA_vtable** %vtpm.113, align 8
  %vtpm.114 = getelementptr i8, i8* %vtpm.111, i64 8
  %vtpm.116 = getelementptr i8, i8* %vtpm.111, i64 16
  %vtpm.119 = getelementptr i8, i8* %vtpm.111, i64 32
  %0 = bitcast i8* %vtpm.119 to i32*
  store i32 0, i32* %0, align 4
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(5) %vtpm.114, i8 0, i64 5, i1 false)
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(13) %vtpm.116, i8 0, i64 13, i1 false)
  ret %AA* %vtpm.112

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn writeonly }
