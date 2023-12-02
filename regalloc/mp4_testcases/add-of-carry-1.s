	.text
	.file	"add-of-carry-1.ll"
	.globl	test1                           # -- Begin function test1
	.p2align	4, 0x90
	.type	test1,@function
test1:                                  # @test1
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	%esi, %ecx
	movl	%edi, %edx
	movl	%edx, %r8d
	movl	%ecx, %r9d
	movl	%r9d, %r10d
	addl	%r8d, %r10d
	cmpl	%r9d, %r10d
	setb	%r11b
	movb	%r11b, %bl
	andb	$1, %bl
	movzbl	%bl, %ebp
	movl	%r10d, %r14d
	addl	%ebp, %r14d
	movl	%r14d, %eax
	movl	%edx, -4(%rsp)                  # 4-byte Spill
	movl	%r8d, -8(%rsp)                  # 4-byte Spill
	movl	%ecx, -12(%rsp)                 # 4-byte Spill
	movl	%r9d, -16(%rsp)                 # 4-byte Spill
	movl	%r14d, -20(%rsp)                # 4-byte Spill
	movb	%bl, -21(%rsp)                  # 1-byte Spill
	movl	%ebp, -28(%rsp)                 # 4-byte Spill
	movb	%r11b, -29(%rsp)                # 1-byte Spill
	movl	%r10d, -36(%rsp)                # 4-byte Spill
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	test1, .Lfunc_end0-test1
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
	movl	$12831, %edx                    # imm = 0x321F
	movl	%ecx, %edi
	movl	%edx, %esi
	movl	%ecx, 20(%rsp)                  # 4-byte Spill
	movl	%edx, 16(%rsp)                  # 4-byte Spill
	callq	test1@PLT
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
