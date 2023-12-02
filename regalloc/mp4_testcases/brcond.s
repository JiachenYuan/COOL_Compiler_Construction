	.text
	.file	"brcond.ll"
	.globl	test1                           # -- Begin function test1
	.p2align	4, 0x90
	.type	test1,@function
test1:                                  # @test1
# %bb.0:                                # %entry
	pushq	%rbp
	pushq	%rbx
	movl	%esi, %eax
	movl	%edi, %ecx
	movl	%ecx, %edx
	movl	%eax, %r8d
	movl	%edx, %r9d
	andl	$16384, %r9d                    # imm = 0x4000
	cmpl	$0, %r9d
	setne	%r10b
	movl	%r8d, %r11d
	andl	$16384, %r11d                   # imm = 0x4000
	cmpl	$0, %r11d
	setne	%bl
	movb	%r10b, %bpl
	xorb	%bl, %bpl
	testb	$1, %bpl
	movl	%ecx, -4(%rsp)                  # 4-byte Spill
	movl	%edx, -8(%rsp)                  # 4-byte Spill
	movl	%eax, -12(%rsp)                 # 4-byte Spill
	movl	%r8d, -16(%rsp)                 # 4-byte Spill
	movb	%bpl, -17(%rsp)                 # 1-byte Spill
	movb	%bl, -18(%rsp)                  # 1-byte Spill
	movl	%r11d, -24(%rsp)                # 4-byte Spill
	movb	%r10b, -25(%rsp)                # 1-byte Spill
	movl	%r9d, -32(%rsp)                 # 4-byte Spill
	jne	.LBB0_2
# %bb.1:                                # %bb
	movl	$10, %ecx
	movl	%ecx, %eax
	movl	%ecx, -36(%rsp)                 # 4-byte Spill
	popq	%rbx
	popq	%rbp
	retq
.LBB0_2:                                # %bb1
	movl	$11, %ecx
	movl	%ecx, %eax
	movl	%ecx, -40(%rsp)                 # 4-byte Spill
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end0:
	.size	test1, .Lfunc_end0-test1
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$107, %ecx
	movl	$87, %edx
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
