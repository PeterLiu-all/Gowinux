	.file	"log.cpp"
	.intel_syntax noprefix
	.text
.Ltext0:
	.file 0 "/home/dever/OSdevelop/workspace" "/home/dever/OSdevelop/workspace/lib/log.cpp"
	.section	.text.isbreak,"axG",@progbits,isbreak,comdat
	.weak	isbreak
	.type	isbreak, @function
isbreak:
.LFB15:
	.file 1 "/home/dever/OSdevelop/workspace/include/lib/string.h"
	.loc 1 38 30
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 4
	mov	eax, DWORD PTR [ebp+8]
	mov	BYTE PTR [ebp-4], al
	.loc 1 38 45
	cmp	BYTE PTR [ebp-4], 10
	sete	al
	.loc 1 38 51
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE15:
	.size	isbreak, .-isbreak
	.section	.rodata
	.align 4
.LC0:
	.string	"\n[%s] %s\tFrom ==> file: %s \n\tFrom ==> base: %s \n\tFrom ==> function: %s \n\tFrom ==> line: %u \n"
	.align 4
.LC1:
	.string	"\n[%s] %s\n\tFrom ==> file: %s \n\tFrom ==> base: %s \n\tFrom ==> function: %s \n\tFrom ==> line: %u \n"
	.text
	.globl	_normal_log
	.type	_normal_log, @function
_normal_log:
.LFB16:
	.file 2 "/home/dever/OSdevelop/workspace/lib/log.cpp"
	.loc 2 6 130
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 4
	.cfi_offset 3, -12
	.loc 2 7 17
	mov	ebx, DWORD PTR [ebp+12]
	.loc 2 7 31
	sub	esp, 12
	push	DWORD PTR [ebp+12]
	call	strlen
	add	esp, 16
	.loc 2 7 42
	sub	eax, 1
	add	eax, ebx
	movzx	eax, BYTE PTR [eax]
	.loc 2 7 16
	movsx	eax, al
	sub	esp, 12
	push	eax
	call	isbreak
	add	esp, 16
	.loc 2 7 5
	test	al, al
	je	.L4
	.loc 2 9 15
	sub	esp, 4
	push	DWORD PTR [ebp+28]
	push	DWORD PTR [ebp+24]
	push	DWORD PTR [ebp+20]
	push	DWORD PTR [ebp+16]
	push	DWORD PTR [ebp+12]
	push	DWORD PTR [ebp+8]
	push	OFFSET FLAT:.LC0
	call	printk
	add	esp, 32
	.loc 2 28 1
	jmp	.L6
.L4:
	.loc 2 19 15
	sub	esp, 4
	push	DWORD PTR [ebp+28]
	push	DWORD PTR [ebp+24]
	push	DWORD PTR [ebp+20]
	push	DWORD PTR [ebp+16]
	push	DWORD PTR [ebp+12]
	push	DWORD PTR [ebp+8]
	push	OFFSET FLAT:.LC1
	call	printk
	add	esp, 32
.L6:
	.loc 2 28 1
	nop
	mov	ebx, DWORD PTR [ebp-4]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	_normal_log, .-_normal_log
.Letext0:
	.file 3 "/home/dever/OSdevelop/workspace/include/lib/printk.h"
	.file 4 "/home/dever/OSdevelop/workspace/include/Gowinux/types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x134
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0x5
	.long	.LASF18
	.byte	0x21
	.long	.LASF0
	.long	.LASF1
	.long	.LLRL0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x6
	.long	0x26
	.uleb128 0x7
	.long	.LASF19
	.byte	0x4
	.byte	0x22
	.byte	0x7
	.long	0x3e
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF4
	.uleb128 0x8
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
	.uleb128 0x3
	.long	.LASF9
	.byte	0x3
	.byte	0x9
	.byte	0x5
	.long	0x4c
	.long	0x86
	.uleb128 0x4
	.long	0x86
	.uleb128 0x9
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x2d
	.uleb128 0x3
	.long	.LASF10
	.byte	0x1
	.byte	0xc
	.byte	0x8
	.long	0x32
	.long	0xa2
	.uleb128 0x4
	.long	0x86
	.byte	0
	.uleb128 0xb
	.long	.LASF20
	.byte	0x2
	.byte	0x6
	.byte	0x6
	.long	.LFB16
	.long	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x107
	.uleb128 0x2
	.long	.LASF11
	.byte	0x1e
	.long	0x86
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2
	.long	.LASF12
	.byte	0x31
	.long	0x86
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x2
	.long	.LASF13
	.byte	0x46
	.long	0x86
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2
	.long	.LASF14
	.byte	0x58
	.long	0x86
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x2
	.long	.LASF15
	.byte	0x6a
	.long	0x86
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x2
	.long	.LASF16
	.byte	0x7d
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 20
	.byte	0
	.uleb128 0xc
	.long	.LASF21
	.byte	0x1
	.byte	0x26
	.byte	0xd
	.long	0x130
	.long	.LFB15
	.long	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x130
	.uleb128 0xd
	.string	"ch"
	.byte	0x1
	.byte	0x26
	.byte	0x1a
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1
	.byte	0x1
	.byte	0x2
	.long	.LASF17
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.long	.LFB15
	.long	.LFE15-.LFB15
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
	.long	.LFB15
	.uleb128 .LFE15-.LFB15
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF5:
	.string	"long long int"
.LASF16:
	.string	"line"
.LASF19:
	.string	"size_t"
.LASF12:
	.string	"message"
.LASF21:
	.string	"isbreak"
.LASF11:
	.string	"level"
.LASF20:
	.string	"_normal_log"
.LASF8:
	.string	"long long unsigned int"
.LASF17:
	.string	"bool"
.LASF14:
	.string	"base"
.LASF6:
	.string	"unsigned char"
.LASF2:
	.string	"char"
.LASF13:
	.string	"file"
.LASF10:
	.string	"strlen"
.LASF7:
	.string	"short unsigned int"
.LASF18:
	.string	"GNU C++17 12.2.0 -m32 -masm=intel -mtune=generic -march=pentiumpro -g -finline-functions -ffreestanding -fno-builtin -fno-pie -fno-stack-protector"
.LASF9:
	.string	"printk"
.LASF15:
	.string	"func"
.LASF4:
	.string	"short int"
.LASF3:
	.string	"unsigned int"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/dever/OSdevelop/workspace"
.LASF0:
	.string	"/home/dever/OSdevelop/workspace/lib/log.cpp"
	.ident	"GCC: (GNU) 12.2.0"
