	.file	"meowcpy.c"
	.text
	.data
	.align 32
	.type	.Lubsan_type0, @object
	.size	.Lubsan_type0, 15
.Lubsan_type0:
	.value	-1
	.value	0
	.string	"'uint64_t'"
	.zero	49
	.section	.rodata
	.align 32
.LC0:
	.string	"meowcpy.c"
	.zero	54
	.data
	.align 32
	.type	.Lubsan_data0, @object
	.size	.Lubsan_data0, 32
.Lubsan_data0:
	.quad	.LC0
	.long	14
	.long	10
	.quad	.Lubsan_type0
	.byte	3
	.byte	0
	.zero	6
	.zero	32
	.align 32
	.type	.Lubsan_data1, @object
	.size	.Lubsan_data1, 32
.Lubsan_data1:
	.quad	.LC0
	.long	16
	.long	26
	.quad	.Lubsan_type0
	.byte	3
	.byte	1
	.zero	6
	.zero	32
	.align 32
	.type	.Lubsan_data2, @object
	.size	.Lubsan_data2, 16
.Lubsan_data2:
	.quad	.LC0
	.long	18
	.long	10
	.zero	48
	.align 32
	.type	.Lubsan_data3, @object
	.size	.Lubsan_data3, 16
.Lubsan_data3:
	.quad	.LC0
	.long	19
	.long	12
	.zero	48
	.align 32
	.type	.Lubsan_type1, @object
	.size	.Lubsan_type1, 15
.Lubsan_type1:
	.value	-1
	.value	0
	.string	"'uint32_t'"
	.zero	49
	.align 32
	.type	.Lubsan_data4, @object
	.size	.Lubsan_data4, 32
.Lubsan_data4:
	.quad	.LC0
	.long	27
	.long	12
	.quad	.Lubsan_type1
	.byte	2
	.byte	0
	.zero	6
	.zero	32
	.align 32
	.type	.Lubsan_data5, @object
	.size	.Lubsan_data5, 32
.Lubsan_data5:
	.quad	.LC0
	.long	28
	.long	26
	.quad	.Lubsan_type1
	.byte	2
	.byte	1
	.zero	6
	.zero	32
	.align 32
	.type	.Lubsan_data6, @object
	.size	.Lubsan_data6, 16
.Lubsan_data6:
	.quad	.LC0
	.long	30
	.long	10
	.zero	48
	.align 32
	.type	.Lubsan_data7, @object
	.size	.Lubsan_data7, 16
.Lubsan_data7:
	.quad	.LC0
	.long	31
	.long	12
	.zero	48
	.align 32
	.type	.Lubsan_type2, @object
	.size	.Lubsan_type2, 15
.Lubsan_type2:
	.value	-1
	.value	0
	.string	"'uint16_t'"
	.zero	49
	.align 32
	.type	.Lubsan_data8, @object
	.size	.Lubsan_data8, 32
.Lubsan_data8:
	.quad	.LC0
	.long	39
	.long	12
	.quad	.Lubsan_type2
	.byte	1
	.byte	0
	.zero	6
	.zero	32
	.align 32
	.type	.Lubsan_data9, @object
	.size	.Lubsan_data9, 32
.Lubsan_data9:
	.quad	.LC0
	.long	40
	.long	26
	.quad	.Lubsan_type2
	.byte	1
	.byte	1
	.zero	6
	.zero	32
	.align 32
	.type	.Lubsan_data10, @object
	.size	.Lubsan_data10, 16
.Lubsan_data10:
	.quad	.LC0
	.long	42
	.long	10
	.zero	48
	.align 32
	.type	.Lubsan_data11, @object
	.size	.Lubsan_data11, 16
.Lubsan_data11:
	.quad	.LC0
	.long	43
	.long	12
	.zero	48
	.align 32
	.type	.Lubsan_type3, @object
	.size	.Lubsan_type3, 14
.Lubsan_type3:
	.value	-1
	.value	0
	.string	"'uint8_t'"
	.zero	50
	.align 32
	.type	.Lubsan_data12, @object
	.size	.Lubsan_data12, 32
.Lubsan_data12:
	.quad	.LC0
	.long	51
	.long	12
	.quad	.Lubsan_type3
	.byte	0
	.byte	0
	.zero	6
	.zero	32
	.align 32
	.type	.Lubsan_data13, @object
	.size	.Lubsan_data13, 32
.Lubsan_data13:
	.quad	.LC0
	.long	52
	.long	25
	.quad	.Lubsan_type3
	.byte	0
	.byte	1
	.zero	6
	.zero	32
	.align 32
	.type	.Lubsan_data14, @object
	.size	.Lubsan_data14, 16
.Lubsan_data14:
	.quad	.LC0
	.long	54
	.long	10
	.zero	48
	.align 32
	.type	.Lubsan_data15, @object
	.size	.Lubsan_data15, 16
.Lubsan_data15:
	.quad	.LC0
	.long	55
	.long	12
	.zero	48
	.section	.rodata
	.align 32
.LC1:
	.string	"(to_mem) != NULL"
	.zero	47
	.align 32
.LC2:
	.string	"(from_mem) != NULL"
	.zero	45
	.text
	.globl	meowcpy
	.type	meowcpy, @function
meowcpy:
.LASANPC0:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L2
	call	__asan_handle_no_return
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$6, %edx
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	__assert_fail
.L2:
	cmpq	$0, -24(%rbp)
	je	.L45
	cmpq	$0, -32(%rbp)
	jne	.L5
	call	__asan_handle_no_return
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$7, %edx
	movl	$.LC0, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L5:
	cmpq	$0, -32(%rbp)
	je	.L46
	movq	$0, -8(%rbp)
	jmp	.L7
.L16:
	movq	-32(%rbp), %rax
	cmpq	$0, -32(%rbp)
	je	.L8
	movq	%rax, %rdx
	andl	$7, %edx
	testq	%rdx, %rdx
	je	.L9
.L8:
	movq	%rax, %rsi
	movl	$.Lubsan_data0, %edi
	call	__ubsan_handle_type_mismatch_v1_abort
.L9:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L10
	movq	%rax, %rdi
	call	__asan_report_load8
.L10:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	cmpq	$0, -24(%rbp)
	je	.L11
	movq	%rax, %rdx
	andl	$7, %edx
	testq	%rdx, %rdx
	je	.L12
.L11:
	movq	%rax, %rsi
	movl	$.Lubsan_data1, %edi
	call	__ubsan_handle_type_mismatch_v1_abort
.L12:
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L13
	movq	%rax, %rdi
	call	__asan_report_store8
.L13:
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	cmpq	$-8, %rax
	jb	.L14
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.Lubsan_data2, %edi
	call	__ubsan_handle_pointer_overflow_abort
.L14:
	addq	$8, -24(%rbp)
	movq	-32(%rbp), %rax
	leaq	8(%rax), %rdx
	cmpq	$-8, %rax
	jb	.L15
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.Lubsan_data3, %edi
	call	__ubsan_handle_pointer_overflow_abort
.L15:
	addq	$8, -32(%rbp)
	subq	$8, -40(%rbp)
.L7:
	cmpq	$7, -40(%rbp)
	ja	.L16
	jmp	.L17
.L26:
	movq	-32(%rbp), %rax
	cmpq	$0, -32(%rbp)
	je	.L18
	movq	%rax, %rdx
	andl	$3, %edx
	testq	%rdx, %rdx
	je	.L19
.L18:
	movq	%rax, %rsi
	movl	$.Lubsan_data4, %edi
	call	__ubsan_handle_type_mismatch_v1_abort
.L19:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L20
	movq	%rax, %rdi
	call	__asan_report_load4
.L20:
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %eax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	%eax, %esi
	movq	-24(%rbp), %rax
	cmpq	$0, -24(%rbp)
	je	.L21
	movq	%rax, %rdx
	andl	$3, %edx
	testq	%rdx, %rdx
	je	.L22
.L21:
	movq	%rax, %rsi
	movl	$.Lubsan_data5, %edi
	call	__ubsan_handle_type_mismatch_v1_abort
.L22:
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L23
	movq	%rax, %rdi
	call	__asan_report_store4
.L23:
	movq	-24(%rbp), %rax
	movl	%esi, (%rax)
	movq	-24(%rbp), %rax
	leaq	4(%rax), %rdx
	cmpq	$-4, %rax
	jb	.L24
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.Lubsan_data6, %edi
	call	__ubsan_handle_pointer_overflow_abort
.L24:
	addq	$4, -24(%rbp)
	movq	-32(%rbp), %rax
	leaq	4(%rax), %rdx
	cmpq	$-4, %rax
	jb	.L25
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.Lubsan_data7, %edi
	call	__ubsan_handle_pointer_overflow_abort
.L25:
	addq	$4, -32(%rbp)
	subq	$4, -40(%rbp)
.L17:
	cmpq	$3, -40(%rbp)
	ja	.L26
	jmp	.L27
.L36:
	movq	-32(%rbp), %rax
	cmpq	$0, -32(%rbp)
	je	.L28
	movq	%rax, %rdx
	andl	$1, %edx
	testq	%rdx, %rdx
	je	.L29
.L28:
	movq	%rax, %rsi
	movl	$.Lubsan_data8, %edi
	call	__ubsan_handle_type_mismatch_v1_abort
.L29:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$1, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L30
	movq	%rax, %rdi
	call	__asan_report_load2
.L30:
	movq	-32(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	%eax, %esi
	movq	-24(%rbp), %rax
	cmpq	$0, -24(%rbp)
	je	.L31
	movq	%rax, %rdx
	andl	$1, %edx
	testq	%rdx, %rdx
	je	.L32
.L31:
	movq	%rax, %rsi
	movl	$.Lubsan_data9, %edi
	call	__ubsan_handle_type_mismatch_v1_abort
.L32:
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$1, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L33
	movq	%rax, %rdi
	call	__asan_report_store2
.L33:
	movq	-24(%rbp), %rax
	movw	%si, (%rax)
	movq	-24(%rbp), %rax
	leaq	2(%rax), %rdx
	cmpq	$-2, %rax
	jb	.L34
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.Lubsan_data10, %edi
	call	__ubsan_handle_pointer_overflow_abort
.L34:
	addq	$2, -24(%rbp)
	movq	-32(%rbp), %rax
	leaq	2(%rax), %rdx
	cmpq	$-2, %rax
	jb	.L35
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.Lubsan_data11, %edi
	call	__ubsan_handle_pointer_overflow_abort
.L35:
	addq	$2, -32(%rbp)
	subq	$2, -40(%rbp)
.L27:
	cmpq	$1, -40(%rbp)
	ja	.L36
	jmp	.L37
.L44:
	cmpq	$0, -32(%rbp)
	jne	.L38
	movl	$0, %esi
	movl	$.Lubsan_data12, %edi
	call	__ubsan_handle_type_mismatch_v1_abort
.L38:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%cl
	movq	%rax, %rsi
	andl	$7, %esi
	cmpb	%dl, %sil
	setge	%dl
	andl	%ecx, %edx
	testb	%dl, %dl
	je	.L39
	movq	%rax, %rdi
	call	__asan_report_load1
.L39:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	%eax, %ecx
	cmpq	$0, -24(%rbp)
	jne	.L40
	movl	$0, %esi
	movl	$.Lubsan_data13, %edi
	call	__ubsan_handle_type_mismatch_v1_abort
.L40:
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rdi
	andl	$7, %edi
	cmpb	%dl, %dil
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L41
	movq	%rax, %rdi
	call	__asan_report_store1
.L41:
	movq	-24(%rbp), %rax
	movb	%cl, (%rax)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	cmpq	$-1, %rax
	jb	.L42
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.Lubsan_data14, %edi
	call	__ubsan_handle_pointer_overflow_abort
.L42:
	addq	$1, -24(%rbp)
	movq	-32(%rbp), %rax
	leaq	1(%rax), %rdx
	cmpq	$-1, %rax
	jb	.L43
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.Lubsan_data15, %edi
	call	__ubsan_handle_pointer_overflow_abort
.L43:
	addq	$1, -32(%rbp)
	subq	$1, -40(%rbp)
.L37:
	cmpq	$0, -40(%rbp)
	jne	.L44
	jmp	.L1
.L45:
	nop
	jmp	.L1
.L46:
	nop
.L1:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	meowcpy, .-meowcpy
	.section	.rodata
	.align 32
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 8
__PRETTY_FUNCTION__.0:
	.string	"meowcpy"
	.zero	56
	.data
	.align 16
	.type	.LASANLOC1, @object
	.size	.LASANLOC1, 16
.LASANLOC1:
	.quad	.LC0
	.long	6
	.long	33
	.section	.rodata
.LC3:
	.string	"*.Lubsan_data15"
.LC4:
	.string	"*.Lubsan_data14"
.LC5:
	.string	"*.Lubsan_data13"
.LC6:
	.string	"*.Lubsan_data12"
.LC7:
	.string	"*.Lubsan_type3"
.LC8:
	.string	"*.Lubsan_data11"
.LC9:
	.string	"*.Lubsan_data10"
.LC10:
	.string	"*.Lubsan_data9"
.LC11:
	.string	"*.Lubsan_data8"
.LC12:
	.string	"*.Lubsan_type2"
.LC13:
	.string	"*.Lubsan_data7"
.LC14:
	.string	"*.Lubsan_data6"
.LC15:
	.string	"*.Lubsan_data5"
.LC16:
	.string	"*.Lubsan_data4"
.LC17:
	.string	"*.Lubsan_type1"
.LC18:
	.string	"*.Lubsan_data3"
.LC19:
	.string	"*.Lubsan_data2"
.LC20:
	.string	"*.Lubsan_data1"
.LC21:
	.string	"*.Lubsan_data0"
.LC22:
	.string	"*.Lubsan_type0"
.LC23:
	.string	"__PRETTY_FUNCTION__"
.LC24:
	.string	"*.LC1"
.LC25:
	.string	"*.LC0"
.LC26:
	.string	"*.LC2"
	.data
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 1536
.LASAN0:
	.quad	.Lubsan_data15
	.quad	16
	.quad	64
	.quad	.LC3
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data14
	.quad	16
	.quad	64
	.quad	.LC4
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data13
	.quad	32
	.quad	64
	.quad	.LC5
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data12
	.quad	32
	.quad	64
	.quad	.LC6
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_type3
	.quad	14
	.quad	64
	.quad	.LC7
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data11
	.quad	16
	.quad	64
	.quad	.LC8
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data10
	.quad	16
	.quad	64
	.quad	.LC9
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data9
	.quad	32
	.quad	64
	.quad	.LC10
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data8
	.quad	32
	.quad	64
	.quad	.LC11
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_type2
	.quad	15
	.quad	64
	.quad	.LC12
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data7
	.quad	16
	.quad	64
	.quad	.LC13
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data6
	.quad	16
	.quad	64
	.quad	.LC14
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data5
	.quad	32
	.quad	64
	.quad	.LC15
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data4
	.quad	32
	.quad	64
	.quad	.LC16
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_type1
	.quad	15
	.quad	64
	.quad	.LC17
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data3
	.quad	16
	.quad	64
	.quad	.LC18
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data2
	.quad	16
	.quad	64
	.quad	.LC19
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data1
	.quad	32
	.quad	64
	.quad	.LC20
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_data0
	.quad	32
	.quad	64
	.quad	.LC21
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lubsan_type0
	.quad	15
	.quad	64
	.quad	.LC22
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	__PRETTY_FUNCTION__.0
	.quad	8
	.quad	64
	.quad	.LC23
	.quad	.LC0
	.quad	0
	.quad	.LASANLOC1
	.quad	0
	.quad	.LC1
	.quad	17
	.quad	64
	.quad	.LC24
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC0
	.quad	10
	.quad	64
	.quad	.LC25
	.quad	.LC0
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC2
	.quad	19
	.quad	64
	.quad	.LC26
	.quad	.LC0
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
	movl	$24, %esi
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
	movl	$24, %esi
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
