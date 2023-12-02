	.text
	.file	"add-i64-2.ll"
	.globl	pr32690                         # -- Begin function pr32690
	.p2align	4, 0x90
	.type	pr32690,@function
pr32690:                                # @pr32690
	.cfi_startproc
# %bb.0:
	movl	%edi, %ecx
	movl	%ecx, %edx
	movl	%edx, %esi
	movl	%esi, %r8d
	movq	%r8, %r9
	addq	$63, %r9
	movq	%r9, %r10
	shrq	$6, %r10
	movl	%r10d, %r11d
	movl	%r11d, %eax
	movl	%ecx, -4(%rsp)                  # 4-byte Spill
	movl	%edx, -8(%rsp)                  # 4-byte Spill
	movl	%r11d, -12(%rsp)                # 4-byte Spill
	movq	%r10, -24(%rsp)                 # 8-byte Spill
	movq	%r9, -32(%rsp)                  # 8-byte Spill
	movl	%esi, -36(%rsp)                 # 4-byte Spill
	movq	%r8, -48(%rsp)                  # 8-byte Spill
	retq
.Lfunc_end0:
	.size	pr32690, .Lfunc_end0-pr32690
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$2, %ecx
	movl	%ecx, %edi
	movl	%ecx, 4(%rsp)                   # 4-byte Spill
	callq	pr32690@PLT
	movl	%eax, %ecx
	movl	%ecx, %eax
	movl	%ecx, (%rsp)                    # 4-byte Spill
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
