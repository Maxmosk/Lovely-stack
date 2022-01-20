	.file	"main.c"
	.text
	.globl	__asan_stack_malloc_2
	.section	.rodata
	.align 8
.LC0:
	.string	"3 48 4 4 n:11 64 4 6 buf:14 80 72 7 mystk:7"
	.align 32
.LC1:
	.string	"%d"
	.zero	61
	.data
	.align 32
	.type	.Lubsan_type0, @object
	.size	.Lubsan_type0, 10
.Lubsan_type0:
	.value	0
	.value	11
	.string	"'int'"
	.zero	54
	.section	.rodata
	.align 32
.LC2:
	.string	"main.c"
	.zero	57
	.data
	.align 32
	.type	.Lubsan_data4, @object
	.size	.Lubsan_data4, 24
.Lubsan_data4:
	.quad	.LC2
	.long	15
	.long	29
	.quad	.Lubsan_type0
	.zero	40
	.section	.rodata
	.align 32
.LC3:
	.string	"%d "
	.zero	60
	.data
	.align 32
	.type	.Lubsan_data5, @object
	.size	.Lubsan_data5, 24
.Lubsan_data5:
	.quad	.LC2
	.long	22
	.long	29
	.quad	.Lubsan_type0
	.zero	40
	.text
	.globl	main
	.type	main, @function
main:
.LASANPC0:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$208, %rsp
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	leaq	-224(%rbp), %r13
	movq	%r13, %r14
	cmpl	$0, __asan_option_detect_stack_use_after_return(%rip)
	je	.L1
	movl	$192, %edi
	call	__asan_stack_malloc_2
	testq	%rax, %rax
	je	.L1
	movq	%rax, %r13
.L1:
	leaq	192(%r13), %rax
	movq	%rax, %rbx
	movq	$1102416563, 0(%r13)
	movq	$.LC0, 8(%r13)
	movq	$.LASANPC0, 16(%r13)
	movq	%r13, %r12
	shrq	$3, %r12
	movl	$-235802127, 2147450880(%r12)
	movl	$-234556943, 2147450884(%r12)
	movl	$61956, 2147450888(%r12)
	movl	$-218103808, 2147450896(%r12)
	movl	$-202116109, 2147450900(%r12)
	leaq	-112(%rbx), %rax
	movl	$72, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	leaq	-112(%rbx), %rax
	movl	$4, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	stack_ctor
	leaq	-144(%rbx), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$3, %rax
	addq	$2147450880, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	setne	%cl
	cmpb	$3, %al
	setle	%al
	andl	%ecx, %eax
	testb	%al, %al
	je	.L5
	movq	%rdx, %rdi
	call	__asan_report_store4
.L5:
	movl	$0, -144(%rbx)
	leaq	-144(%rbx), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	leaq	-128(%rbx), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$3, %rax
	addq	$2147450880, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	setne	%cl
	cmpb	$3, %al
	setle	%al
	andl	%ecx, %eax
	testb	%al, %al
	je	.L6
	movq	%rdx, %rdi
	call	__asan_report_store4
.L6:
	movl	$0, -128(%rbx)
	movl	$0, -232(%rbp)
	jmp	.L7
.L11:
	leaq	-128(%rbx), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	leaq	-128(%rbx), %rdx
	leaq	-112(%rbx), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	stack_push
	movl	-232(%rbp), %eax
	addl	$1, %eax
	jno	.L20
	movl	-232(%rbp), %eax
	cltq
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$.Lubsan_data4, %edi
	call	__ubsan_handle_add_overflow_abort
.L20:
	movl	%eax, -232(%rbp)
.L7:
	leaq	-144(%rbx), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$3, %rax
	addq	$2147450880, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	setne	%cl
	cmpb	$3, %al
	setle	%al
	andl	%ecx, %eax
	testb	%al, %al
	je	.L10
	movq	%rdx, %rdi
	call	__asan_report_load4
.L10:
	movl	-144(%rbx), %eax
	cmpl	%eax, -232(%rbp)
	jl	.L11
	movl	$0, -228(%rbp)
	jmp	.L12
.L18:
	leaq	-128(%rbx), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$3, %rax
	addq	$2147450880, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	setne	%cl
	cmpb	$3, %al
	setle	%al
	andl	%ecx, %eax
	testb	%al, %al
	je	.L13
	movq	%rdx, %rdi
	call	__asan_report_store4
.L13:
	movl	$0, -128(%rbx)
	leaq	-128(%rbx), %rdx
	leaq	-112(%rbx), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	stack_pop
	leaq	-128(%rbx), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$3, %rax
	addq	$2147450880, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	setne	%cl
	cmpb	$3, %al
	setle	%al
	andl	%ecx, %eax
	testb	%al, %al
	je	.L14
	movq	%rdx, %rdi
	call	__asan_report_load4
.L14:
	movl	-128(%rbx), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	-228(%rbp), %eax
	addl	$1, %eax
	jno	.L21
	movl	-228(%rbp), %eax
	cltq
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$.Lubsan_data5, %edi
	call	__ubsan_handle_add_overflow_abort
.L21:
	movl	%eax, -228(%rbp)
.L12:
	leaq	-144(%rbx), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$3, %rax
	addq	$2147450880, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	setne	%cl
	cmpb	$3, %al
	setle	%al
	andl	%ecx, %eax
	testb	%al, %al
	je	.L17
	movq	%rdx, %rdi
	call	__asan_report_load4
.L17:
	movl	-144(%rbx), %eax
	cmpl	%eax, -228(%rbp)
	jl	.L18
	leaq	-112(%rbx), %rax
	movq	%rax, %rdi
	call	stack_check
	leaq	-112(%rbx), %rax
	movq	%rax, %rdi
	call	stack_dtor
	movl	$0, %eax
	movl	%eax, %edx
	cmpq	%r13, %r14
	je	.L2
	movq	$1172321806, 0(%r13)
	movabsq	$-723401728380766731, %rsi
	movabsq	$-723401728380766731, %rdi
	movq	%rsi, 2147450880(%r12)
	movq	%rdi, 2147450888(%r12)
	movabsq	$-723401728380766731, %rax
	movq	%rax, 2147450896(%r12)
	movq	248(%r13), %rax
	movb	$0, (%rax)
	jmp	.L3
.L2:
	movq	$0, 2147450880(%r12)
	movl	$0, 2147450888(%r12)
	movq	$0, 2147450896(%r12)
.L3:
	movl	%edx, %eax
	addq	$208, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
.LC4:
	.string	"*.Lubsan_data5"
.LC5:
	.string	"*.Lubsan_data4"
.LC6:
	.string	"*.Lubsan_type0"
.LC7:
	.string	"*.LC2"
.LC8:
	.string	"*.LC3"
.LC9:
	.string	"*.LC1"
	.data
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 384
.LASAN0:
	.quad	.Lubsan_data5
	.quad	24
	.quad	64
	.quad	.LC4
	.quad	.LC2
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data4
	.quad	24
	.quad	64
	.quad	.LC5
	.quad	.LC2
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_type0
	.quad	10
	.quad	64
	.quad	.LC6
	.quad	.LC2
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC2
	.quad	7
	.quad	64
	.quad	.LC7
	.quad	.LC2
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC3
	.quad	4
	.quad	64
	.quad	.LC8
	.quad	.LC2
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC1
	.quad	3
	.quad	64
	.quad	.LC9
	.quad	.LC2
	.quad	0
	.quad	0
	.quad	0
	.text
	.type	_sub_D_00099_0, @function
_sub_D_00099_0:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$6, %esi
	movl	$.LASAN0, %edi
	call	__asan_unregister_globals
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_sub_D_00099_0, .-_sub_D_00099_0
	.section	.fini_array.00099,"aw"
	.align 8
	.quad	_sub_D_00099_0
	.text
	.type	_sub_I_00099_1, @function
_sub_I_00099_1:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	__asan_init
	call	__asan_version_mismatch_check_v8
	movl	$6, %esi
	movl	$.LASAN0, %edi
	call	__asan_register_globals
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_sub_I_00099_1, .-_sub_I_00099_1
	.section	.init_array.00099,"aw"
	.align 8
	.quad	_sub_I_00099_1
	.ident	"GCC: (GNU) 11.2.1 20211203 (Red Hat 11.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
