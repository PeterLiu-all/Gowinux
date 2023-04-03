	.file	"assert.cpp"
	.intel_syntax noprefix
	.text
.Ltext0:
	.file 0 "/home/dever/OSdevelop/workspace" "/home/dever/OSdevelop/workspace/lib/assert.cpp"
	.local	_ZL3buf
	.comm	_ZL3buf,1024,32
	.section	.rodata
.LC0:
	.string	"\n[X] spinning in [ %s ] ...\n"
	.text
	.type	spin, @function
spin:
.LFB0:
	.file 1 "/home/dever/OSdevelop/workspace/lib/assert.cpp"
	.loc 1 11 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	.loc 1 12 11
	sub	esp, 8
	push	DWORD PTR [ebp+8]
	push	OFFSET FLAT:.LC0
	call	printk
	add	esp, 16
.L2:
	.loc 1 28 9 discriminator 1
/APP
/  28 "/home/dever/OSdevelop/workspace/lib/assert.cpp" 1
	hlt
	pause
	
/  0 "" 2
/NO_APP
	jmp	.L2
	.cfi_endproc
.LFE0:
	.size	spin, .-spin
	.section	.rodata
	.align 4
.LC1:
	.string	"\n--> assert expression((%s) == false) failed!\n--> file: %s \n--> base: %s \n--> function: %s \n--> line: %u \n"
	.align 4
.LC2:
	.string	"void assert_failed(const char*, const char*, const char*, const char*, unsigned int)"
	.text
	.globl	assert_failed
	.type	assert_failed, @function
assert_failed:
.LFB1:
	.loc 1 41 109
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	.loc 1 42 11
	sub	esp, 8
	push	DWORD PTR [ebp+24]
	push	DWORD PTR [ebp+20]
	push	DWORD PTR [ebp+16]
	push	DWORD PTR [ebp+12]
	push	DWORD PTR [ebp+8]
	push	OFFSET FLAT:.LC1
	call	printk
	add	esp, 32
	.loc 1 49 9
	sub	esp, 12
	push	OFFSET FLAT:.LC2
	call	spin
	add	esp, 16
	.loc 1 50 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	assert_failed, .-assert_failed
	.section	.rodata
.LC3:
	.string	"\n[X] PANIC NOW !!!\n--> %s \n"
.LC4:
	.string	"void panic(const char*, ...)"
	.text
	.globl	panic
	.type	panic, @function
panic:
.LFB2:
	.loc 1 52 33
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 54 5
	lea	eax, [ebp+12]
	mov	DWORD PTR [ebp-12], eax
	.loc 1 55 21
	mov	eax, DWORD PTR [ebp+8]
	sub	esp, 4
	push	DWORD PTR [ebp-12]
	push	eax
	push	OFFSET FLAT:_ZL3buf
	call	vsprintf
	add	esp, 16
	mov	DWORD PTR [ebp-16], eax
	.loc 1 56 5
	mov	DWORD PTR [ebp-12], 0
	.loc 1 57 11
	sub	esp, 8
	push	OFFSET FLAT:_ZL3buf
	push	OFFSET FLAT:.LC3
	call	printk
	add	esp, 16
	.loc 1 58 9
	sub	esp, 12
	push	OFFSET FLAT:.LC4
	call	spin
	add	esp, 16
	.loc 1 59 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	panic, .-panic
.Letext0:
	.file 2 "/home/dever/OSdevelop/workspace/include/lib/stdio.h"
	.file 3 "/home/dever/OSdevelop/workspace/include/lib/printk.h"
	.file 4 "/home/dever/OSdevelop/workspace/include/lib/stdarg.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1b2
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0xe
	.long	.LASF16
	.byte	0x21
	.long	.LASF0
	.long	.LASF1
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0xf
	.long	.LASF17
	.byte	0x4
	.byte	0x5
	.byte	0x7
	.long	0x32
	.uleb128 0x6
	.long	0x37
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x4
	.long	0x37
	.uleb128 0x5
	.long	0x37
	.long	0x54
	.uleb128 0x10
	.long	0x54
	.value	0x3ff
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x7
	.string	"buf"
	.byte	0x6
	.byte	0xd
	.long	0x43
	.uleb128 0x5
	.byte	0x3
	.long	_ZL3buf
	.uleb128 0x8
	.long	.LASF4
	.byte	0x2
	.long	0x8a
	.long	0x8a
	.uleb128 0x2
	.long	0x32
	.uleb128 0x2
	.long	0x91
	.uleb128 0x2
	.long	0x26
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.long	0x3e
	.uleb128 0x8
	.long	.LASF5
	.byte	0x3
	.long	0x8a
	.long	0xab
	.uleb128 0x2
	.long	0x91
	.uleb128 0x9
	.byte	0
	.uleb128 0xa
	.long	.LASF7
	.byte	0x34
	.long	.LFB2
	.long	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0xf9
	.uleb128 0xb
	.string	"fmt"
	.byte	0x34
	.byte	0x18
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x9
	.uleb128 0x12
	.long	.LASF6
	.byte	0x1
	.byte	0x35
	.byte	0xd
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x7
	.string	"i"
	.byte	0x37
	.byte	0x9
	.long	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF13
	.long	0x109
	.uleb128 0x5
	.byte	0x3
	.long	.LC4
	.byte	0
	.uleb128 0x5
	.long	0x3e
	.long	0x109
	.uleb128 0xd
	.long	0x54
	.byte	0x1c
	.byte	0
	.uleb128 0x4
	.long	0xf9
	.uleb128 0xa
	.long	.LASF8
	.byte	0x29
	.long	.LFB1
	.long	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x178
	.uleb128 0xb
	.string	"exp"
	.byte	0x29
	.byte	0x20
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1
	.long	.LASF9
	.byte	0x29
	.byte	0x31
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1
	.long	.LASF10
	.byte	0x29
	.byte	0x43
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1
	.long	.LASF11
	.byte	0x29
	.byte	0x55
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1
	.long	.LASF12
	.byte	0x29
	.byte	0x68
	.long	0x178
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xc
	.long	.LASF13
	.long	0x18f
	.uleb128 0x5
	.byte	0x3
	.long	.LC2
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF14
	.uleb128 0x5
	.long	0x3e
	.long	0x18f
	.uleb128 0xd
	.long	0x54
	.byte	0x54
	.byte	0
	.uleb128 0x4
	.long	0x17f
	.uleb128 0x13
	.long	.LASF18
	.byte	0x1
	.byte	0xa
	.byte	0xd
	.long	.LFB0
	.long	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1
	.long	.LASF15
	.byte	0xa
	.byte	0x1e
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
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
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x6c
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
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
.LASF6:
	.string	"args"
.LASF7:
	.string	"panic"
.LASF11:
	.string	"func"
.LASF3:
	.string	"long unsigned int"
.LASF9:
	.string	"file"
.LASF14:
	.string	"unsigned int"
.LASF17:
	.string	"va_list"
.LASF13:
	.string	"__PRETTY_FUNCTION__"
.LASF16:
	.string	"GNU C++17 12.2.0 -m32 -masm=intel -mtune=generic -march=pentiumpro -g -finline-functions -ffreestanding -fno-builtin -fno-pie -fno-stack-protector"
.LASF8:
	.string	"assert_failed"
.LASF12:
	.string	"line"
.LASF10:
	.string	"base"
.LASF18:
	.string	"spin"
.LASF5:
	.string	"printk"
.LASF2:
	.string	"char"
.LASF4:
	.string	"vsprintf"
.LASF15:
	.string	"name"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"/home/dever/OSdevelop/workspace/lib/assert.cpp"
.LASF1:
	.string	"/home/dever/OSdevelop/workspace"
	.ident	"GCC: (GNU) 12.2.0"
