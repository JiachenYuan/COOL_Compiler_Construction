	.text
	.file	"addcarry2.ll"
	.globl	adc_load_store_64_15            # -- Begin function adc_load_store_64_15
	.p2align	4, 0x90
	.type	adc_load_store_64_15,@function
adc_load_store_64_15:                   # @adc_load_store_64_15
# %bb.0:
	pushq	%rbx
	movq	%rdx, %rax
	movq	%rsi, %rcx
	movq	%rdi, %r8
	movq	%rax, %r9
	addq	$1, %r9
	adcq	$15, (%r8)
	setb	%r10b
	movzbl	%r10b, %r11d
	movl	%r11d, %ebx
	movq	%rbx, (%rcx)
	movq	%r8, -8(%rsp)                   # 8-byte Spill
	movq	%rcx, -16(%rsp)                 # 8-byte Spill
	movq	%rax, -24(%rsp)                 # 8-byte Spill
	movq	%rbx, -32(%rsp)                 # 8-byte Spill
	movq	%r9, -40(%rsp)                  # 8-byte Spill
	movb	%r10b, -41(%rsp)                # 1-byte Spill
	movl	%r11d, -48(%rsp)                # 4-byte Spill
	popq	%rbx
	retq
.Lfunc_end0:
	.size	adc_load_store_64_15, .Lfunc_end0-adc_load_store_64_15
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	$10, 40(%rsp)
	leaq	40(%rsp), %rcx
	leaq	48(%rsp), %r8
	movl	$21, %r9d
	movq	%rcx, %rdi
	movq	%r8, %rsi
	movq	%r9, %rdx
	movq	%rcx, 32(%rsp)                  # 8-byte Spill
	movq	%r8, 24(%rsp)                   # 8-byte Spill
	movq	%r9, 16(%rsp)                   # 8-byte Spill
	callq	adc_load_store_64_15@PLT
	movq	48(%rsp), %rcx
	movq	%rcx, %rax
	movq	%rcx, 8(%rsp)                   # 8-byte Spill
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
