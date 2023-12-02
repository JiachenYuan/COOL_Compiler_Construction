	.text
	.file	"lea-recursion.ll"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
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
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	g0@GOTPCREL(%rip), %rcx
	movl	(%rcx), %edx
	movq	g1@GOTPCREL(%rip), %rsi
	movl	(%rsi), %edi
	movl	%edx, %r8d
	addl	$1, %r8d
	movl	%r8d, %r9d
	addl	%edi, %r9d
	movq	g0@GOTPCREL(%rip), %r10
	movl	%r9d, 4(%r10)
	movq	g1@GOTPCREL(%rip), %r11
	movl	4(%r11), %ebx
	movl	%r9d, %ebp
	addl	$1, %ebp
	movl	%ebp, %r14d
	addl	%ebx, %r14d
	movq	g0@GOTPCREL(%rip), %r15
	movl	%r14d, 8(%r15)
	movq	g1@GOTPCREL(%rip), %r12
	movl	8(%r12), %r13d
	movq	%rcx, 112(%rsp)                 # 8-byte Spill
	movl	%r14d, %ecx
	addl	$1, %ecx
	movl	%edx, 108(%rsp)                 # 4-byte Spill
	movl	%ecx, %edx
	addl	%r13d, %edx
	movl	%ecx, 104(%rsp)                 # 4-byte Spill
	movq	g0@GOTPCREL(%rip), %rcx
	movl	%edx, 12(%rcx)
	movq	%rcx, 96(%rsp)                  # 8-byte Spill
	movq	g1@GOTPCREL(%rip), %rcx
	movl	%edx, 92(%rsp)                  # 4-byte Spill
	movl	12(%rcx), %edx
	movq	%rcx, 80(%rsp)                  # 8-byte Spill
	movl	92(%rsp), %ecx                  # 4-byte Reload
	movl	%edx, 76(%rsp)                  # 4-byte Spill
	movl	%ecx, %edx
	addl	$1, %edx
	movl	%edx, %ecx
	movl	%edx, 72(%rsp)                  # 4-byte Spill
	movl	76(%rsp), %edx                  # 4-byte Reload
	addl	%edx, %ecx
	movl	%ecx, 68(%rsp)                  # 4-byte Spill
	movq	g0@GOTPCREL(%rip), %rcx
	movl	68(%rsp), %edx                  # 4-byte Reload
	movl	%edx, 16(%rcx)
	movq	%rcx, 56(%rsp)                  # 8-byte Spill
	movq	g1@GOTPCREL(%rip), %rcx
	movl	16(%rcx), %edx
	movq	%rcx, 48(%rsp)                  # 8-byte Spill
	movl	68(%rsp), %ecx                  # 4-byte Reload
	movl	%edx, 44(%rsp)                  # 4-byte Spill
	movl	%ecx, %edx
	addl	$1, %edx
	movl	%edx, %ecx
	movl	%edx, 40(%rsp)                  # 4-byte Spill
	movl	44(%rsp), %edx                  # 4-byte Reload
	addl	%edx, %ecx
	movl	%ecx, 36(%rsp)                  # 4-byte Spill
	movq	g0@GOTPCREL(%rip), %rcx
	movl	36(%rsp), %edx                  # 4-byte Reload
	movl	%edx, 20(%rcx)
	movq	%rcx, 24(%rsp)                  # 8-byte Spill
	movq	g1@GOTPCREL(%rip), %rcx
	movl	20(%rcx), %edx
	movq	%rcx, 16(%rsp)                  # 8-byte Spill
	movl	36(%rsp), %ecx                  # 4-byte Reload
	movl	%edx, 12(%rsp)                  # 4-byte Spill
	movl	%ecx, %edx
	addl	$1, %edx
	movl	%edx, %ecx
	movl	%edx, 8(%rsp)                   # 4-byte Spill
	movl	12(%rsp), %edx                  # 4-byte Reload
	addl	%edx, %ecx
	movl	%ecx, 4(%rsp)                   # 4-byte Spill
	movq	g0@GOTPCREL(%rip), %rcx
	movl	4(%rsp), %edx                   # 4-byte Reload
	movl	%edx, 24(%rcx)
	movq	%rcx, -8(%rsp)                  # 8-byte Spill
	movq	g1@GOTPCREL(%rip), %rcx
	movl	24(%rcx), %edx
	movq	%rcx, -16(%rsp)                 # 8-byte Spill
	movl	4(%rsp), %ecx                   # 4-byte Reload
	movl	%edx, -20(%rsp)                 # 4-byte Spill
	movl	%ecx, %edx
	addl	$1, %edx
	movl	%edx, %ecx
	movl	%edx, -24(%rsp)                 # 4-byte Spill
	movl	-20(%rsp), %edx                 # 4-byte Reload
	addl	%edx, %ecx
	movl	%ecx, -28(%rsp)                 # 4-byte Spill
	movq	g0@GOTPCREL(%rip), %rcx
	movl	-28(%rsp), %edx                 # 4-byte Reload
	movl	%edx, 28(%rcx)
	movq	%rcx, -40(%rsp)                 # 8-byte Spill
	movl	$102, %ecx
	movl	%ecx, %eax
	movl	%ecx, -44(%rsp)                 # 4-byte Spill
	movq	%r12, -56(%rsp)                 # 8-byte Spill
	movl	%r13d, -60(%rsp)                # 4-byte Spill
	movq	%r15, -72(%rsp)                 # 8-byte Spill
	movl	%r14d, -76(%rsp)                # 4-byte Spill
	movl	%ebp, -80(%rsp)                 # 4-byte Spill
	movq	%r11, -88(%rsp)                 # 8-byte Spill
	movl	%ebx, -92(%rsp)                 # 4-byte Spill
	movq	%r10, -104(%rsp)                # 8-byte Spill
	movl	%r9d, -108(%rsp)                # 4-byte Spill
	movl	%r8d, -112(%rsp)                # 4-byte Spill
	movq	%rsi, -120(%rsp)                # 8-byte Spill
	movl	%edi, -124(%rsp)                # 4-byte Spill
	addq	$120, %rsp
	.cfi_def_cfa_offset 56
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
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	g0,@object                      # @g0
	.bss
	.globl	g0
	.p2align	5
g0:
	.zero	4000
	.size	g0, 4000

	.type	g1,@object                      # @g1
	.globl	g1
	.p2align	5
g1:
	.zero	4000
	.size	g1, 4000

	.section	".note.GNU-stack","",@progbits
