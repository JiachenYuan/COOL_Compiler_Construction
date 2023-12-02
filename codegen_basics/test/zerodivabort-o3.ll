; ModuleID = 'zerodivabort.ll'
source_filename = "module"

declare void @abort() local_unnamed_addr

; Function Attrs: noreturn
define i32 @Main_main() local_unnamed_addr #0 {
entry:
  tail call void @abort()
  unreachable
}

; Function Attrs: noreturn
define i32 @main() local_unnamed_addr #0 {
entry:
  tail call void @abort()
  unreachable
}

attributes #0 = { noreturn }
