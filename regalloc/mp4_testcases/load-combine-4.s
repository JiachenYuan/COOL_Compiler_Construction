	.text
	.file	"load-combine-4.ll"
	.globl	load_i64_by_i8_bswap            # -- Begin function load_i64_by_i8_bswap
	.p2align	4, 0x90
	.type	load_i64_by_i8_bswap,@function
load_i64_by_i8_bswap:                   # @load_i64_by_i8_bswap
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
	movq	%rdi, %rcx
	movq	%rcx, %rdx
	movzbl	(%rdx), %esi
	movl	%esi, %r8d
	movq	%r8, %r9
	shlq	$56, %r9
	movzbl	1(%rdx), %r10d
	movl	%r10d, %r11d
	movq	%r11, %rbx
	shlq	$48, %rbx
	movq	%rbx, %r14
	orq	%r9, %r14
	movzbl	2(%rdx), %ebp
	movl	%ebp, %r15d
	movq	%r15, %r12
	shlq	$40, %r12
	movq	%r14, %r13
	orq	%r12, %r13
	movzbl	3(%rdx), %ecx
	movl	%ecx, %r12d
	movq	%r12, %rcx
	shlq	$32, %rcx
	movq	%r13, %rcx
	orq	%rcx, %rcx
	movzbl	4(%rdx), %ecx
	movl	%ecx, %r12d
	movq	%r12, %rcx
	shlq	$24, %rcx
	movq	%rcx, %r12
	orq	%rcx, %r12
	movzbl	5(%rdx), %ecx
	movl	%ecx, %r13d
	movq	%r13, %rcx
	shlq	$16, %rcx
	movq	%r12, %rcx
	orq	%rcx, %rcx
	movzbl	6(%rdx), %ecx
	movl	%ecx, %r13d
	movq	%r13, %rcx
	shlq	$8, %rcx
	movq	%rcx, %r13
	orq	%rcx, %r13
	movzbl	7(%rdx), %ecx
	movl	%ecx, %edx
	movq	%r13, %rcx
	orq	%rdx, %rcx
	movq	%rcx, %rax
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
	.size	load_i64_by_i8_bswap, .Lfunc_end0-load_i64_by_i8_bswap
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
	movabsq	$72623859790382856, %rcx        # imm = 0x102030405060708
	movq	%rcx, 16(%rsp)
	leaq	16(%rsp), %rdx
	movq	%rdx, %rdi
	movq	%rcx, 8(%rsp)                   # 8-byte Spill
	movq	%rdx, (%rsp)                    # 8-byte Spill
	callq	load_i64_by_i8_bswap@PLT
	movq	%rax, %rcx
	movq	%rcx, %rdx
	movq	8(%rsp), %rsi                   # 8-byte Reload
	subq	%rsi, %rdx
	sete	%r8b
	movb	%r8b, %al
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
