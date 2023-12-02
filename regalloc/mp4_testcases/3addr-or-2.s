	.text
	.file	"3addr-or-2.ll"
	.globl	test2                           # -- Begin function test2
	.p2align	4, 0x90
	.type	test2,@function
test2:                                  # @test2
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%esi, %ecx
	movl	%edi, %edx
	movb	%cl, %r8b
	movb	%dl, %r9b
	movzbl	%r9b, %r10d
	movl	%r10d, %r11d
	movq	%r11, %rbx
	shlq	$4, %rbx
	movq	%rbx, %r14
	andq	$48, %r14
	movzbl	%r8b, %ebp
	movl	%ebp, %r15d
	movq	%r15, %r12
	shrq	$4, %r12
	movq	%r12, %r13
	orq	%r14, %r13
	movl	%ecx, -4(%rsp)                  # 4-byte Spill
	movl	%r13d, %ecx
	movl	%ecx, %eax
	movl	%edx, -8(%rsp)                  # 4-byte Spill
	movb	%r9b, -9(%rsp)                  # 1-byte Spill
	movb	%r8b, -10(%rsp)                 # 1-byte Spill
	movl	%ecx, -16(%rsp)                 # 4-byte Spill
	movq	%r13, -24(%rsp)                 # 8-byte Spill
	movq	%r12, -32(%rsp)                 # 8-byte Spill
	movl	%ebp, -36(%rsp)                 # 4-byte Spill
	movq	%r15, -48(%rsp)                 # 8-byte Spill
	movq	%r14, -56(%rsp)                 # 8-byte Spill
	movq	%rbx, -64(%rsp)                 # 8-byte Spill
	movl	%r10d, -68(%rsp)                # 4-byte Spill
	movq	%r11, -80(%rsp)                 # 8-byte Spill
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	test2, .Lfunc_end0-test2
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
	movl	$2, %ecx
	movl	$15, %edx
	movl	%ecx, %edi
	movl	%edx, %esi
	movl	%ecx, 20(%rsp)                  # 4-byte Spill
	movl	%edx, 16(%rsp)                  # 4-byte Spill
	callq	test2@PLT
	movl	%eax, %ecx
	movl	%ecx, %eax
	movl	%ecx, 12(%rsp)                  # 4-byte Spill
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
