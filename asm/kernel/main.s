	.file	"main.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/dever/OSdevelop/workspace" "/home/dever/OSdevelop/workspace/kernel/main.c"
	.data
	.align 4
	.type	message, @object
	.size	message, 18
message:
	.string	"Hello,\t\013Gowinux!\n"
	.local	buf
	.comm	buf,1024,32
	.align 4
	.type	cnta, @object
	.size	cnta, 4
cnta:
	.long	1
	.align 4
	.type	cntb, @object
	.size	cntb, 4
cntb:
	.long	1
	.section	.rodata
.LC0:
	.string	"A"
	.text
	.globl	task_a
	.type	task_a, @function
task_a:
.LFB0:
	.file 1 "/home/dever/OSdevelop/workspace/kernel/main.c"
	.loc 1 21 14
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	.loc 1 23 5
	sub	esp, 12
	push	OFFSET FLAT:.LC0
	call	printk
	add	esp, 16
	.loc 1 24 13
	mov	eax, DWORD PTR cnta
	lea	edx, [eax-1]
	mov	DWORD PTR cnta, edx
	.loc 1 24 8
	test	eax, eax
	je	.L3
	.loc 1 26 9
	call	task_hang
.L3:
	.loc 1 29 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	task_a, .-task_a
	.section	.rodata
.LC1:
	.string	"B"
	.text
	.globl	task_b
	.type	task_b, @function
task_b:
.LFB1:
	.loc 1 31 14
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	.loc 1 33 5
	sub	esp, 12
	push	OFFSET FLAT:.LC1
	call	printk
	add	esp, 16
	.loc 1 34 13
	mov	eax, DWORD PTR cntb
	lea	edx, [eax-1]
	mov	DWORD PTR cntb, edx
	.loc 1 34 8
	test	eax, eax
	je	.L6
	.loc 1 36 9
	call	task_hang
.L6:
	.loc 1 38 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	task_b, .-task_b
	.section	.rodata
.LC2:
	.string	"I'm back!\n"
	.text
	.globl	kernel_init
	.type	kernel_init, @function
kernel_init:
.LFB2:
	.loc 1 41 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 42 12
	mov	DWORD PTR [ebp-12], 0
	.loc 1 43 5
	call	console_init
	.loc 1 44 5
	call	gdt_init
	.loc 1 45 5
	call	task_init
	.loc 1 46 5
	sub	esp, 12
	push	7
	call	set_style
	add	esp, 16
	.loc 1 52 19
	mov	ecx, OFFSET FLAT:task_a
	mov	edx, OFFSET FLAT:.LC0
	lea	eax, [ebp-16]
	push	0
	push	0
	push	0
	push	0
	push	ecx
	push	273
	push	edx
	push	eax
	call	task_create
	add	esp, 28
	.loc 1 53 19
	mov	ecx, OFFSET FLAT:task_b
	mov	edx, OFFSET FLAT:.LC1
	lea	eax, [ebp-20]
	push	0
	push	0
	push	0
	push	0
	push	ecx
	push	273
	push	edx
	push	eax
	call	task_create
	add	esp, 28
	.loc 1 54 5
	sub	esp, 12
	lea	eax, [ebp-16]
	push	eax
	call	task_start
	add	esp, 16
	.loc 1 55 5
	sub	esp, 12
	lea	eax, [ebp-16]
	push	eax
	call	task_end
	add	esp, 16
	.loc 1 56 5
	sub	esp, 12
	lea	eax, [ebp-20]
	push	eax
	call	task_end
	add	esp, 16
	.loc 1 57 5
	sub	esp, 12
	push	OFFSET FLAT:.LC2
	call	printk
	add	esp, 16
	.loc 1 58 5
	nop
	.loc 1 59 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	kernel_init, .-kernel_init
.Letext0:
	.file 2 "/home/dever/OSdevelop/workspace/include/lib/task.h"
	.file 3 "/home/dever/OSdevelop/workspace/include/Gowinux/types.h"
	.file 4 "/home/dever/OSdevelop/workspace/include/Gowinux/console.h"
	.file 5 "/home/dever/OSdevelop/workspace/include/Gowinux/gdt.h"
	.file 6 "/home/dever/OSdevelop/workspace/include/lib/printk.h"
	.file 7 "/home/dever/OSdevelop/workspace/include/lib/colors.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x381
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0xf
	.long	.LASF63
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x8
	.long	.LASF9
	.byte	0x3
	.byte	0x38
	.byte	0x16
	.long	0x32
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF3
	.uleb128 0x10
	.long	0x39
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF4
	.uleb128 0x11
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x12
	.string	"u32"
	.byte	0x3
	.byte	0x4a
	.byte	0x16
	.long	0x32
	.uleb128 0x13
	.long	.LASF64
	.byte	0x7
	.byte	0x4
	.long	0x32
	.byte	0x7
	.byte	0x50
	.byte	0x6
	.long	0x14e
	.uleb128 0x1
	.long	.LASF10
	.byte	0
	.uleb128 0x1
	.long	.LASF11
	.byte	0x1
	.uleb128 0x1
	.long	.LASF12
	.byte	0x2
	.uleb128 0x1
	.long	.LASF13
	.byte	0x3
	.uleb128 0x14
	.string	"RED"
	.byte	0x4
	.uleb128 0x1
	.long	.LASF14
	.byte	0x5
	.uleb128 0x1
	.long	.LASF15
	.byte	0x6
	.uleb128 0x1
	.long	.LASF16
	.byte	0x7
	.uleb128 0x1
	.long	.LASF17
	.byte	0x8
	.uleb128 0x1
	.long	.LASF18
	.byte	0x9
	.uleb128 0x1
	.long	.LASF19
	.byte	0xa
	.uleb128 0x1
	.long	.LASF20
	.byte	0xb
	.uleb128 0x1
	.long	.LASF21
	.byte	0xc
	.uleb128 0x1
	.long	.LASF22
	.byte	0xd
	.uleb128 0x1
	.long	.LASF23
	.byte	0xe
	.uleb128 0x1
	.long	.LASF24
	.byte	0xf
	.uleb128 0x1
	.long	.LASF25
	.byte	0
	.uleb128 0x1
	.long	.LASF26
	.byte	0x10
	.uleb128 0x1
	.long	.LASF27
	.byte	0x20
	.uleb128 0x1
	.long	.LASF28
	.byte	0x30
	.uleb128 0x1
	.long	.LASF29
	.byte	0x40
	.uleb128 0x1
	.long	.LASF30
	.byte	0x50
	.uleb128 0x1
	.long	.LASF31
	.byte	0x60
	.uleb128 0x1
	.long	.LASF32
	.byte	0x70
	.uleb128 0x1
	.long	.LASF33
	.byte	0x80
	.uleb128 0x1
	.long	.LASF34
	.byte	0x90
	.uleb128 0x1
	.long	.LASF35
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF36
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF37
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF38
	.byte	0xd0
	.uleb128 0x1
	.long	.LASF39
	.byte	0xe0
	.uleb128 0x1
	.long	.LASF40
	.byte	0xf0
	.byte	0
	.uleb128 0xb
	.long	.LASF42
	.byte	0x1c
	.byte	0xe
	.long	0x1a9
	.uleb128 0x15
	.long	.LASF41
	.byte	0x2
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
	.byte	0x12
	.long	0x26
	.byte	0xc
	.uleb128 0x4
	.string	"esi"
	.byte	0x13
	.long	0x26
	.byte	0x10
	.uleb128 0x4
	.string	"edx"
	.byte	0x14
	.long	0x26
	.byte	0x14
	.uleb128 0x4
	.string	"ecx"
	.byte	0x15
	.long	0x26
	.byte	0x18
	.byte	0
	.uleb128 0x8
	.long	.LASF42
	.byte	0x2
	.byte	0x16
	.byte	0x2
	.long	0x14e
	.uleb128 0x16
	.byte	0x4
	.byte	0x2
	.byte	0x1a
	.byte	0x5
	.long	0x1d7
	.uleb128 0x17
	.string	"esp"
	.byte	0x2
	.byte	0x1b
	.byte	0x10
	.long	0x26
	.uleb128 0x18
	.long	.LASF43
	.byte	0x2
	.byte	0x1c
	.byte	0x17
	.long	0x1d7
	.byte	0
	.uleb128 0x9
	.long	0x1a9
	.uleb128 0xb
	.long	.LASF44
	.byte	0x4
	.byte	0x18
	.long	0x1ee
	.uleb128 0x19
	.long	0x1b5
	.byte	0
	.byte	0
	.uleb128 0x8
	.long	.LASF44
	.byte	0x2
	.byte	0x1e
	.byte	0x2
	.long	0x1dc
	.uleb128 0xc
	.long	0x39
	.long	0x20a
	.uleb128 0x1a
	.long	0x20a
	.byte	0x11
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF45
	.uleb128 0x5
	.long	.LASF46
	.byte	0xf
	.byte	0xd
	.long	0x1fa
	.uleb128 0x5
	.byte	0x3
	.long	message
	.uleb128 0xc
	.long	0x39
	.long	0x233
	.uleb128 0x1b
	.long	0x20a
	.value	0x3ff
	.byte	0
	.uleb128 0x1c
	.string	"buf"
	.byte	0x1
	.byte	0x10
	.byte	0xd
	.long	0x222
	.uleb128 0x5
	.byte	0x3
	.long	buf
	.uleb128 0x5
	.long	.LASF47
	.byte	0x11
	.byte	0xf
	.long	0x26
	.uleb128 0x5
	.byte	0x3
	.long	cnta
	.uleb128 0x5
	.long	.LASF48
	.byte	0x12
	.byte	0xf
	.long	0x26
	.uleb128 0x5
	.byte	0x3
	.long	cntb
	.uleb128 0xa
	.long	.LASF49
	.byte	0x2
	.byte	0x2d
	.long	0x278
	.uleb128 0x2
	.long	0x278
	.byte	0
	.uleb128 0x9
	.long	0x1ee
	.uleb128 0xa
	.long	.LASF50
	.byte	0x2
	.byte	0x2e
	.long	0x28e
	.uleb128 0x2
	.long	0x278
	.byte	0
	.uleb128 0xd
	.long	.LASF56
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.long	0x1ee
	.long	0x2c2
	.uleb128 0x2
	.long	0x26
	.uleb128 0x2
	.long	0x26
	.uleb128 0x2
	.long	0x26
	.uleb128 0x2
	.long	0x26
	.uleb128 0x2
	.long	0x26
	.uleb128 0x2
	.long	0x26
	.uleb128 0x2
	.long	0x26
	.byte	0
	.uleb128 0xa
	.long	.LASF51
	.byte	0x4
	.byte	0x10
	.long	0x2d3
	.uleb128 0x2
	.long	0x6f
	.byte	0
	.uleb128 0x7
	.long	.LASF52
	.byte	0x2
	.byte	0x21
	.long	0x2e0
	.uleb128 0x6
	.byte	0
	.uleb128 0x7
	.long	.LASF53
	.byte	0x5
	.byte	0x9
	.long	0x2ed
	.uleb128 0x6
	.byte	0
	.uleb128 0x7
	.long	.LASF54
	.byte	0x4
	.byte	0xd
	.long	0x2fa
	.uleb128 0x6
	.byte	0
	.uleb128 0x7
	.long	.LASF55
	.byte	0x2
	.byte	0x2b
	.long	0x307
	.uleb128 0x6
	.byte	0
	.uleb128 0xd
	.long	.LASF57
	.byte	0x6
	.byte	0x9
	.byte	0x5
	.long	0x4c
	.long	0x31e
	.uleb128 0x2
	.long	0x31e
	.uleb128 0x6
	.byte	0
	.uleb128 0x9
	.long	0x40
	.uleb128 0x1d
	.long	.LASF65
	.byte	0x1
	.byte	0x28
	.byte	0x6
	.long	.LFB2
	.long	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x364
	.uleb128 0x5
	.long	.LASF58
	.byte	0x2a
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x5
	.long	.LASF59
	.byte	0x34
	.byte	0xc
	.long	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x5
	.long	.LASF60
	.byte	0x35
	.byte	0xc
	.long	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xe
	.long	.LASF61
	.byte	0x1f
	.long	.LFB1
	.long	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.long	.LASF62
	.byte	0x15
	.long	.LFB0
	.long	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x6
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
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
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x16
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
	.uleb128 0x13
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
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
	.uleb128 0x1d
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
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF46:
	.string	"message"
.LASF25:
	.string	"BLACK_BACK"
.LASF28:
	.string	"CYAN_BACK"
.LASF9:
	.string	"size_t"
.LASF61:
	.string	"task_b"
.LASF38:
	.string	"BRIGHT_PURPLE_BACK"
.LASF35:
	.string	"BRIGHT_GREEN_BACK"
.LASF60:
	.string	"tsk2"
.LASF42:
	.string	"task_frame_t"
.LASF36:
	.string	"BRIGHT_CYAN_BACK"
.LASF52:
	.string	"task_init"
.LASF19:
	.string	"BRIGHT_GREEN"
.LASF24:
	.string	"BRIGHT_WHITE"
.LASF31:
	.string	"ORANGE_BACK"
.LASF40:
	.string	"BRIGHT_WHITE_BACK"
.LASF34:
	.string	"BRIGHT_BLUE_BACK"
.LASF11:
	.string	"BLUE"
.LASF53:
	.string	"gdt_init"
.LASF39:
	.string	"BRIGHT_ORANGE_BACK"
.LASF44:
	.string	"task_t"
.LASF18:
	.string	"BRIGHT_BLUE"
.LASF8:
	.string	"long long unsigned int"
.LASF65:
	.string	"kernel_init"
.LASF6:
	.string	"unsigned char"
.LASF29:
	.string	"RED_BACK"
.LASF45:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF37:
	.string	"BRIGHT_RED_BACK"
.LASF41:
	.string	"name"
.LASF13:
	.string	"CYAN"
.LASF54:
	.string	"console_init"
.LASF23:
	.string	"BRIGHT_ORANGE"
.LASF20:
	.string	"BRIGHT_CYAN"
.LASF32:
	.string	"WHITE_BACK"
.LASF27:
	.string	"GREEN_BACK"
.LASF22:
	.string	"BRIGHT_PURPLE"
.LASF47:
	.string	"cnta"
.LASF12:
	.string	"GREEN"
.LASF16:
	.string	"WHITE"
.LASF2:
	.string	"unsigned int"
.LASF48:
	.string	"cntb"
.LASF10:
	.string	"BLACK"
.LASF63:
	.string	"GNU C11 12.2.0 -m32 -masm=intel -mtune=generic -march=pentiumpro -g -std=c11 -finline-functions -ffreestanding -fno-builtin -fno-pie -fno-stack-protector"
.LASF30:
	.string	"PURPLE_BACK"
.LASF59:
	.string	"tsk1"
.LASF64:
	.string	"COLOR"
.LASF51:
	.string	"set_style"
.LASF5:
	.string	"long long int"
.LASF49:
	.string	"task_end"
.LASF3:
	.string	"char"
.LASF21:
	.string	"BRIGHT_RED"
.LASF4:
	.string	"short int"
.LASF57:
	.string	"printk"
.LASF33:
	.string	"GRAY_BACK"
.LASF58:
	.string	"store"
.LASF56:
	.string	"task_create"
.LASF50:
	.string	"task_start"
.LASF43:
	.string	"frame"
.LASF62:
	.string	"task_a"
.LASF15:
	.string	"ORANGE"
.LASF17:
	.string	"GRAY"
.LASF14:
	.string	"PURPLE"
.LASF26:
	.string	"BLUE_BACK"
.LASF55:
	.string	"task_hang"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"/home/dever/OSdevelop/workspace/kernel/main.c"
.LASF1:
	.string	"/home/dever/OSdevelop/workspace"
	.ident	"GCC: (GNU) 12.2.0"
