	.text
	.file	"3addr-or-3.ll"
	.globl	test3                           # -- Begin function test3
	.p2align	4, 0x90
	.type	test3,@function
test3:                                  # @test3
	.cfi_startproc
# %bb.0:
	movq	%rsi, %rax
	movl	%edi, %ecx
	movl	%ecx, %edx
	movq	%rax, %r8
	movl	%edx, %r9d
	shll	$5, %r9d
	movl	%r9d, %r10d
	orl	$3, %r10d
	movl	%r10d, (%r8)
	movl	%ecx, -4(%rsp)                  # 4-byte Spill
	movl	%edx, -8(%rsp)                  # 4-byte Spill
	movq	%rax, -16(%rsp)                 # 8-byte Spill
	movq	%r8, -24(%rsp)                  # 8-byte Spill
	movl	%r10d, -28(%rsp)                # 4-byte Spill
	movl	%r9d, -32(%rsp)                 # 4-byte Spill
	retq
.Lfunc_end0:
	.size	test3, .Lfunc_end0-test3
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
	leaq	20(%rsp), %rdx
	movl	%ecx, %edi
	movq	%rdx, %rsi
	movl	%ecx, 16(%rsp)                  # 4-byte Spill
	movq	%rdx, 8(%rsp)                   # 8-byte Spill
	callq	test3@PLT
	movl	20(%rsp), %ecx
	movl	%ecx, %eax
	movl	%ecx, 4(%rsp)                   # 4-byte Spill
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
