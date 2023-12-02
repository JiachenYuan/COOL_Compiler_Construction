	.text
	.file	"add_shl_constant-1.ll"
	.globl	add_shl_add_constant_1_i32      # -- Begin function add_shl_add_constant_1_i32
	.p2align	4, 0x90
	.type	add_shl_add_constant_1_i32,@function
add_shl_add_constant_1_i32:             # @add_shl_add_constant_1_i32
# %bb.0:
	pushq	%rbx
	movl	%esi, %ecx
	movl	%edi, %edx
	movl	%edx, %r8d
	movl	%ecx, %r9d
	movl	%r8d, %r10d
	addl	$123, %r10d
	movl	%r10d, %r11d
	shll	$3, %r11d
	movl	%r11d, %ebx
	addl	%r9d, %ebx
	movl	%ebx, %eax
	movl	%edx, -4(%rsp)                  # 4-byte Spill
	movl	%r8d, -8(%rsp)                  # 4-byte Spill
	movl	%ecx, -12(%rsp)                 # 4-byte Spill
	movl	%r9d, -16(%rsp)                 # 4-byte Spill
	movl	%ebx, -20(%rsp)                 # 4-byte Spill
	movl	%r11d, -24(%rsp)                # 4-byte Spill
	movl	%r10d, -28(%rsp)                # 4-byte Spill
	popq	%rbx
	retq
.Lfunc_end0:
	.size	add_shl_add_constant_1_i32, .Lfunc_end0-add_shl_add_constant_1_i32
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
	movl	$7, %edx
	movl	%ecx, %edi
	movl	%edx, %esi
	movl	%ecx, 20(%rsp)                  # 4-byte Spill
	movl	%edx, 16(%rsp)                  # 4-byte Spill
	callq	add_shl_add_constant_1_i32@PLT
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
