; ModuleID = 'loop.ll'
source_filename = "module"

@.str = internal constant [25 x i8] c"Main.main() returned %d\0A\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree norecurse nosync nounwind readnone
define i32 @Main_main() local_unnamed_addr #1 {
entry:
  ret i32 10
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull @.str, i32 10)
  ret i32 0
}

attributes #0 = { nofree nounwind }
attributes #1 = { nofree norecurse nosync nounwind readnone }
