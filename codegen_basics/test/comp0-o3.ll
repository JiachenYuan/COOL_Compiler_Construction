; ModuleID = 'comp0.ll'
source_filename = "module"

@.str = internal constant [25 x i8] c"Main.main() returned %d\0A\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @Main_main() local_unnamed_addr #1 {
entry:
  ret i32 0
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull @.str, i32 0)
  ret i32 0
}

attributes #0 = { nofree nounwind }
attributes #1 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
