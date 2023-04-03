	.file	"printk.cpp"
	.intel_syntax noprefix
	.text
.Ltext0:
	.file 0 "/home/dever/OSdevelop/workspace" "/home/dever/OSdevelop/workspace/lib/printk.cpp"
	.local	_ZL3buf
	.comm	_ZL3buf,1024,32
	.globl	printk
	.type	printk, @function
printk:
.LFB0:
	.file 1 "/home/dever/OSdevelop/workspace/lib/printk.cpp"
	.loc 1 8 33
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 10 9
	mov	DWORD PTR [ebp-12], 0
	.loc 1 12 5
	lea	eax, [ebp+12]
	mov	DWORD PTR [ebp-16], eax
	.loc 1 14 19
	mov	eax, DWORD PTR [ebp+8]
	sub	esp, 4
	push	DWORD PTR [ebp-16]
	push	eax
	push	OFFSET FLAT:_ZL3buf
	call	vsprintf
	add	esp, 16
	mov	DWORD PTR [ebp-12], eax
	.loc 1 16 5
	mov	DWORD PTR [ebp-16], 0
	.loc 1 18 18
	mov	eax, DWORD PTR [ebp-12]
	sub	esp, 8
	push	eax
	push	OFFSET FLAT:_ZL3buf
	call	console_write
	add	esp, 16
	.loc 1 20 12
	mov	eax, DWORD PTR [ebp-12]
	.loc 1 21 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	printk, .-printk
.Letext0:
	.file 2 "/home/dever/OSdevelop/workspace/include/lib/stdarg.h"
	.file 3 "/home/dever/OSdevelop/workspace/include/Gowinux/types.h"
	.file 4 "/home/dever/OSdevelop/workspace/include/Gowinux/console.h"
	.file 5 "/home/dever/OSdevelop/workspace/include/lib/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x126
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0x5
	.long	.LASF12
	.byte	0x21
	.long	.LASF0
	.long	.LASF1
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x6
	.long	.LASF9
	.byte	0x2
	.byte	0x5
	.byte	0x7
	.long	0x32
	.uleb128 0x3
	.long	0x37
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x7
	.long	0x37
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
	.uleb128 0x9
	.string	"u32"
	.byte	0x3
	.byte	0x35
	.byte	0x7
	.long	0x43
	.uleb128 0xa
	.long	0x37
	.long	0x91
	.uleb128 0xb
	.long	0x91
	.value	0x3ff
	.byte	0
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF10
	.uleb128 0x4
	.string	"buf"
	.byte	0x5
	.byte	0xd
	.long	0x80
	.uleb128 0x5
	.byte	0x3
	.long	_ZL3buf
	.uleb128 0xc
	.long	.LASF13
	.byte	0x4
	.byte	0xf
	.byte	0x6
	.long	0xc0
	.uleb128 0x2
	.long	0x32
	.uleb128 0x2
	.long	0x74
	.byte	0
	.uleb128 0xd
	.long	.LASF14
	.byte	0x5
	.byte	0x9
	.byte	0x5
	.long	0x51
	.long	0xe0
	.uleb128 0x2
	.long	0x32
	.uleb128 0x2
	.long	0xe0
	.uleb128 0x2
	.long	0x26
	.byte	0
	.uleb128 0x3
	.long	0x3e
	.uleb128 0xe
	.long	.LASF15
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.long	0x51
	.long	.LFB0
	.long	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.string	"fmt"
	.byte	0x1
	.byte	0x8
	.byte	0x18
	.long	0xe0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x11
	.long	.LASF11
	.byte	0x1
	.byte	0x9
	.byte	0xd
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.string	"cnt"
	.byte	0xa
	.byte	0x9
	.long	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
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
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
	.uleb128 0x3c
	.uleb128 0x19
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
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
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
	.uleb128 0x2
	.uleb128 0x18
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
.LASF5:
	.string	"long long int"
.LASF3:
	.string	"unsigned int"
.LASF10:
	.string	"long unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF14:
	.string	"vsprintf"
.LASF6:
	.string	"unsigned char"
.LASF2:
	.string	"char"
.LASF9:
	.string	"va_list"
.LASF7:
	.string	"short unsigned int"
.LASF12:
	.string	"GNU C++17 12.2.0 -m32 -masm=intel -mtune=generic -march=pentiumpro -g -finline-functions -ffreestanding -fno-builtin -fno-pie -fno-stack-protector"
.LASF13:
	.string	"console_write"
.LASF15:
	.string	"printk"
.LASF4:
	.string	"short int"
.LASF11:
	.string	"args"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"/home/dever/OSdevelop/workspace/lib/printk.cpp"
.LASF1:
	.string	"/home/dever/OSdevelop/workspace"
	.ident	"GCC: (GNU) 12.2.0"
