	.file	"io.cpp"
	.intel_syntax noprefix
	.text
.Ltext0:
	.file 0 "/home/dever/OSdevelop/workspace" "/home/dever/OSdevelop/workspace/kernel/io.cpp"
	.globl	inb
	.type	inb, @function
inb:
.LFB16:
	.file 1 "/home/dever/OSdevelop/workspace/kernel/io.cpp"
	.loc 1 7 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 20
	mov	eax, DWORD PTR [ebp+8]
	mov	WORD PTR [ebp-20], ax
	.loc 1 9 5
	movzx	eax, WORD PTR [ebp-20]
/APP
/  9 "/home/dever/OSdevelop/workspace/kernel/io.cpp" 1
	mov ax, %dx
	in %dx, %al
/  0 "" 2
/NO_APP
	mov	BYTE PTR [ebp-1], al
	.loc 1 14 12
	movzx	eax, BYTE PTR [ebp-1]
	.loc 1 15 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	inb, .-inb
	.globl	inw
	.type	inw, @function
inw:
.LFB17:
	.loc 1 18 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 20
	mov	eax, DWORD PTR [ebp+8]
	mov	WORD PTR [ebp-20], ax
	.loc 1 20 5
	movzx	eax, WORD PTR [ebp-20]
/APP
/  20 "/home/dever/OSdevelop/workspace/kernel/io.cpp" 1
	mov ax, %dx
	in %dx, %ax
/  0 "" 2
/NO_APP
	mov	WORD PTR [ebp-2], ax
	.loc 1 25 12
	movzx	eax, WORD PTR [ebp-2]
	.loc 1 26 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	inw, .-inw
	.globl	outb
	.type	outb, @function
outb:
.LFB18:
	.loc 1 29 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp+12]
	mov	WORD PTR [ebp-4], dx
	mov	BYTE PTR [ebp-8], al
	.loc 1 30 5
	movzx	eax, WORD PTR [ebp-4]
	movzx	ecx, BYTE PTR [ebp-8]
/APP
/  30 "/home/dever/OSdevelop/workspace/kernel/io.cpp" 1
	mov ax, %dx
	mov cl, %al
	out %al, %dx
/  0 "" 2
	.loc 1 37 1
/NO_APP
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	outb, .-outb
	.globl	outw
	.type	outw, @function
outw:
.LFB19:
	.loc 1 40 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp+12]
	mov	WORD PTR [ebp-4], dx
	mov	WORD PTR [ebp-8], ax
	.loc 1 41 5
	movzx	eax, WORD PTR [ebp-4]
	movzx	ecx, WORD PTR [ebp-8]
/APP
/  41 "/home/dever/OSdevelop/workspace/kernel/io.cpp" 1
	mov ax, %dx
	mov cx, %ax
	out %ax, %dx
/  0 "" 2
	.loc 1 48 1
/NO_APP
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	outw, .-outw
.Letext0:
	.file 2 "/home/dever/OSdevelop/workspace/include/Gowinux/types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x13a
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0x6
	.long	.LASF14
	.byte	0x21
	.long	.LASF0
	.long	.LASF1
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
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
	.uleb128 0x7
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
	.string	"u8"
	.byte	0x33
	.long	0x49
	.uleb128 0x3
	.string	"u16"
	.byte	0x34
	.long	0x50
	.uleb128 0x4
	.long	.LASF11
	.byte	0x27
	.long	.LFB19
	.long	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xa2
	.uleb128 0x2
	.long	.LASF9
	.byte	0x27
	.byte	0xf
	.long	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2
	.long	.LASF10
	.byte	0x27
	.byte	0x19
	.long	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x4
	.long	.LASF12
	.byte	0x1c
	.long	.LFB18
	.long	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xd3
	.uleb128 0x2
	.long	.LASF9
	.byte	0x1c
	.byte	0xf
	.long	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2
	.long	.LASF10
	.byte	0x1c
	.byte	0x18
	.long	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x8
	.string	"inw"
	.byte	0x1
	.byte	0x11
	.byte	0x5
	.long	0x67
	.long	.LFB17
	.long	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x10a
	.uleb128 0x2
	.long	.LASF9
	.byte	0x11
	.byte	0xd
	.long	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x5
	.long	.LASF13
	.byte	0x13
	.byte	0x9
	.long	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x9
	.string	"inb"
	.byte	0x1
	.byte	0x6
	.byte	0x4
	.long	0x5e
	.long	.LFB16
	.long	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.long	.LASF9
	.byte	0x6
	.byte	0xc
	.long	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x5
	.long	.LASF13
	.byte	0x8
	.byte	0x8
	.long	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
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
	.uleb128 0x3
	.uleb128 0x16
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
	.sleb128 7
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
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
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
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
.LASF2:
	.string	"unsigned int"
.LASF13:
	.string	"content"
.LASF12:
	.string	"outb"
.LASF8:
	.string	"long long unsigned int"
.LASF9:
	.string	"port"
.LASF6:
	.string	"unsigned char"
.LASF3:
	.string	"char"
.LASF11:
	.string	"outw"
.LASF7:
	.string	"short unsigned int"
.LASF14:
	.string	"GNU C++17 12.2.0 -m32 -masm=intel -mtune=generic -march=pentiumpro -g -finline-functions -ffreestanding -fno-builtin -fno-pie -fno-stack-protector"
.LASF10:
	.string	"value"
.LASF4:
	.string	"short int"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"/home/dever/OSdevelop/workspace/kernel/io.cpp"
.LASF1:
	.string	"/home/dever/OSdevelop/workspace"
	.ident	"GCC: (GNU) 12.2.0"
