	.text
	.file	"3addr-or-1.ll"
	.globl	test1                           # -- Begin function test1
	.p2align	4, 0x90
	.type	test1,@function
test1:                                  # @test1
	.cfi_startproc
# %bb.0:
	movl	%edi, %ecx
	movl	%ecx, %edx
	movl	%edx, %esi
	shll	$5, %esi
	movl	%esi, %r8d
	orl	$3, %r8d
	movl	%r8d, %eax
	movl	%ecx, -4(%rsp)                  # 4-byte Spill
	movl	%edx, -8(%rsp)                  # 4-byte Spill
	movl	%r8d, -12(%rsp)                 # 4-byte Spill
	movl	%esi, -16(%rsp)                 # 4-byte Spill
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
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$15, %ecx
	movl	%ecx, %edi
	movl	%ecx, 4(%rsp)                   # 4-byte Spill
	callq	test1@PLT
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
