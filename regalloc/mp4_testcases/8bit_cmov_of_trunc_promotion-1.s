	.text
	.file	"8bit_cmov_of_trunc_promotion-1.ll"
	.globl	t0                              # -- Begin function t0
	.p2align	4, 0x90
	.type	t0,@function
t0:                                     # @t0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%edx, %eax
	movl	%esi, %ecx
	movl	%edi, %r8d
	movl	%r8d, %r9d
	movl	%ecx, %r10d
	movl	%eax, %r11d
	movl	%r9d, %ebx
	addl	%r11d, %ebx
	movl	%r10d, %ebp
	addl	%r11d, %ebp
	movb	%bl, %r14b
	movb	%bpl, %r15b
	cmpb	%r15b, %r14b
	movb	%r14b, %r12b
	movl	%r8d, -4(%rsp)                  # 4-byte Spill
	movl	%r9d, -8(%rsp)                  # 4-byte Spill
	movl	%ecx, -12(%rsp)                 # 4-byte Spill
	movl	%r10d, -16(%rsp)                # 4-byte Spill
	movl	%eax, -20(%rsp)                 # 4-byte Spill
	movl	%r11d, -24(%rsp)                # 4-byte Spill
	movb	%r15b, -25(%rsp)                # 1-byte Spill
	movb	%r14b, -26(%rsp)                # 1-byte Spill
	movl	%ebp, -32(%rsp)                 # 4-byte Spill
	movl	%ebx, -36(%rsp)                 # 4-byte Spill
	movb	%r12b, -37(%rsp)                # 1-byte Spill
	jg	.LBB0_2
# %bb.1:
	movb	-38(%rsp), %al                  # 1-byte Reload
	movb	%al, %cl
	movb	%cl, -39(%rsp)                  # 1-byte Spill
.LBB0_2:
	movb	-40(%rsp), %cl                  # 1-byte Reload
	movb	%cl, %dl
	movb	%dl, %al
	movb	%dl, -41(%rsp)                  # 1-byte Spill
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	t0, .Lfunc_end0-t0
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
	movl	$15, %ecx
	movl	$8, %r8d
	movl	$19, %r9d
	movl	%ecx, %edi
	movl	%r8d, %esi
	movl	%r9d, %edx
	movl	%ecx, 20(%rsp)                  # 4-byte Spill
	movl	%r8d, 16(%rsp)                  # 4-byte Spill
	movl	%r9d, 12(%rsp)                  # 4-byte Spill
	callq	t0@PLT
	movb	%al, %cl
	movb	%cl, %al
	movb	%cl, 11(%rsp)                   # 1-byte Spill
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
