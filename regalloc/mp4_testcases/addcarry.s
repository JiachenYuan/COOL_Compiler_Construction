	.text
	.file	"addcarry.ll"
	.globl	e                               # -- Begin function e
	.p2align	4, 0x90
	.type	e,@function
e:                                      # @e
# %bb.0:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movl	%esi, %ecx
	movq	%rdi, %rdx
	movq	%rdx, %r8
	movl	%ecx, %r9d
	movl	%r9d, %r10d
	addl	(%r8), %r10d
	cmpl	%r9d, %r10d
	setb	%r11b
	movb	%r11b, %bl
	andb	$1, %bl
	movl	%r10d, %ebp
	addl	%r9d, %ebp
	movl	%ebp, (%r8)
	cmpl	%r9d, %ebp
	setb	%r14b
	movb	%r14b, %r15b
	andb	$1, %r15b
	movb	%r15b, %r12b
	addb	%bl, %r12b
	movb	%r12b, %al
	movq	%rdx, -8(%rsp)                  # 8-byte Spill
	movq	%r8, -16(%rsp)                  # 8-byte Spill
	movl	%ecx, -20(%rsp)                 # 4-byte Spill
	movl	%r9d, -24(%rsp)                 # 4-byte Spill
	movb	%r12b, -25(%rsp)                # 1-byte Spill
	movb	%r15b, -26(%rsp)                # 1-byte Spill
	movb	%r14b, -27(%rsp)                # 1-byte Spill
	movl	%ebp, -32(%rsp)                 # 4-byte Spill
	movb	%bl, -33(%rsp)                  # 1-byte Spill
	movb	%r11b, -34(%rsp)                # 1-byte Spill
	movl	%r10d, -40(%rsp)                # 4-byte Spill
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	e, .Lfunc_end0-e
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	20(%rsp), %rcx
	movl	$21, %edx
	movq	%rcx, %rdi
	movl	%edx, %esi
	movq	%rcx, 8(%rsp)                   # 8-byte Spill
	movl	%edx, 4(%rsp)                   # 4-byte Spill
	callq	e@PLT
	movb	%al, %cl
	movb	%cl, %al
	movb	%cl, 3(%rsp)                    # 1-byte Spill
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
