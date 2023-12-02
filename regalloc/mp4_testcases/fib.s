	.text
	.file	"fib.ll"
	.globl	fib                             # -- Begin function fib
	.p2align	4, 0x90
	.type	fib,@function
fib:                                    # @fib
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movl	%edi, %eax
	movl	%eax, %ecx
	cmpl	$2, %ecx
	movl	%eax, 36(%rsp)                  # 4-byte Spill
	movl	%ecx, 32(%rsp)                  # 4-byte Spill
	jg	.LBB0_2
# %bb.1:                                # %then
	movl	$1, %ecx
	movl	%ecx, %eax
	movl	%ecx, 28(%rsp)                  # 4-byte Spill
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB0_2:                                # %else
	.cfi_def_cfa_offset 48
	movl	24(%rsp), %ecx                  # 4-byte Reload
	movl	%ecx, %edx
	subl	$1, %edx
	movl	%ecx, %esi
	subl	$2, %esi
	movl	%edx, %edi
	movl	%esi, 20(%rsp)                  # 4-byte Spill
	movl	%edx, 16(%rsp)                  # 4-byte Spill
	callq	fib@PLT
	movl	%eax, %ecx
	movl	20(%rsp), %edx                  # 4-byte Reload
	movl	%edx, %edi
	movl	%ecx, 12(%rsp)                  # 4-byte Spill
	callq	fib@PLT
	movl	%eax, %ecx
	movl	12(%rsp), %edx                  # 4-byte Reload
	movl	%edx, %esi
	addl	%ecx, %esi
	movl	%esi, %eax
	movl	%esi, 8(%rsp)                   # 4-byte Spill
	movl	%ecx, 4(%rsp)                   # 4-byte Spill
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	fib, .Lfunc_end0-fib
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
	movl	$12, %ecx
	movl	%ecx, %edi
	movl	%ecx, 4(%rsp)                   # 4-byte Spill
	callq	fib@PLT
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
