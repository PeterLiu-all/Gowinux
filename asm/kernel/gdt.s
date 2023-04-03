	.file	"gdt.cpp"
	.intel_syntax noprefix
	.text
.Ltext0:
	.file 0 "/home/dever/OSdevelop/workspace" "/home/dever/OSdevelop/workspace/kernel/gdt.cpp"
	.section	.rodata
	.type	_ZN12_GLOBAL__N_1L8GDT_SIZEE, @object
	.size	_ZN12_GLOBAL__N_1L8GDT_SIZEE, 1
_ZN12_GLOBAL__N_1L8GDT_SIZEE:
	.byte	-128
	.type	_ZN12_GLOBAL__N_1L15KERNEL_CODE_IDXE, @object
	.size	_ZN12_GLOBAL__N_1L15KERNEL_CODE_IDXE, 1
_ZN12_GLOBAL__N_1L15KERNEL_CODE_IDXE:
	.byte	1
	.type	_ZN12_GLOBAL__N_1L15KERNEL_DATA_IDXE, @object
	.size	_ZN12_GLOBAL__N_1L15KERNEL_DATA_IDXE, 1
_ZN12_GLOBAL__N_1L15KERNEL_DATA_IDXE:
	.byte	2
	.type	_ZN12_GLOBAL__N_1L14KERNEL_TSS_IDXE, @object
	.size	_ZN12_GLOBAL__N_1L14KERNEL_TSS_IDXE, 1
_ZN12_GLOBAL__N_1L14KERNEL_TSS_IDXE:
	.byte	3
	.type	_ZN12_GLOBAL__N_1L13USER_CODE_IDXE, @object
	.size	_ZN12_GLOBAL__N_1L13USER_CODE_IDXE, 1
_ZN12_GLOBAL__N_1L13USER_CODE_IDXE:
	.byte	4
	.type	_ZN12_GLOBAL__N_1L13USER_DATA_IDXE, @object
	.size	_ZN12_GLOBAL__N_1L13USER_DATA_IDXE, 1
_ZN12_GLOBAL__N_1L13USER_DATA_IDXE:
	.byte	5
	.type	_ZN12_GLOBAL__N_1L20KERNEL_CODE_SELECTORE, @object
	.size	_ZN12_GLOBAL__N_1L20KERNEL_CODE_SELECTORE, 1
_ZN12_GLOBAL__N_1L20KERNEL_CODE_SELECTORE:
	.byte	8
	.type	_ZN12_GLOBAL__N_1L20KERNEL_DATA_SELECTORE, @object
	.size	_ZN12_GLOBAL__N_1L20KERNEL_DATA_SELECTORE, 1
_ZN12_GLOBAL__N_1L20KERNEL_DATA_SELECTORE:
	.byte	16
	.type	_ZN12_GLOBAL__N_1L19KERNEL_TSS_SELECTORE, @object
	.size	_ZN12_GLOBAL__N_1L19KERNEL_TSS_SELECTORE, 1
_ZN12_GLOBAL__N_1L19KERNEL_TSS_SELECTORE:
	.byte	24
	.type	_ZN12_GLOBAL__N_1L18USER_CODE_SELECTORE, @object
	.size	_ZN12_GLOBAL__N_1L18USER_CODE_SELECTORE, 1
_ZN12_GLOBAL__N_1L18USER_CODE_SELECTORE:
	.byte	35
	.type	_ZN12_GLOBAL__N_1L18USER_DATA_SELECTORE, @object
	.size	_ZN12_GLOBAL__N_1L18USER_DATA_SELECTORE, 1
_ZN12_GLOBAL__N_1L18USER_DATA_SELECTORE:
	.byte	43
	.local	_ZN12_GLOBAL__N_1L3gdtE
	.comm	_ZN12_GLOBAL__N_1L3gdtE,1138,32
	.align 4
.LC0:
	.string	"void {anonymous}::GlogalDescriptorTable::descriptor_init({anonymous}::descriptor_t*, u32, u32)"
	.align 4
.LC1:
	.string	"/home/dever/OSdevelop/workspace/kernel/gdt.cpp"
.LC2:
	.string	"init single Descriptor\n"
.LC3:
	.string	"DEBUG"
	.text
	.align 2
	.type	_ZN12_GLOBAL__N_121GlogalDescriptorTable15descriptor_initEPNS_12descriptor_tEjj, @function
_ZN12_GLOBAL__N_121GlogalDescriptorTable15descriptor_initEPNS_12descriptor_tEjj:
.LFB16:
	.file 1 "/home/dever/OSdevelop/workspace/kernel/gdt.cpp"
	.loc 1 104 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 4
	.cfi_offset 3, -12
	.loc 1 105 5
	sub	esp, 8
	push	105
	push	OFFSET FLAT:.LC0
	push	OFFSET FLAT:.LC1
	push	OFFSET FLAT:.LC1
	push	OFFSET FLAT:.LC2
	push	OFFSET FLAT:.LC3
	call	_normal_log
	add	esp, 32
	.loc 1 106 27
	mov	eax, DWORD PTR [ebp+16]
	and	eax, 16777215
	mov	edx, eax
	.loc 1 106 20
	mov	eax, DWORD PTR [ebp+12]
	movzx	ebx, dl
	movzx	ecx, BYTE PTR [eax+2]
	and	ecx, 0
	or	ecx, ebx
	mov	BYTE PTR [eax+2], cl
	mov	ecx, edx
	shr	ecx, 8
	movzx	ebx, cl
	movzx	ecx, BYTE PTR [eax+3]
	and	ecx, 0
	or	ecx, ebx
	mov	BYTE PTR [eax+3], cl
	shr	edx, 16
	movzx	ecx, dl
	movzx	edx, BYTE PTR [eax+4]
	and	edx, 0
	or	edx, ecx
	mov	BYTE PTR [eax+4], dl
	.loc 1 107 29
	mov	eax, DWORD PTR [ebp+16]
	shr	eax, 24
	.loc 1 107 21
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+12]
	mov	BYTE PTR [eax+7], dl
	.loc 1 108 21
	mov	eax, DWORD PTR [ebp+20]
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+12]
	mov	WORD PTR [eax], dx
	.loc 1 109 31
	mov	eax, DWORD PTR [ebp+20]
	shr	eax, 16
	.loc 1 109 22
	and	eax, 15
	mov	edx, DWORD PTR [ebp+12]
	and	eax, 15
	mov	ecx, eax
	movzx	eax, BYTE PTR [edx+6]
	and	eax, -16
	or	eax, ecx
	mov	BYTE PTR [edx+6], al
	.loc 1 110 1
	nop
	mov	ebx, DWORD PTR [ebp-4]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	_ZN12_GLOBAL__N_121GlogalDescriptorTable15descriptor_initEPNS_12descriptor_tEjj, .-_ZN12_GLOBAL__N_121GlogalDescriptorTable15descriptor_initEPNS_12descriptor_tEjj
	.section	.rodata
	.align 4
.LC4:
	.string	"void {anonymous}::GlogalDescriptorTable::gdt_init()"
	.align 4
.LC5:
	.string	"init Glogal Descriptor Table...\n"
	.text
	.align 2
	.type	_ZN12_GLOBAL__N_121GlogalDescriptorTable8gdt_initEv, @function
_ZN12_GLOBAL__N_121GlogalDescriptorTable8gdt_initEv:
.LFB17:
	.loc 1 114 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 115 5
	sub	esp, 8
	push	115
	push	OFFSET FLAT:.LC4
	push	OFFSET FLAT:.LC1
	push	OFFSET FLAT:.LC1
	push	OFFSET FLAT:.LC5
	push	OFFSET FLAT:.LC3
	call	_normal_log
	add	esp, 32
	.loc 1 116 18
	mov	eax, DWORD PTR [ebp+8]
	.loc 1 116 11
	sub	esp, 4
	push	1024
	push	0
	push	eax
	call	memset
	add	esp, 16
	.loc 1 119 18
	mov	eax, DWORD PTR [ebp+8]
	.loc 1 119 10
	add	eax, 8
	mov	DWORD PTR [ebp-12], eax
	.loc 1 120 20
	push	1048575
	push	0
	push	DWORD PTR [ebp-12]
	push	DWORD PTR [ebp+8]
	call	_ZN12_GLOBAL__N_121GlogalDescriptorTable15descriptor_initEPNS_12descriptor_tEjj
	add	esp, 16
	.loc 1 121 19
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	or	edx, 16
	mov	BYTE PTR [eax+5], dl
	.loc 1 122 23
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	or	edx, -128
	mov	BYTE PTR [eax+6], dl
	.loc 1 123 15
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	or	edx, 64
	mov	BYTE PTR [eax+6], dl
	.loc 1 124 21
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	and	edx, -33
	mov	BYTE PTR [eax+6], dl
	.loc 1 125 19
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	.loc 1 126 15
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	.loc 1 127 16
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 10
	mov	BYTE PTR [eax+5], dl
	.loc 1 129 18
	mov	eax, DWORD PTR [ebp+8]
	.loc 1 129 10
	add	eax, 16
	mov	DWORD PTR [ebp-12], eax
	.loc 1 130 20
	push	1048575
	push	0
	push	DWORD PTR [ebp-12]
	push	DWORD PTR [ebp+8]
	call	_ZN12_GLOBAL__N_121GlogalDescriptorTable15descriptor_initEPNS_12descriptor_tEjj
	add	esp, 16
	.loc 1 131 19
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	or	edx, 16
	mov	BYTE PTR [eax+5], dl
	.loc 1 132 23
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	or	edx, -128
	mov	BYTE PTR [eax+6], dl
	.loc 1 133 15
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	or	edx, 64
	mov	BYTE PTR [eax+6], dl
	.loc 1 134 21
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	and	edx, -33
	mov	BYTE PTR [eax+6], dl
	.loc 1 135 19
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	.loc 1 136 15
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	.loc 1 137 16
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 2
	mov	BYTE PTR [eax+5], dl
	.loc 1 139 18
	mov	eax, DWORD PTR [ebp+8]
	.loc 1 139 10
	add	eax, 32
	mov	DWORD PTR [ebp-12], eax
	.loc 1 140 20
	push	1048575
	push	0
	push	DWORD PTR [ebp-12]
	push	DWORD PTR [ebp+8]
	call	_ZN12_GLOBAL__N_121GlogalDescriptorTable15descriptor_initEPNS_12descriptor_tEjj
	add	esp, 16
	.loc 1 141 19
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	or	edx, 16
	mov	BYTE PTR [eax+5], dl
	.loc 1 142 23
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	or	edx, -128
	mov	BYTE PTR [eax+6], dl
	.loc 1 143 15
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	or	edx, 64
	mov	BYTE PTR [eax+6], dl
	.loc 1 144 21
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	and	edx, -33
	mov	BYTE PTR [eax+6], dl
	.loc 1 145 19
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	.loc 1 146 15
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	or	edx, 96
	mov	BYTE PTR [eax+5], dl
	.loc 1 147 16
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 10
	mov	BYTE PTR [eax+5], dl
	.loc 1 149 18
	mov	eax, DWORD PTR [ebp+8]
	.loc 1 149 10
	add	eax, 40
	mov	DWORD PTR [ebp-12], eax
	.loc 1 150 20
	push	1048575
	push	0
	push	DWORD PTR [ebp-12]
	push	DWORD PTR [ebp+8]
	call	_ZN12_GLOBAL__N_121GlogalDescriptorTable15descriptor_initEPNS_12descriptor_tEjj
	add	esp, 16
	.loc 1 151 19
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	or	edx, 16
	mov	BYTE PTR [eax+5], dl
	.loc 1 152 23
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	or	edx, -128
	mov	BYTE PTR [eax+6], dl
	.loc 1 153 15
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	or	edx, 64
	mov	BYTE PTR [eax+6], dl
	.loc 1 154 21
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	and	edx, -33
	mov	BYTE PTR [eax+6], dl
	.loc 1 155 19
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	.loc 1 156 15
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	or	edx, 96
	mov	BYTE PTR [eax+5], dl
	.loc 1 157 16
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 2
	mov	BYTE PTR [eax+5], dl
	.loc 1 159 28
	mov	eax, DWORD PTR [ebp+8]
	.loc 1 159 20
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+1026], edx
	.loc 1 160 21
	mov	eax, DWORD PTR [ebp+8]
	mov	WORD PTR [eax+1024], 1023
	.loc 1 161 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	_ZN12_GLOBAL__N_121GlogalDescriptorTable8gdt_initEv, .-_ZN12_GLOBAL__N_121GlogalDescriptorTable8gdt_initEv
	.align 2
	.type	_ZN12_GLOBAL__N_121GlogalDescriptorTable8tss_initEv, @function
_ZN12_GLOBAL__N_121GlogalDescriptorTable8tss_initEv:
.LFB18:
	.loc 1 164 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 165 12
	mov	eax, DWORD PTR [ebp+8]
	add	eax, 1030
	.loc 1 165 11
	sub	esp, 4
	push	108
	push	0
	push	eax
	call	memset
	add	esp, 16
	.loc 1 167 21
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+1038], 16
	.loc 1 168 24
	mov	eax, DWORD PTR [ebp+8]
	mov	WORD PTR [eax+1132], 108
	.loc 1 170 32
	mov	eax, DWORD PTR [ebp+8]
	.loc 1 170 19
	add	eax, 24
	mov	DWORD PTR [ebp-12], eax
	.loc 1 171 33
	mov	eax, DWORD PTR [ebp+8]
	add	eax, 1030
	.loc 1 171 20
	push	107
	push	eax
	push	DWORD PTR [ebp-12]
	push	DWORD PTR [ebp+8]
	call	_ZN12_GLOBAL__N_121GlogalDescriptorTable15descriptor_initEPNS_12descriptor_tEjj
	add	esp, 16
	.loc 1 172 19
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -17
	mov	BYTE PTR [eax+5], dl
	.loc 1 173 23
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	and	edx, 127
	mov	BYTE PTR [eax+6], dl
	.loc 1 174 15
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	and	edx, -65
	mov	BYTE PTR [eax+6], dl
	.loc 1 175 21
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+6]
	and	edx, -33
	mov	BYTE PTR [eax+6], dl
	.loc 1 176 19
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	or	edx, -128
	mov	BYTE PTR [eax+5], dl
	.loc 1 177 15
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -97
	mov	BYTE PTR [eax+5], dl
	.loc 1 178 16
	mov	eax, DWORD PTR [ebp-12]
	movzx	edx, BYTE PTR [eax+5]
	and	edx, -16
	or	edx, 9
	mov	BYTE PTR [eax+5], dl
	.loc 1 180 5
	mov	eax, 24
/APP
/  180 "/home/dever/OSdevelop/workspace/kernel/gdt.cpp" 1
	ltr %ax

/  0 "" 2
	.loc 1 182 1
/NO_APP
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	_ZN12_GLOBAL__N_121GlogalDescriptorTable8tss_initEv, .-_ZN12_GLOBAL__N_121GlogalDescriptorTable8tss_initEv
	.globl	gdt_init
	.type	gdt_init, @function
gdt_init:
.LFB19:
	.loc 1 186 17
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	.loc 1 186 31
	sub	esp, 12
	push	OFFSET FLAT:_ZN12_GLOBAL__N_1L3gdtE
	call	_ZN12_GLOBAL__N_121GlogalDescriptorTable8gdt_initEv
	add	esp, 16
	.loc 1 186 35
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	gdt_init, .-gdt_init
	.globl	tss_init
	.type	tss_init, @function
tss_init:
.LFB20:
	.loc 1 187 17
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	.loc 1 187 31
	sub	esp, 12
	push	OFFSET FLAT:_ZN12_GLOBAL__N_1L3gdtE
	call	_ZN12_GLOBAL__N_121GlogalDescriptorTable8tss_initEv
	add	esp, 16
	.loc 1 187 35
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	tss_init, .-tss_init
.Letext0:
	.file 2 "/home/dever/OSdevelop/workspace/include/Gowinux/types.h"
	.file 3 "/home/dever/OSdevelop/workspace/include/lib/memory.h"
	.file 4 "/home/dever/OSdevelop/workspace/include/lib/log.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x5fb
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0x1b
	.long	.LASF55
	.byte	0x21
	.long	.LASF0
	.long	.LASF1
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x1c
	.long	.LASF9
	.byte	0x2
	.byte	0x22
	.byte	0x7
	.long	0x32
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF3
	.uleb128 0x9
	.long	0x39
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.long	.LASF4
	.uleb128 0x1d
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0xa
	.string	"u8"
	.byte	0x33
	.long	0x5a
	.uleb128 0x9
	.long	0x6f
	.uleb128 0xa
	.string	"u16"
	.byte	0x34
	.long	0x61
	.uleb128 0xa
	.string	"u32"
	.byte	0x35
	.long	0x32
	.uleb128 0x1e
	.long	0x422
	.uleb128 0x3
	.long	.LASF10
	.byte	0x7
	.long	0x78
	.byte	0x80
	.uleb128 0x3
	.long	.LASF11
	.byte	0x9
	.long	0x78
	.byte	0x1
	.uleb128 0x3
	.long	.LASF12
	.byte	0xa
	.long	0x78
	.byte	0x2
	.uleb128 0x3
	.long	.LASF13
	.byte	0xb
	.long	0x78
	.byte	0x3
	.uleb128 0x3
	.long	.LASF14
	.byte	0xd
	.long	0x78
	.byte	0x4
	.uleb128 0x3
	.long	.LASF15
	.byte	0xe
	.long	0x78
	.byte	0x5
	.uleb128 0x3
	.long	.LASF16
	.byte	0x10
	.long	0x78
	.byte	0x8
	.uleb128 0x3
	.long	.LASF17
	.byte	0x11
	.long	0x78
	.byte	0x10
	.uleb128 0x3
	.long	.LASF18
	.byte	0x12
	.long	0x78
	.byte	0x18
	.uleb128 0x3
	.long	.LASF19
	.byte	0x14
	.long	0x78
	.byte	0x23
	.uleb128 0x3
	.long	.LASF20
	.byte	0x15
	.long	0x78
	.byte	0x2b
	.uleb128 0xb
	.long	.LASF31
	.byte	0x8
	.byte	0x18
	.long	0x1b3
	.uleb128 0x4
	.long	.LASF29
	.byte	0x1a
	.byte	0x14
	.long	0x61
	.byte	0
	.uleb128 0x7
	.long	.LASF21
	.byte	0x1b
	.byte	0x12
	.long	0x32
	.byte	0x18
	.byte	0x10
	.uleb128 0x7
	.long	.LASF22
	.byte	0x1c
	.byte	0x13
	.long	0x5a
	.byte	0x4
	.byte	0x28
	.uleb128 0x7
	.long	.LASF23
	.byte	0x1d
	.byte	0x13
	.long	0x5a
	.byte	0x1
	.byte	0x2c
	.uleb128 0x13
	.string	"DPL"
	.byte	0x1e
	.long	0x5a
	.byte	0x2
	.byte	0x2d
	.uleb128 0x7
	.long	.LASF24
	.byte	0x1f
	.byte	0x13
	.long	0x5a
	.byte	0x1
	.byte	0x2f
	.uleb128 0x7
	.long	.LASF25
	.byte	0x20
	.byte	0x13
	.long	0x5a
	.byte	0x4
	.byte	0x30
	.uleb128 0x7
	.long	.LASF26
	.byte	0x21
	.byte	0x13
	.long	0x5a
	.byte	0x1
	.byte	0x34
	.uleb128 0x7
	.long	.LASF27
	.byte	0x22
	.byte	0x13
	.long	0x5a
	.byte	0x1
	.byte	0x35
	.uleb128 0x13
	.string	"big"
	.byte	0x23
	.long	0x5a
	.byte	0x1
	.byte	0x36
	.uleb128 0x7
	.long	.LASF28
	.byte	0x24
	.byte	0x13
	.long	0x5a
	.byte	0x1
	.byte	0x37
	.uleb128 0x4
	.long	.LASF30
	.byte	0x25
	.byte	0x13
	.long	0x5a
	.byte	0x7
	.byte	0
	.uleb128 0xb
	.long	.LASF32
	.byte	0x6
	.byte	0x30
	.long	0x1d7
	.uleb128 0x4
	.long	.LASF33
	.byte	0x31
	.byte	0x9
	.long	0x7d
	.byte	0
	.uleb128 0x4
	.long	.LASF34
	.byte	0x32
	.byte	0x9
	.long	0x87
	.byte	0x2
	.byte	0
	.uleb128 0xb
	.long	.LASF35
	.byte	0x6c
	.byte	0x35
	.long	0x327
	.uleb128 0x4
	.long	.LASF36
	.byte	0x36
	.byte	0x9
	.long	0x87
	.byte	0
	.uleb128 0x4
	.long	.LASF37
	.byte	0x37
	.byte	0x9
	.long	0x87
	.byte	0x4
	.uleb128 0x1
	.string	"ss0"
	.byte	0x38
	.long	0x87
	.byte	0x8
	.uleb128 0x4
	.long	.LASF38
	.byte	0x39
	.byte	0x9
	.long	0x87
	.byte	0xc
	.uleb128 0x1
	.string	"ss1"
	.byte	0x3a
	.long	0x87
	.byte	0x10
	.uleb128 0x4
	.long	.LASF39
	.byte	0x3b
	.byte	0x9
	.long	0x87
	.byte	0x14
	.uleb128 0x1
	.string	"ss2"
	.byte	0x3c
	.long	0x87
	.byte	0x18
	.uleb128 0x1
	.string	"cr3"
	.byte	0x3d
	.long	0x87
	.byte	0x1c
	.uleb128 0x1
	.string	"eip"
	.byte	0x3e
	.long	0x87
	.byte	0x20
	.uleb128 0x4
	.long	.LASF40
	.byte	0x3f
	.byte	0x9
	.long	0x87
	.byte	0x24
	.uleb128 0x1
	.string	"eax"
	.byte	0x40
	.long	0x87
	.byte	0x28
	.uleb128 0x1
	.string	"ecx"
	.byte	0x41
	.long	0x87
	.byte	0x2c
	.uleb128 0x1
	.string	"edx"
	.byte	0x42
	.long	0x87
	.byte	0x30
	.uleb128 0x1
	.string	"ebx"
	.byte	0x43
	.long	0x87
	.byte	0x34
	.uleb128 0x1
	.string	"esp"
	.byte	0x44
	.long	0x87
	.byte	0x38
	.uleb128 0x1
	.string	"ebp"
	.byte	0x45
	.long	0x87
	.byte	0x3c
	.uleb128 0x1
	.string	"esi"
	.byte	0x46
	.long	0x87
	.byte	0x40
	.uleb128 0x1
	.string	"edi"
	.byte	0x47
	.long	0x87
	.byte	0x44
	.uleb128 0x1
	.string	"es"
	.byte	0x48
	.long	0x87
	.byte	0x48
	.uleb128 0x1
	.string	"cs"
	.byte	0x49
	.long	0x87
	.byte	0x4c
	.uleb128 0x1
	.string	"ss"
	.byte	0x4a
	.long	0x87
	.byte	0x50
	.uleb128 0x1
	.string	"ds"
	.byte	0x4b
	.long	0x87
	.byte	0x54
	.uleb128 0x1
	.string	"fs"
	.byte	0x4c
	.long	0x87
	.byte	0x58
	.uleb128 0x1
	.string	"gs"
	.byte	0x4d
	.long	0x87
	.byte	0x5c
	.uleb128 0x4
	.long	.LASF41
	.byte	0x4e
	.byte	0x9
	.long	0x87
	.byte	0x60
	.uleb128 0x14
	.long	.LASF42
	.byte	0x4f
	.long	0x7d
	.byte	0x1
	.value	0x320
	.uleb128 0x14
	.long	.LASF43
	.byte	0x50
	.long	0x7d
	.byte	0xf
	.value	0x321
	.uleb128 0x4
	.long	.LASF44
	.byte	0x51
	.byte	0x9
	.long	0x7d
	.byte	0x66
	.uleb128 0x1
	.string	"ssp"
	.byte	0x52
	.long	0x87
	.byte	0x68
	.byte	0
	.uleb128 0x1f
	.long	.LASF45
	.value	0x472
	.byte	0x1
	.byte	0x55
	.byte	0x8
	.long	0x410
	.uleb128 0x15
	.long	.LASF45
	.byte	0x57
	.long	0x343
	.long	0x349
	.uleb128 0x8
	.long	0x459
	.byte	0
	.uleb128 0x15
	.long	.LASF46
	.byte	0x58
	.long	0x357
	.long	0x362
	.uleb128 0x8
	.long	0x459
	.uleb128 0x8
	.long	0x4c
	.byte	0
	.uleb128 0x20
	.long	.LASF45
	.byte	0x1
	.byte	0x59
	.byte	0x5
	.long	0x372
	.long	0x37d
	.uleb128 0x8
	.long	0x459
	.uleb128 0x2
	.long	0x463
	.byte	0
	.uleb128 0x21
	.long	.LASF56
	.byte	0x1
	.byte	0x5a
	.byte	0x1c
	.long	0x468
	.long	0x391
	.long	0x39c
	.uleb128 0x8
	.long	0x459
	.uleb128 0x2
	.long	0x463
	.byte	0
	.uleb128 0xc
	.long	.LASF47
	.byte	0x5b
	.long	0x3aa
	.long	0x3b0
	.uleb128 0x8
	.long	0x459
	.byte	0
	.uleb128 0xc
	.long	.LASF48
	.byte	0x5c
	.long	0x3be
	.long	0x3c4
	.uleb128 0x8
	.long	0x459
	.byte	0
	.uleb128 0xc
	.long	.LASF49
	.byte	0x5d
	.long	0x3d2
	.long	0x3e7
	.uleb128 0x8
	.long	0x459
	.uleb128 0x2
	.long	0x46d
	.uleb128 0x2
	.long	0x87
	.uleb128 0x2
	.long	0x87
	.byte	0
	.uleb128 0x22
	.long	.LASF50
	.byte	0x1
	.byte	0x60
	.byte	0x12
	.long	0x472
	.byte	0
	.byte	0x3
	.uleb128 0x16
	.string	"ptr"
	.byte	0x61
	.byte	0xf
	.long	0x1b3
	.value	0x400
	.uleb128 0x16
	.string	"tss"
	.byte	0x62
	.byte	0xb
	.long	0x1d7
	.value	0x406
	.byte	0
	.uleb128 0x9
	.long	0x327
	.uleb128 0x23
	.string	"gdt"
	.byte	0x1
	.byte	0x65
	.byte	0x1e
	.long	0x327
	.byte	0
	.uleb128 0x5
	.long	0x96
	.uleb128 0x5
	.long	0xa1
	.uleb128 0x5
	.long	0xac
	.uleb128 0x5
	.long	0xb7
	.uleb128 0x5
	.long	0xc2
	.uleb128 0x5
	.long	0xcd
	.uleb128 0x5
	.long	0xd8
	.uleb128 0x5
	.long	0xe3
	.uleb128 0x5
	.long	0xee
	.uleb128 0x5
	.long	0xf9
	.uleb128 0x5
	.long	0x104
	.uleb128 0xd
	.long	0x327
	.uleb128 0x9
	.long	0x459
	.uleb128 0x17
	.long	0x410
	.uleb128 0x17
	.long	0x327
	.uleb128 0xd
	.long	0x10f
	.uleb128 0xe
	.long	0x10f
	.long	0x482
	.uleb128 0xf
	.long	0x482
	.byte	0x7f
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.long	.LASF51
	.uleb128 0x24
	.long	0x415
	.uleb128 0x5
	.byte	0x3
	.long	_ZN12_GLOBAL__N_1L3gdtE
	.uleb128 0x25
	.long	.LASF57
	.byte	0x3
	.byte	0xb
	.byte	0x7
	.long	0x4b4
	.long	0x4b4
	.uleb128 0x2
	.long	0x4b4
	.uleb128 0x2
	.long	0x4c
	.uleb128 0x2
	.long	0x26
	.byte	0
	.uleb128 0x26
	.byte	0x4
	.uleb128 0x27
	.long	.LASF58
	.byte	0x4
	.byte	0x8
	.byte	0x6
	.long	0x4e1
	.uleb128 0x2
	.long	0x4e1
	.uleb128 0x2
	.long	0x4e1
	.uleb128 0x2
	.long	0x4e1
	.uleb128 0x2
	.long	0x4e1
	.uleb128 0x2
	.long	0x4e1
	.uleb128 0x2
	.long	0x32
	.byte	0
	.uleb128 0xd
	.long	0x40
	.uleb128 0x18
	.long	.LASF48
	.byte	0xbb
	.long	.LFB20
	.long	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.long	.LASF47
	.byte	0xba
	.long	.LFB19
	.long	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.long	0x3b0
	.byte	0xa3
	.long	0x51e
	.long	.LFB18
	.long	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x538
	.uleb128 0x11
	.long	.LASF53
	.long	0x45e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.long	.LASF52
	.byte	0xaa
	.long	0x46d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x10
	.long	0x39c
	.byte	0x71
	.long	0x550
	.long	.LFB17
	.long	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x579
	.uleb128 0x11
	.long	.LASF53
	.long	0x45e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.long	.LASF54
	.long	0x589
	.uleb128 0x5
	.byte	0x3
	.long	.LC4
	.uleb128 0x19
	.long	.LASF52
	.byte	0x76
	.long	0x46d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xe
	.long	0x40
	.long	0x589
	.uleb128 0xf
	.long	0x482
	.byte	0x33
	.byte	0
	.uleb128 0x9
	.long	0x579
	.uleb128 0x10
	.long	0x3c4
	.byte	0x67
	.long	0x5a6
	.long	.LFB16
	.long	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x5e9
	.uleb128 0x11
	.long	.LASF53
	.long	0x45e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.long	.LASF52
	.byte	0x3b
	.long	0x46d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x12
	.long	.LASF34
	.byte	0x45
	.long	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x12
	.long	.LASF33
	.byte	0x4f
	.long	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1a
	.long	.LASF54
	.long	0x5f9
	.uleb128 0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.uleb128 0xe
	.long	0x40
	.long	0x5f9
	.uleb128 0xf
	.long	0x482
	.byte	0x5e
	.byte	0
	.uleb128 0x9
	.long	0x5e9
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
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
	.uleb128 0x21
	.sleb128 27
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1c
	.uleb128 0xb
	.uleb128 0x6c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0xd
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
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0x6b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 10
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x64
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
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 103
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0x6b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0x6b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x8b
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0x5
	.uleb128 0x32
	.uleb128 0x21
	.sleb128 3
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x21
	.sleb128 19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x89
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0x20
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x8a
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x8a
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x32
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x27
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
.LASF33:
	.string	"limit"
.LASF55:
	.string	"GNU C++17 12.2.0 -m32 -masm=intel -mtune=generic -march=pentiumpro -g -finline-functions -ffreestanding -fno-builtin -fno-pie -fno-stack-protector"
.LASF25:
	.string	"limit_high"
.LASF4:
	.string	"short int"
.LASF9:
	.string	"size_t"
.LASF43:
	.string	"reversed"
.LASF19:
	.string	"USER_CODE_SELECTOR"
.LASF46:
	.string	"~GlogalDescriptorTable"
.LASF54:
	.string	"__PRETTY_FUNCTION__"
.LASF14:
	.string	"USER_CODE_IDX"
.LASF31:
	.string	"descriptor_t"
.LASF37:
	.string	"esp0"
.LASF58:
	.string	"_normal_log"
.LASF13:
	.string	"KERNEL_TSS_IDX"
.LASF50:
	.string	"table"
.LASF44:
	.string	"iobase"
.LASF5:
	.string	"long long int"
.LASF57:
	.string	"memset"
.LASF17:
	.string	"KERNEL_DATA_SELECTOR"
.LASF28:
	.string	"granularity"
.LASF15:
	.string	"USER_DATA_IDX"
.LASF29:
	.string	"limit_low"
.LASF49:
	.string	"descriptor_init"
.LASF48:
	.string	"tss_init"
.LASF18:
	.string	"KERNEL_TSS_SELECTOR"
.LASF11:
	.string	"KERNEL_CODE_IDX"
.LASF20:
	.string	"USER_DATA_SELECTOR"
.LASF6:
	.string	"unsigned char"
.LASF32:
	.string	"pointer_t"
.LASF41:
	.string	"ldtr"
.LASF56:
	.string	"operator="
.LASF40:
	.string	"flags"
.LASF8:
	.string	"long long unsigned int"
.LASF22:
	.string	"type"
.LASF35:
	.string	"tss_t"
.LASF2:
	.string	"unsigned int"
.LASF10:
	.string	"GDT_SIZE"
.LASF42:
	.string	"trace"
.LASF7:
	.string	"short unsigned int"
.LASF26:
	.string	"available"
.LASF38:
	.string	"esp1"
.LASF39:
	.string	"esp2"
.LASF3:
	.string	"char"
.LASF21:
	.string	"base_low"
.LASF53:
	.string	"this"
.LASF30:
	.string	"base_high"
.LASF23:
	.string	"segment"
.LASF12:
	.string	"KERNEL_DATA_IDX"
.LASF16:
	.string	"KERNEL_CODE_SELECTOR"
.LASF51:
	.string	"long unsigned int"
.LASF45:
	.string	"GlogalDescriptorTable"
.LASF47:
	.string	"gdt_init"
.LASF24:
	.string	"present"
.LASF27:
	.string	"long_mode"
.LASF34:
	.string	"base"
.LASF36:
	.string	"backlink"
.LASF52:
	.string	"desc"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"/home/dever/OSdevelop/workspace/kernel/gdt.cpp"
.LASF1:
	.string	"/home/dever/OSdevelop/workspace"
	.ident	"GCC: (GNU) 12.2.0"
