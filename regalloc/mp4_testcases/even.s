	.text
	.file	"even.ll"
	.globl	even                            # -- Begin function even
	.p2align	4, 0x90
	.type	even,@function
even:                                   # @even
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movl	%edi, %eax
	movl	%eax, %ecx
	cmpl	$0, %ecx
	movl	%eax, 52(%rsp)                  # 4-byte Spill
	movl	%ecx, 48(%rsp)                  # 4-byte Spill
	je	.LBB0_4
# %bb.1:                                # %nonzero
	movl	44(%rsp), %eax                  # 4-byte Reload
	cmpl	$0, %eax
	jle	.LBB0_3
# %bb.2:                                # %positive
	movl	40(%rsp), %ecx                  # 4-byte Reload
	movl	%ecx, %edx
	subl	$1, %edx
	movl	%edx, %edi
	movl	%edx, 36(%rsp)                  # 4-byte Spill
	callq	even@PLT
	movb	%al, %cl
	testb	$1, %cl
	movb	%cl, 35(%rsp)                   # 1-byte Spill
	jne	.LBB0_5
	jmp	.LBB0_4
.LBB0_3:                                # %negative
	movl	28(%rsp), %ecx                  # 4-byte Reload
	movl	%ecx, %edx
	addl	$1, %edx
	movl	%edx, %edi
	movl	%edx, 24(%rsp)                  # 4-byte Spill
	callq	even@PLT
	movb	%al, %cl
	testb	$1, %cl
	movb	%cl, 23(%rsp)                   # 1-byte Spill
	jne	.LBB0_5
.LBB0_4:                                # %true
	movb	$1, %cl
	movb	%cl, %al
	movb	%cl, 22(%rsp)                   # 1-byte Spill
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB0_5:                                # %false
	.cfi_def_cfa_offset 64
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movb	%dl, %al
	movl	%ecx, 16(%rsp)                  # 4-byte Spill
	movb	%dl, 15(%rsp)                   # 1-byte Spill
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	even, .Lfunc_end0-even
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
	movl	$-11, %ecx
	movl	%ecx, %edi
	movl	%ecx, 4(%rsp)                   # 4-byte Spill
	callq	even@PLT
	movb	%al, %cl
	movb	%cl, %dl
	movb	%cl, %al
	movb	%dl, 3(%rsp)                    # 1-byte Spill
	movb	%cl, 2(%rsp)                    # 1-byte Spill
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
