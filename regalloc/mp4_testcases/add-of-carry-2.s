	.text
	.file	"add-of-carry-2.ll"
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
	movl	%edx, %ecx
	movl	%esi, %r8d
	movl	%edi, %r9d
	movl	%r9d, %r10d
	movl	%r8d, %r11d
	movl	%ecx, %ebx
	cmpl	%r11d, %r10d
	seta	%bpl
	movb	%bpl, %r14b
	andb	$1, %r14b
	movb	%r14b, %r15b
	negb	%r15b
	movsbl	%r15b, %r12d
	movl	%r12d, %r13d
	addl	%ebx, %r13d
	movl	%r13d, %eax
	movl	%r9d, -4(%rsp)                  # 4-byte Spill
	movl	%r10d, -8(%rsp)                 # 4-byte Spill
	movl	%r8d, -12(%rsp)                 # 4-byte Spill
	movl	%r11d, -16(%rsp)                # 4-byte Spill
	movl	%ecx, -20(%rsp)                 # 4-byte Spill
	movl	%ebx, -24(%rsp)                 # 4-byte Spill
	movl	%r13d, -28(%rsp)                # 4-byte Spill
	movb	%r14b, -29(%rsp)                # 1-byte Spill
	movb	%r15b, -30(%rsp)                # 1-byte Spill
	movl	%r12d, -36(%rsp)                # 4-byte Spill
	movb	%bpl, -37(%rsp)                 # 1-byte Spill
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
	movl	$12831, %r8d                    # imm = 0x321F
	movl	%ecx, %edi
	movl	%r8d, %esi
	movl	%ecx, %edx
	movl	%ecx, 20(%rsp)                  # 4-byte Spill
	movl	%r8d, 16(%rsp)                  # 4-byte Spill
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
