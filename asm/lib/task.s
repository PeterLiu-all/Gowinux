	.file	"task.cpp"
	.intel_syntax noprefix
	.text
.Ltext0:
	.file 0 "/home/dever/OSdevelop/workspace" "/home/dever/OSdevelop/workspace/lib/task.cpp"
	.section	.rodata
	.align 4
	.type	_ZL13FREETASK_SIGN, @object
	.size	_ZL13FREETASK_SIGN, 4
_ZL13FREETASK_SIGN:
	.long	-1
	.section	.text.get_page_start,"axG",@progbits,get_page_start,comdat
	.weak	get_page_start
	.type	get_page_start, @function
get_page_start:
.LFB2:
	.file 1 "/home/dever/OSdevelop/workspace/include/lib/stack.h"
	.loc 1 22 41
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	.loc 1 23 33
	mov	eax, DWORD PTR [ebp+8]
	and	eax, -4096
	.loc 1 24 1
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	get_page_start, .-get_page_start
	.local	_ZL10base_stack
	.comm	_ZL10base_stack,4,4
	.local	_ZL10task_stack
	.comm	_ZL10task_stack,4,4
	.local	_ZL8cur_task
	.comm	_ZL8cur_task,4,4
	.local	_ZL8task_num
	.comm	_ZL8task_num,4,4
	.section	.rodata
	.align 4
	.type	_ZL5stage, @object
	.size	_ZL5stage, 4
_ZL5stage:
	.long	28
	.text
	.globl	_Z11switch_taskv
	.type	_Z11switch_taskv, @function
_Z11switch_taskv:
.LFB4:
	.file 2 "/home/dever/OSdevelop/workspace/lib/task.cpp"
	.loc 2 16 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	.loc 2 18 27
	mov	eax, DWORD PTR _ZL8task_num
	.loc 2 18 12
	sub	eax, 1
	mov	DWORD PTR [ebp-4], eax
	.loc 2 19 12
	mov	eax, DWORD PTR _ZL8cur_task
	mov	DWORD PTR [ebp-8], eax
	.loc 2 20 5
	jmp	.L4
.L7:
	.loc 2 21 14
	add	DWORD PTR [ebp-8], 224
	.loc 2 22 18
	mov	eax, DWORD PTR _ZL10base_stack
	.loc 2 22 9
	cmp	DWORD PTR [ebp-8], eax
	jb	.L5
	.loc 2 23 18
	mov	eax, DWORD PTR _ZL10task_stack
	mov	DWORD PTR [ebp-8], eax
	jmp	.L4
.L5:
	.loc 2 24 43
	mov	eax, DWORD PTR [ebp-8]
	mov	eax, DWORD PTR [eax]
	.loc 2 24 16
	cmp	eax, -1
	je	.L4
	.loc 2 25 22
	mov	eax, DWORD PTR [ebp-8]
	mov	DWORD PTR _ZL8cur_task, eax
	.loc 2 26 13
	jmp	.L6
.L4:
	.loc 2 20 15
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [eax-1]
	mov	DWORD PTR [ebp-4], edx
	test	eax, eax
	setne	al
	test	al, al
	jne	.L7
.L6:
	.loc 2 29 14
	mov	eax, DWORD PTR [ebp-8]
	mov	DWORD PTR _ZL8cur_task, eax
	.loc 2 30 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	_Z11switch_taskv, .-_Z11switch_taskv
	.globl	_Z15find_spare_taskv
	.type	_Z15find_spare_taskv, @function
_Z15find_spare_taskv:
.LFB5:
	.loc 2 32 25
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	.loc 2 33 12
	mov	eax, DWORD PTR _ZL10task_stack
	mov	DWORD PTR [ebp-4], eax
	.loc 2 34 5
	jmp	.L9
.L11:
	.loc 2 35 16
	add	DWORD PTR [ebp-4], 224
.L9:
	.loc 2 34 37
	mov	eax, DWORD PTR [ebp-4]
	mov	eax, DWORD PTR [eax]
	.loc 2 34 59
	cmp	eax, -1
	je	.L10
	.loc 2 34 69 discriminator 1
	mov	eax, DWORD PTR _ZL10base_stack
	.loc 2 34 59 discriminator 1
	cmp	DWORD PTR [ebp-4], eax
	jne	.L11
.L10:
	.loc 2 37 12
	mov	eax, DWORD PTR [ebp-4]
	.loc 2 38 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	_Z15find_spare_taskv, .-_Z15find_spare_taskv
	.globl	task_init
	.type	task_init, @function
task_init:
.LFB6:
	.loc 2 43 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 2 45 5
/APP
/  45 "/home/dever/OSdevelop/workspace/lib/task.cpp" 1
	movl %esp, %eax
/  0 "" 2
/NO_APP
	mov	DWORD PTR [ebp-12], eax
	.loc 2 46 32
	sub	esp, 12
	push	DWORD PTR [ebp-12]
	call	get_page_start
	add	esp, 16
	.loc 2 46 16
	mov	DWORD PTR _ZL10base_stack, eax
	.loc 2 47 28
	mov	eax, DWORD PTR _ZL10base_stack
	mov	DWORD PTR _ZL10task_stack, eax
	.loc 2 47 14
	mov	eax, DWORD PTR _ZL10task_stack
	mov	DWORD PTR _ZL8cur_task, eax
	.loc 2 48 14
	mov	DWORD PTR _ZL8task_num, 0
	.loc 2 49 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	task_init, .-task_init
	.globl	task_create
	.type	task_create, @function
task_create:
.LFB7:
	.loc 2 59 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	.loc 2 61 36
	call	_Z15find_spare_taskv
	.loc 2 61 19
	mov	edx, DWORD PTR [ebp+8]
	mov	DWORD PTR [edx], eax
	.loc 2 61 15
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax]
	.loc 2 61 40
	mov	eax, DWORD PTR _ZL10base_stack
	cmp	edx, eax
	sete	al
	.loc 2 61 5
	test	al, al
	je	.L15
	.loc 2 63 20
	mov	eax, DWORD PTR _ZL10task_stack
	sub	eax, 224
	mov	DWORD PTR _ZL10task_stack, eax
	.loc 2 64 18
	mov	edx, DWORD PTR _ZL10task_stack
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
.L15:
	.loc 2 66 10
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 2 66 22
	mov	edx, DWORD PTR [ebp+12]
	mov	DWORD PTR [eax], edx
	.loc 2 67 10
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 2 67 21
	mov	edx, DWORD PTR [ebp+16]
	mov	DWORD PTR [eax+4], edx
	.loc 2 68 10
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 2 68 21
	mov	edx, DWORD PTR [ebp+20]
	mov	DWORD PTR [eax+8], edx
	.loc 2 69 10
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 2 69 21
	mov	edx, DWORD PTR [ebp+24]
	mov	DWORD PTR [eax+12], edx
	.loc 2 70 10
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 2 70 21
	mov	edx, DWORD PTR [ebp+28]
	mov	DWORD PTR [eax+16], edx
	.loc 2 71 10
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 2 71 21
	mov	edx, DWORD PTR [ebp+32]
	mov	DWORD PTR [eax+20], edx
	.loc 2 72 10
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 2 72 21
	mov	edx, DWORD PTR [ebp+36]
	mov	DWORD PTR [eax+24], edx
	.loc 2 73 13
	mov	eax, DWORD PTR _ZL8task_num
	add	eax, 1
	mov	DWORD PTR _ZL8task_num, eax
	.loc 2 74 12
	nop
	.loc 2 75 1
	mov	eax, DWORD PTR [ebp+8]
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	4
	.cfi_endproc
.LFE7:
	.size	task_create, .-task_create
	.globl	task_hang
	.type	task_hang, @function
task_hang:
.LFB8:
	.loc 2 78 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	.loc 2 79 16
	call	_Z11switch_taskv
	.loc 2 85 51
	mov	eax, DWORD PTR _ZL8cur_task
	mov	eax, DWORD PTR [eax+8]
	.loc 2 85 56
	mov	edx, eax
	mov	eax, DWORD PTR _ZL8cur_task
	sub	esp, 12
	push	eax
	call	edx
.LVL0:
	add	esp, 16
	.loc 2 86 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	task_hang, .-task_hang
	.globl	task_end
	.type	task_end, @function
task_end:
.LFB9:
	.loc 2 88 28
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	.loc 2 89 11
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 2 89 23
	mov	DWORD PTR [eax], -1
	.loc 2 90 1
	nop
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	task_end, .-task_end
	.globl	task_start
	.type	task_start, @function
task_start:
.LFB10:
	.loc 2 92 30
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	.loc 2 93 22
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 2 93 14
	mov	DWORD PTR _ZL8cur_task, eax
	.loc 2 99 51
	mov	eax, DWORD PTR _ZL8cur_task
	mov	eax, DWORD PTR [eax+8]
	.loc 2 99 56
	mov	edx, eax
	mov	eax, DWORD PTR _ZL8cur_task
	sub	esp, 12
	push	eax
	call	edx
.LVL1:
	add	esp, 16
	.loc 2 100 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	task_start, .-task_start
.Letext0:
	.file 3 "/home/dever/OSdevelop/workspace/include/lib/task.h"
	.file 4 "/home/dever/OSdevelop/workspace/include/Gowinux/types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x336
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0xc
	.long	.LASF30
	.byte	0x21
	.long	.LASF0
	.long	.LASF1
	.long	.LLRL0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x5
	.long	.LASF10
	.byte	0x4
	.byte	0x22
	.byte	0x7
	.long	0x37
	.uleb128 0xd
	.long	0x26
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF3
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF4
	.uleb128 0xe
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x8
	.long	.LASF19
	.byte	0x3
	.byte	0x6
	.long	0x32
	.uleb128 0x5
	.byte	0x3
	.long	_ZL13FREETASK_SIGN
	.uleb128 0x9
	.long	.LASF11
	.byte	0x1c
	.byte	0xe
	.long	0xdb
	.uleb128 0xf
	.long	.LASF9
	.byte	0x3
	.byte	0xf
	.byte	0xc
	.long	0x26
	.byte	0
	.uleb128 0x4
	.string	"ebp"
	.byte	0x10
	.long	0x26
	.byte	0x4
	.uleb128 0x4
	.string	"eip"
	.byte	0x11
	.long	0x26
	.byte	0x8
	.uleb128 0x4
	.string	"edi"
	.byte	0x13
	.long	0x26
	.byte	0xc
	.uleb128 0x4
	.string	"esi"
	.byte	0x14
	.long	0x26
	.byte	0x10
	.uleb128 0x4
	.string	"edx"
	.byte	0x15
	.long	0x26
	.byte	0x14
	.uleb128 0x4
	.string	"ecx"
	.byte	0x16
	.long	0x26
	.byte	0x18
	.byte	0
	.uleb128 0x5
	.long	.LASF11
	.byte	0x3
	.byte	0x17
	.byte	0x2
	.long	0x80
	.uleb128 0x9
	.long	.LASF12
	.byte	0x4
	.byte	0x19
	.long	0x11b
	.uleb128 0x10
	.byte	0x4
	.byte	0x3
	.byte	0x1b
	.byte	0xb
	.long	0x114
	.uleb128 0x11
	.string	"esp"
	.byte	0x3
	.byte	0x1c
	.byte	0x10
	.long	0x26
	.uleb128 0x12
	.long	.LASF13
	.byte	0x3
	.byte	0x1d
	.byte	0x17
	.long	0x11b
	.byte	0
	.uleb128 0x13
	.long	0xf2
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0xdb
	.uleb128 0x5
	.long	.LASF12
	.byte	0x3
	.byte	0x1f
	.byte	0x2
	.long	0xe7
	.uleb128 0x5
	.long	.LASF14
	.byte	0x3
	.byte	0x22
	.byte	0x7
	.long	0x138
	.uleb128 0x6
	.long	0x13d
	.uleb128 0x14
	.long	0x148
	.uleb128 0x15
	.long	0x11b
	.byte	0
	.uleb128 0x2
	.long	.LASF15
	.byte	0x4
	.byte	0xf
	.long	0x26
	.uleb128 0x5
	.byte	0x3
	.long	_ZL10base_stack
	.uleb128 0x2
	.long	.LASF16
	.byte	0x5
	.byte	0xf
	.long	0x26
	.uleb128 0x5
	.byte	0x3
	.long	_ZL10task_stack
	.uleb128 0x2
	.long	.LASF17
	.byte	0x6
	.byte	0xf
	.long	0x26
	.uleb128 0x5
	.byte	0x3
	.long	_ZL8cur_task
	.uleb128 0x2
	.long	.LASF18
	.byte	0x7
	.byte	0xf
	.long	0x26
	.uleb128 0x5
	.byte	0x3
	.long	_ZL8task_num
	.uleb128 0x8
	.long	.LASF20
	.byte	0x2
	.byte	0x8
	.long	0x32
	.uleb128 0x5
	.byte	0x3
	.long	_ZL5stage
	.uleb128 0xa
	.long	.LASF21
	.byte	0x5c
	.long	.LFB10
	.long	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c0
	.uleb128 0x7
	.long	.LASF23
	.byte	0x5c
	.byte	0x19
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x6
	.long	0x120
	.uleb128 0x16
	.long	.LASF22
	.byte	0x2
	.byte	0x58
	.byte	0x6
	.long	.LFB9
	.long	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ea
	.uleb128 0x7
	.long	.LASF23
	.byte	0x58
	.byte	0x17
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x17
	.long	.LASF31
	.byte	0x2
	.byte	0x4d
	.byte	0x6
	.long	.LFB8
	.long	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.long	.LASF26
	.byte	0x2
	.byte	0x33
	.byte	0x8
	.long	0x120
	.long	.LFB7
	.long	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x28e
	.uleb128 0x7
	.long	.LASF9
	.byte	0x34
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x3
	.string	"ebp"
	.byte	0x2
	.byte	0x35
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x3
	.string	"eip"
	.byte	0x2
	.byte	0x36
	.byte	0x14
	.long	0x12c
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x3
	.string	"edi"
	.byte	0x2
	.byte	0x37
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x3
	.string	"esi"
	.byte	0x2
	.byte	0x38
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x3
	.string	"edx"
	.byte	0x2
	.byte	0x39
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x3
	.string	"ecx"
	.byte	0x2
	.byte	0x3a
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x2
	.long	.LASF23
	.byte	0x3c
	.byte	0xc
	.long	0x120
	.uleb128 0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0xa
	.long	.LASF24
	.byte	0x2a
	.long	.LFB6
	.long	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x2b0
	.uleb128 0xb
	.string	"esp"
	.byte	0x2c
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x19
	.long	.LASF32
	.byte	0x2
	.byte	0x20
	.byte	0x8
	.long	.LASF33
	.long	0x26
	.long	.LFB5
	.long	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x2dd
	.uleb128 0x2
	.long	.LASF25
	.byte	0x21
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1a
	.long	.LASF27
	.byte	0x2
	.byte	0xf
	.byte	0x6
	.long	.LASF34
	.long	.LFB4
	.long	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x313
	.uleb128 0xb
	.string	"cnt"
	.byte	0x12
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2
	.long	.LASF28
	.byte	0x13
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1b
	.long	.LASF29
	.byte	0x1
	.byte	0x16
	.byte	0xf
	.long	0x26
	.long	.LFB2
	.long	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.string	"esp"
	.byte	0x1
	.byte	0x16
	.byte	0x25
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 31
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x6c
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x24
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.LFB2
	.long	.LFE2-.LFB2
	.long	0
	.long	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.long	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.value	0x5
	.byte	0x4
	.byte	0
	.long	0
.LLRL0:
	.byte	0x7
	.long	.Ltext0
	.uleb128 .Letext0-.Ltext0
	.byte	0x7
	.long	.LFB2
	.uleb128 .LFE2-.LFB2
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF12:
	.string	"task_t"
.LASF10:
	.string	"size_t"
.LASF11:
	.string	"task_frame_t"
.LASF16:
	.string	"task_stack"
.LASF25:
	.string	"finder"
.LASF20:
	.string	"stage"
.LASF8:
	.string	"long long unsigned int"
.LASF14:
	.string	"TASK_FUNC_TYPE"
.LASF6:
	.string	"unsigned char"
.LASF34:
	.string	"_Z11switch_taskv"
.LASF7:
	.string	"short unsigned int"
.LASF33:
	.string	"_Z15find_spare_taskv"
.LASF24:
	.string	"task_init"
.LASF21:
	.string	"task_start"
.LASF32:
	.string	"find_spare_task"
.LASF18:
	.string	"task_num"
.LASF2:
	.string	"unsigned int"
.LASF3:
	.string	"char"
.LASF29:
	.string	"get_page_start"
.LASF30:
	.string	"GNU C++17 12.2.0 -m32 -masm=intel -mtune=generic -march=pentiumpro -g -finline-functions -ffreestanding -fno-builtin -fno-pie -fno-stack-protector"
.LASF27:
	.string	"switch_task"
.LASF22:
	.string	"task_end"
.LASF5:
	.string	"long long int"
.LASF9:
	.string	"name"
.LASF4:
	.string	"short int"
.LASF17:
	.string	"cur_task"
.LASF23:
	.string	"task"
.LASF26:
	.string	"task_create"
.LASF13:
	.string	"frame"
.LASF28:
	.string	"next"
.LASF19:
	.string	"FREETASK_SIGN"
.LASF31:
	.string	"task_hang"
.LASF15:
	.string	"base_stack"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/dever/OSdevelop/workspace"
.LASF0:
	.string	"/home/dever/OSdevelop/workspace/lib/task.cpp"
	.ident	"GCC: (GNU) 12.2.0"
