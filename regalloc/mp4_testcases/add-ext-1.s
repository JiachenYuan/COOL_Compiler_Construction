	.text
	.file	"add-ext-1.ll"
	.globl	add_nsw_consts                  # -- Begin function add_nsw_consts
	.p2align	4, 0x90
	.type	add_nsw_consts,@function
add_nsw_consts:                         # @add_nsw_consts
	.cfi_startproc
# %bb.0:
	movl	%edi, %ecx
	movl	%ecx, %edx
	movl	%edx, %esi
	addl	$5, %esi
	movslq	%esi, %r8
	movq	%r8, %r9
	addq	$7, %r9
	movq	%r9, %rax
	movl	%ecx, -4(%rsp)                  # 4-byte Spill
	movl	%edx, -8(%rsp)                  # 4-byte Spill
	movq	%r9, -16(%rsp)                  # 8-byte Spill
	movq	%r8, -24(%rsp)                  # 8-byte Spill
	movl	%esi, -28(%rsp)                 # 4-byte Spill
	retq
.Lfunc_end0:
	.size	add_nsw_consts, .Lfunc_end0-add_nsw_consts
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	xorl	%ecx, %ecx
	movl	%ecx, %edi
	movl	%ecx, 20(%rsp)                  # 4-byte Spill
	callq	add_nsw_consts@PLT
	movq	%rax, %rcx
	movq	%rcx, %rax
	movq	%rcx, 8(%rsp)                   # 8-byte Spill
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
