	.file	"vsprintf.cpp"
	.intel_syntax noprefix
	.text
.Ltext0:
	.file 0 "/home/dever/OSdevelop/workspace" "/home/dever/OSdevelop/workspace/lib/vsprintf.cpp"
	.section	.text.isdigit,"axG",@progbits,isdigit,comdat
	.weak	isdigit
	.type	isdigit, @function
isdigit:
.LFB9:
	.file 1 "/home/dever/OSdevelop/workspace/include/lib/string.h"
	.loc 1 32 30
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 4
	mov	eax, DWORD PTR [ebp+8]
	mov	BYTE PTR [ebp-4], al
	.loc 1 32 49
	cmp	BYTE PTR [ebp-4], 47
	jle	.L2
	.loc 1 32 49 is_stmt 0 discriminator 1
	cmp	BYTE PTR [ebp-4], 57
	jg	.L2
	.loc 1 32 49 discriminator 3
	mov	eax, 1
	jmp	.L3
.L2:
	.loc 1 32 49 discriminator 4
	mov	eax, 0
.L3:
	.loc 1 32 63 is_stmt 1 discriminator 6
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	isdigit, .-isdigit
	.section	.rodata
	.type	_ZL7ZEROPAD, @object
	.size	_ZL7ZEROPAD, 1
_ZL7ZEROPAD:
	.byte	1
	.type	_ZL4SIGN, @object
	.size	_ZL4SIGN, 1
_ZL4SIGN:
	.byte	2
	.type	_ZL4PLUS, @object
	.size	_ZL4PLUS, 1
_ZL4PLUS:
	.byte	4
	.type	_ZL5SPACE, @object
	.size	_ZL5SPACE, 1
_ZL5SPACE:
	.byte	8
	.type	_ZL4LEFT, @object
	.size	_ZL4LEFT, 1
_ZL4LEFT:
	.byte	16
	.type	_ZL7SPECIAL, @object
	.size	_ZL7SPECIAL, 1
_ZL7SPECIAL:
	.byte	32
	.type	_ZL5SMALL, @object
	.size	_ZL5SMALL, 1
_ZL5SMALL:
	.byte	64
	.text
	.type	skip_atoi, @function
skip_atoi:
.LFB16:
	.file 2 "/home/dever/OSdevelop/workspace/lib/vsprintf.cpp"
	.loc 2 26 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 20
	.cfi_offset 3, -12
	.loc 2 27 9
	mov	DWORD PTR [ebp-12], 0
	.loc 2 28 5
	jmp	.L6
.L7:
	.loc 2 29 15
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	mov	ebx, eax
	.loc 2 29 25
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 2 29 28
	lea	ecx, [eax+1]
	mov	edx, DWORD PTR [ebp+8]
	mov	DWORD PTR [edx], ecx
	.loc 2 29 22
	movzx	eax, BYTE PTR [eax]
	movsx	eax, al
	.loc 2 29 20
	add	eax, ebx
	.loc 2 29 11
	sub	eax, 48
	mov	DWORD PTR [ebp-12], eax
.L6:
	.loc 2 28 21
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 2 28 20
	movzx	eax, BYTE PTR [eax]
	.loc 2 28 19
	movsx	eax, al
	sub	esp, 12
	push	eax
	call	isdigit
	add	esp, 16
	test	al, al
	jne	.L7
	.loc 2 30 12
	mov	eax, DWORD PTR [ebp-12]
	.loc 2 31 1
	mov	ebx, DWORD PTR [ebp-4]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	skip_atoi, .-skip_atoi
	.section	.rodata
	.align 4
.LC0:
	.string	"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.align 4
.LC1:
	.string	"0123456789abcdefghijklmnopqrstuvwxyz"
	.text
	.type	number, @function
number:
.LFB17:
	.loc 2 41 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 64
	.loc 2 43 17
	mov	DWORD PTR [ebp-8], OFFSET FLAT:.LC0
	.loc 2 46 11
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-16], eax
	.loc 2 49 15
	mov	eax, DWORD PTR [ebp+28]
	and	eax, 64
	.loc 2 49 5
	test	eax, eax
	je	.L10
	.loc 2 50 16
	mov	DWORD PTR [ebp-8], OFFSET FLAT:.LC1
.L10:
	.loc 2 53 15
	mov	eax, DWORD PTR [ebp+28]
	and	eax, 16
	.loc 2 53 5
	test	eax, eax
	je	.L11
	.loc 2 54 15
	and	DWORD PTR [ebp+28], -2
.L11:
	.loc 2 58 5
	cmp	DWORD PTR [ebp+16], 1
	jle	.L12
	.loc 2 58 18 discriminator 1
	cmp	DWORD PTR [ebp+16], 36
	jle	.L13
.L12:
	.loc 2 59 16
	mov	eax, 0
	jmp	.L44
.L13:
	.loc 2 62 16
	mov	eax, DWORD PTR [ebp+28]
	and	eax, 1
	.loc 2 62 27
	test	eax, eax
	je	.L15
	.loc 2 62 27 is_stmt 0 discriminator 1
	mov	eax, 48
	jmp	.L16
.L15:
	.loc 2 62 27 discriminator 2
	mov	eax, 32
.L16:
	.loc 2 62 7 is_stmt 1 discriminator 4
	mov	BYTE PTR [ebp-17], al
	.loc 2 65 15 discriminator 4
	mov	eax, DWORD PTR [ebp+28]
	and	eax, 2
	.loc 2 65 5 discriminator 4
	test	eax, eax
	je	.L17
	.loc 2 65 25 discriminator 1
	mov	eax, DWORD PTR [ebp+12]
	.loc 2 65 22 discriminator 1
	test	eax, eax
	jns	.L17
	.loc 2 67 14
	mov	BYTE PTR [ebp-1], 45
	.loc 2 68 16
	mov	eax, DWORD PTR [ebp+12]
	.loc 2 68 15
	neg	eax
	.loc 2 68 13
	mov	DWORD PTR [ebp+12], eax
	jmp	.L18
.L17:
	.loc 2 72 23
	mov	eax, DWORD PTR [ebp+28]
	and	eax, 4
	.loc 2 72 14
	test	eax, eax
	jne	.L19
	.loc 2 72 56 discriminator 1
	mov	eax, DWORD PTR [ebp+28]
	sal	eax, 2
	.loc 2 72 14 discriminator 1
	and	eax, 32
	jmp	.L20
.L19:
	.loc 2 72 14 is_stmt 0 discriminator 2
	mov	eax, 43
.L20:
	.loc 2 72 14 discriminator 4
	mov	BYTE PTR [ebp-1], al
.L18:
	.loc 2 75 5 is_stmt 1
	cmp	BYTE PTR [ebp-1], 0
	je	.L21
	.loc 2 76 13
	sub	DWORD PTR [ebp+20], 1
.L21:
	.loc 2 79 15
	mov	eax, DWORD PTR [ebp+28]
	and	eax, 32
	.loc 2 79 5
	test	eax, eax
	je	.L22
	.loc 2 81 9
	cmp	DWORD PTR [ebp+16], 16
	jne	.L23
	.loc 2 82 18
	sub	DWORD PTR [ebp+20], 2
	jmp	.L22
.L23:
	.loc 2 84 14
	cmp	DWORD PTR [ebp+16], 8
	jne	.L22
	.loc 2 85 17
	sub	DWORD PTR [ebp+20], 1
.L22:
	.loc 2 88 7
	mov	DWORD PTR [ebp-12], 0
	.loc 2 90 5
	cmp	DWORD PTR [ebp+12], 0
	jne	.L26
	.loc 2 91 14
	mov	eax, DWORD PTR [ebp-12]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-12], edx
	.loc 2 91 18
	mov	BYTE PTR [ebp-60+eax], 48
	jmp	.L25
.L27:
	.loc 2 95 27
	mov	ecx, DWORD PTR [ebp+16]
	.loc 2 95 25
	mov	eax, DWORD PTR [ebp+12]
	mov	edx, 0
	div	ecx
	mov	eax, edx
	.loc 2 95 19
	mov	DWORD PTR [ebp-24], eax
	.loc 2 96 20
	mov	ecx, DWORD PTR [ebp+16]
	.loc 2 96 17
	mov	eax, DWORD PTR [ebp+12]
	mov	edx, 0
	div	ecx
	mov	DWORD PTR [ebp+12], eax
	.loc 2 97 31
	mov	edx, DWORD PTR [ebp-24]
	.loc 2 97 36
	mov	eax, DWORD PTR [ebp-8]
	add	eax, edx
	movzx	edx, BYTE PTR [eax]
	.loc 2 97 18
	mov	eax, DWORD PTR [ebp-12]
	lea	ecx, [eax+1]
	mov	DWORD PTR [ebp-12], ecx
	.loc 2 97 22
	mov	BYTE PTR [ebp-60+eax], dl
.L26:
	.loc 2 93 20
	cmp	DWORD PTR [ebp+12], 0
	jne	.L27
.L25:
	.loc 2 101 5
	mov	eax, DWORD PTR [ebp-12]
	cmp	eax, DWORD PTR [ebp+24]
	jle	.L28
	.loc 2 102 19
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [ebp+24], eax
.L28:
	.loc 2 105 10
	mov	eax, DWORD PTR [ebp+24]
	sub	DWORD PTR [ebp+20], eax
	.loc 2 111 17
	mov	eax, DWORD PTR [ebp+28]
	and	eax, 17
	.loc 2 111 5
	test	eax, eax
	jne	.L29
	.loc 2 112 9
	jmp	.L30
.L31:
	.loc 2 113 17
	mov	eax, DWORD PTR [ebp+8]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp+8], edx
	.loc 2 113 20
	mov	BYTE PTR [eax], 32
.L30:
	.loc 2 112 20
	mov	eax, DWORD PTR [ebp+20]
	lea	edx, [eax-1]
	mov	DWORD PTR [ebp+20], edx
	.loc 2 112 23
	test	eax, eax
	setg	al
	test	al, al
	jne	.L31
.L29:
	.loc 2 116 5
	cmp	BYTE PTR [ebp-1], 0
	je	.L32
	.loc 2 117 16
	movzx	edx, BYTE PTR [ebp-1]
	.loc 2 117 13
	mov	eax, DWORD PTR [ebp+8]
	lea	ecx, [eax+1]
	mov	DWORD PTR [ebp+8], ecx
	.loc 2 117 16
	mov	BYTE PTR [eax], dl
.L32:
	.loc 2 120 15
	mov	eax, DWORD PTR [ebp+28]
	and	eax, 32
	.loc 2 120 5
	test	eax, eax
	je	.L33
	.loc 2 123 9
	cmp	DWORD PTR [ebp+16], 8
	jne	.L34
	.loc 2 124 17
	mov	eax, DWORD PTR [ebp+8]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp+8], edx
	.loc 2 124 20
	mov	BYTE PTR [eax], 48
	jmp	.L33
.L34:
	.loc 2 126 14
	cmp	DWORD PTR [ebp+16], 16
	jne	.L33
	.loc 2 128 17
	mov	eax, DWORD PTR [ebp+8]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp+8], edx
	.loc 2 128 20
	mov	BYTE PTR [eax], 48
	.loc 2 129 31
	mov	eax, DWORD PTR [ebp-8]
	add	eax, 33
	movzx	edx, BYTE PTR [eax]
	.loc 2 129 17
	mov	eax, DWORD PTR [ebp+8]
	lea	ecx, [eax+1]
	mov	DWORD PTR [ebp+8], ecx
	.loc 2 129 20
	mov	BYTE PTR [eax], dl
.L33:
	.loc 2 133 17
	mov	eax, DWORD PTR [ebp+28]
	and	eax, 16
	.loc 2 133 5
	test	eax, eax
	jne	.L38
	.loc 2 134 9
	jmp	.L36
.L37:
	.loc 2 135 20
	movzx	edx, BYTE PTR [ebp-17]
	.loc 2 135 17
	mov	eax, DWORD PTR [ebp+8]
	lea	ecx, [eax+1]
	mov	DWORD PTR [ebp+8], ecx
	.loc 2 135 20
	mov	BYTE PTR [eax], dl
.L36:
	.loc 2 134 20
	mov	eax, DWORD PTR [ebp+20]
	lea	edx, [eax-1]
	mov	DWORD PTR [ebp+20], edx
	.loc 2 134 23
	test	eax, eax
	setg	al
	test	al, al
	jne	.L37
	.loc 2 140 5 discriminator 1
	jmp	.L38
.L39:
	.loc 2 141 13
	mov	eax, DWORD PTR [ebp+8]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp+8], edx
	.loc 2 141 16
	mov	BYTE PTR [eax], 48
.L38:
	.loc 2 140 25
	mov	eax, DWORD PTR [ebp+24]
	lea	edx, [eax-1]
	mov	DWORD PTR [ebp+24], edx
	.loc 2 140 14
	cmp	DWORD PTR [ebp-12], eax
	setl	al
	test	al, al
	jne	.L39
	.loc 2 144 5
	jmp	.L40
.L41:
	.loc 2 145 23
	lea	edx, [ebp-60]
	mov	eax, DWORD PTR [ebp-12]
	add	eax, edx
	movzx	edx, BYTE PTR [eax]
	.loc 2 145 13
	mov	eax, DWORD PTR [ebp+8]
	lea	ecx, [eax+1]
	mov	DWORD PTR [ebp+8], ecx
	.loc 2 145 16
	mov	BYTE PTR [eax], dl
.L40:
	.loc 2 144 13
	mov	eax, DWORD PTR [ebp-12]
	lea	edx, [eax-1]
	mov	DWORD PTR [ebp-12], edx
	.loc 2 144 16
	test	eax, eax
	setg	al
	test	al, al
	jne	.L41
	.loc 2 150 5
	jmp	.L42
.L43:
	.loc 2 151 13
	mov	eax, DWORD PTR [ebp+8]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp+8], edx
	.loc 2 151 16
	mov	BYTE PTR [eax], 32
.L42:
	.loc 2 150 16
	mov	eax, DWORD PTR [ebp+20]
	lea	edx, [eax-1]
	mov	DWORD PTR [ebp+20], edx
	.loc 2 150 19
	test	eax, eax
	setg	al
	test	al, al
	jne	.L43
	.loc 2 152 12
	mov	eax, DWORD PTR [ebp+8]
.L44:
	.loc 2 153 1 discriminator 2
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	number, .-number
	.globl	vsprintf
	.type	vsprintf, @function
vsprintf:
.LFB18:
	.loc 2 156 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 56
.LBB2:
	.loc 2 175 14
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-20], eax
	.loc 2 175 5
	jmp	.L46
.L94:
.LBB3:
	.loc 2 180 13
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	.loc 2 180 9
	cmp	al, 37
	je	.L47
	.loc 2 182 22 discriminator 1
	mov	eax, DWORD PTR [ebp+12]
	movzx	edx, BYTE PTR [eax]
	.loc 2 182 17 discriminator 1
	mov	eax, DWORD PTR [ebp-20]
	lea	ecx, [eax+1]
	mov	DWORD PTR [ebp-20], ecx
	.loc 2 182 20 discriminator 1
	mov	BYTE PTR [eax], dl
	.loc 2 183 13 discriminator 1
	jmp	.L48
.L47:
	.loc 2 187 15
	mov	DWORD PTR [ebp-28], 0
	.loc 2 188 14
	mov	BYTE PTR [ebp-37], 1
	.loc 2 189 5
	jmp	.L49
.L57:
	.loc 2 191 9
	mov	eax, DWORD PTR [ebp+12]
	add	eax, 1
	mov	DWORD PTR [ebp+12], eax
	.loc 2 192 17
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	movsx	eax, al
	.loc 2 192 9
	sub	eax, 32
	cmp	eax, 16
	ja	.L50
	mov	eax, DWORD PTR .L52[0+eax*4]
	jmp	eax
	.section	.rodata
	.align 4
	.align 4
.L52:
	.long	.L56
	.long	.L50
	.long	.L50
	.long	.L55
	.long	.L50
	.long	.L50
	.long	.L50
	.long	.L50
	.long	.L50
	.long	.L50
	.long	.L50
	.long	.L54
	.long	.L50
	.long	.L53
	.long	.L50
	.long	.L50
	.long	.L51
	.text
.L53:
	.loc 2 196 19
	or	DWORD PTR [ebp-28], 16
	.loc 2 197 13
	jmp	.L49
.L54:
	.loc 2 200 19
	or	DWORD PTR [ebp-28], 4
	.loc 2 201 13
	jmp	.L49
.L56:
	.loc 2 204 19
	or	DWORD PTR [ebp-28], 8
	.loc 2 205 13
	jmp	.L49
.L55:
	.loc 2 208 19
	or	DWORD PTR [ebp-28], 32
	.loc 2 209 13
	jmp	.L49
.L51:
	.loc 2 212 19
	or	DWORD PTR [ebp-28], 1
	.loc 2 213 13
	jmp	.L49
.L50:
	.loc 2 215 25
	mov	BYTE PTR [ebp-37], 0
	.loc 2 216 13
	nop
.L49:
	.loc 2 189 5
	cmp	BYTE PTR [ebp-37], 0
	jne	.L57
	.loc 2 220 21
	mov	DWORD PTR [ebp-32], -1
	.loc 2 223 21
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	.loc 2 223 20
	movsx	eax, al
	sub	esp, 12
	push	eax
	call	isdigit
	add	esp, 16
	.loc 2 223 9
	test	al, al
	je	.L58
	.loc 2 224 36
	sub	esp, 12
	lea	eax, [ebp+12]
	push	eax
	call	skip_atoi
	add	esp, 16
	mov	DWORD PTR [ebp-32], eax
	jmp	.L59
.L58:
	.loc 2 227 18
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	.loc 2 227 14
	cmp	al, 42
	jne	.L59
	.loc 2 229 13
	mov	eax, DWORD PTR [ebp+12]
	add	eax, 1
	mov	DWORD PTR [ebp+12], eax
	.loc 2 231 27
	add	DWORD PTR [ebp+16], 4
	.loc 2 231 25
	mov	eax, DWORD PTR [ebp+16]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR [ebp-32], eax
	.loc 2 234 13
	cmp	DWORD PTR [ebp-32], 0
	jns	.L59
	.loc 2 237 29
	neg	DWORD PTR [ebp-32]
	.loc 2 238 23
	or	DWORD PTR [ebp-28], 16
.L59:
	.loc 2 243 19
	mov	DWORD PTR [ebp-36], -1
	.loc 2 246 13
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	.loc 2 246 9
	cmp	al, 46
	jne	.L60
	.loc 2 248 13
	mov	eax, DWORD PTR [ebp+12]
	add	eax, 1
	mov	DWORD PTR [ebp+12], eax
	.loc 2 250 25
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	.loc 2 250 24
	movsx	eax, al
	sub	esp, 12
	push	eax
	call	isdigit
	add	esp, 16
	.loc 2 250 13
	test	al, al
	je	.L61
	.loc 2 251 38
	sub	esp, 12
	lea	eax, [ebp+12]
	push	eax
	call	skip_atoi
	add	esp, 16
	mov	DWORD PTR [ebp-36], eax
	jmp	.L62
.L61:
	.loc 2 254 22
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	.loc 2 254 18
	cmp	al, 42
	jne	.L62
	.loc 2 257 29
	add	DWORD PTR [ebp+16], 4
	.loc 2 257 27
	mov	eax, DWORD PTR [ebp+16]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR [ebp-36], eax
.L62:
	.loc 2 260 13
	cmp	DWORD PTR [ebp-36], 0
	jns	.L60
	.loc 2 261 27
	mov	DWORD PTR [ebp-36], 0
.L60:
	.loc 2 265 19
	mov	DWORD PTR [ebp-44], -1
	.loc 2 266 13
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	.loc 2 266 9
	cmp	al, 104
	je	.L63
	.loc 2 266 28 discriminator 1
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	.loc 2 266 25 discriminator 1
	cmp	al, 108
	je	.L63
	.loc 2 266 43 discriminator 2
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	.loc 2 266 40 discriminator 2
	cmp	al, 76
	jne	.L64
.L63:
	.loc 2 268 25
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	.loc 2 268 23
	movsx	eax, al
	mov	DWORD PTR [ebp-44], eax
	.loc 2 269 13
	mov	eax, DWORD PTR [ebp+12]
	add	eax, 1
	mov	DWORD PTR [ebp+12], eax
.L64:
	.loc 2 273 17
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	movsx	eax, al
	.loc 2 273 9
	sub	eax, 88
	cmp	eax, 32
	ja	.L65
	mov	eax, DWORD PTR .L67[0+eax*4]
	jmp	eax
	.section	.rodata
	.align 4
	.align 4
.L67:
	.long	.L75
	.long	.L65
	.long	.L65
	.long	.L65
	.long	.L65
	.long	.L65
	.long	.L65
	.long	.L65
	.long	.L65
	.long	.L65
	.long	.L65
	.long	.L74
	.long	.L73
	.long	.L65
	.long	.L65
	.long	.L65
	.long	.L65
	.long	.L73
	.long	.L65
	.long	.L65
	.long	.L65
	.long	.L65
	.long	.L72
	.long	.L71
	.long	.L70
	.long	.L65
	.long	.L65
	.long	.L69
	.long	.L65
	.long	.L68
	.long	.L65
	.long	.L65
	.long	.L66
	.text
.L74:
	.loc 2 279 25
	mov	eax, DWORD PTR [ebp-28]
	and	eax, 16
	.loc 2 279 13
	test	eax, eax
	jne	.L76
	.loc 2 281 17
	jmp	.L77
.L78:
	.loc 2 282 25
	mov	eax, DWORD PTR [ebp-20]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-20], edx
	.loc 2 282 28
	mov	BYTE PTR [eax], 32
.L77:
	.loc 2 281 38
	sub	DWORD PTR [ebp-32], 1
	cmp	DWORD PTR [ebp-32], 0
	setg	al
	test	al, al
	jne	.L78
.L76:
	.loc 2 283 37
	add	DWORD PTR [ebp+16], 4
	mov	eax, DWORD PTR [ebp+16]
	sub	eax, 4
	mov	eax, DWORD PTR [eax]
	.loc 2 283 22
	mov	ecx, eax
	.loc 2 283 17
	mov	eax, DWORD PTR [ebp-20]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-20], edx
	.loc 2 283 20
	mov	BYTE PTR [eax], cl
	.loc 2 286 13
	jmp	.L79
.L80:
	.loc 2 287 21
	mov	eax, DWORD PTR [ebp-20]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-20], edx
	.loc 2 287 24
	mov	BYTE PTR [eax], 32
.L79:
	.loc 2 286 34
	sub	DWORD PTR [ebp-32], 1
	cmp	DWORD PTR [ebp-32], 0
	setg	al
	test	al, al
	jne	.L80
	.loc 2 288 13
	jmp	.L48
.L69:
	.loc 2 292 17
	add	DWORD PTR [ebp+16], 4
	.loc 2 292 15
	mov	eax, DWORD PTR [ebp+16]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR [ebp-24], eax
	.loc 2 294 25
	sub	esp, 12
	push	DWORD PTR [ebp-24]
	call	strlen
	add	esp, 16
	.loc 2 294 17
	mov	DWORD PTR [ebp-12], eax
	.loc 2 296 13
	cmp	DWORD PTR [ebp-36], 0
	jns	.L81
	.loc 2 297 27
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [ebp-36], eax
	jmp	.L82
.L81:
	.loc 2 298 18
	mov	eax, DWORD PTR [ebp-12]
	cmp	eax, DWORD PTR [ebp-36]
	jle	.L82
	.loc 2 299 21
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [ebp-12], eax
.L82:
	.loc 2 302 25
	mov	eax, DWORD PTR [ebp-28]
	and	eax, 16
	.loc 2 302 13
	test	eax, eax
	jne	.L83
	.loc 2 304 17
	jmp	.L84
.L85:
	.loc 2 305 25
	mov	eax, DWORD PTR [ebp-20]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-20], edx
	.loc 2 305 28
	mov	BYTE PTR [eax], 32
.L84:
	.loc 2 304 41
	mov	eax, DWORD PTR [ebp-32]
	lea	edx, [eax-1]
	mov	DWORD PTR [ebp-32], edx
	.loc 2 304 28
	cmp	DWORD PTR [ebp-12], eax
	setl	al
	test	al, al
	jne	.L85
.L83:
	.loc 2 307 20
	mov	DWORD PTR [ebp-16], 0
	.loc 2 307 13
	jmp	.L86
.L87:
	.loc 2 308 28 discriminator 3
	mov	eax, DWORD PTR [ebp-24]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-24], edx
	.loc 2 308 26 discriminator 3
	movzx	edx, BYTE PTR [eax]
	.loc 2 308 21 discriminator 3
	mov	eax, DWORD PTR [ebp-20]
	lea	ecx, [eax+1]
	mov	DWORD PTR [ebp-20], ecx
	.loc 2 308 24 discriminator 3
	mov	BYTE PTR [eax], dl
	.loc 2 307 13 discriminator 3
	add	DWORD PTR [ebp-16], 1
.L86:
	.loc 2 307 27 discriminator 1
	mov	eax, DWORD PTR [ebp-16]
	cmp	eax, DWORD PTR [ebp-12]
	jl	.L87
	.loc 2 311 13
	jmp	.L88
.L89:
	.loc 2 312 21
	mov	eax, DWORD PTR [ebp-20]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-20], edx
	.loc 2 312 24
	mov	BYTE PTR [eax], 32
.L88:
	.loc 2 311 37
	mov	eax, DWORD PTR [ebp-32]
	lea	edx, [eax-1]
	mov	DWORD PTR [ebp-32], edx
	.loc 2 311 24
	cmp	DWORD PTR [ebp-12], eax
	setl	al
	test	al, al
	jne	.L89
	.loc 2 313 13
	jmp	.L48
.L71:
	.loc 2 317 31
	add	DWORD PTR [ebp+16], 4
	mov	eax, DWORD PTR [ebp+16]
	sub	eax, 4
	.loc 2 317 25
	mov	eax, DWORD PTR [eax]
	sub	esp, 8
	push	DWORD PTR [ebp-28]
	push	DWORD PTR [ebp-36]
	push	DWORD PTR [ebp-32]
	push	8
	push	eax
	push	DWORD PTR [ebp-20]
	call	number
	add	esp, 32
	mov	DWORD PTR [ebp-20], eax
	.loc 2 319 13
	jmp	.L48
.L70:
	.loc 2 324 13
	cmp	DWORD PTR [ebp-32], -1
	jne	.L90
	.loc 2 326 29
	mov	DWORD PTR [ebp-32], 8
	.loc 2 327 23
	or	DWORD PTR [ebp-28], 1
.L90:
	.loc 2 330 41
	add	DWORD PTR [ebp+16], 4
	mov	eax, DWORD PTR [ebp+16]
	sub	eax, 4
	mov	eax, DWORD PTR [eax]
	.loc 2 329 25
	sub	esp, 8
	push	DWORD PTR [ebp-28]
	push	DWORD PTR [ebp-36]
	push	DWORD PTR [ebp-32]
	push	16
	push	eax
	push	DWORD PTR [ebp-20]
	call	number
	add	esp, 32
	mov	DWORD PTR [ebp-20], eax
	.loc 2 332 13
	jmp	.L48
.L66:
	.loc 2 338 19
	or	DWORD PTR [ebp-28], 64
.L75:
	.loc 2 340 31
	add	DWORD PTR [ebp+16], 4
	mov	eax, DWORD PTR [ebp+16]
	sub	eax, 4
	.loc 2 340 25
	mov	eax, DWORD PTR [eax]
	sub	esp, 8
	push	DWORD PTR [ebp-28]
	push	DWORD PTR [ebp-36]
	push	DWORD PTR [ebp-32]
	push	16
	push	eax
	push	DWORD PTR [ebp-20]
	call	number
	add	esp, 32
	mov	DWORD PTR [ebp-20], eax
	.loc 2 342 13
	jmp	.L48
.L73:
	.loc 2 348 19
	or	DWORD PTR [ebp-28], 2
.L68:
	.loc 2 351 31
	add	DWORD PTR [ebp+16], 4
	mov	eax, DWORD PTR [ebp+16]
	sub	eax, 4
	.loc 2 351 25
	mov	eax, DWORD PTR [eax]
	sub	esp, 8
	push	DWORD PTR [ebp-28]
	push	DWORD PTR [ebp-36]
	push	DWORD PTR [ebp-32]
	push	10
	push	eax
	push	DWORD PTR [ebp-20]
	call	number
	add	esp, 32
	mov	DWORD PTR [ebp-20], eax
	.loc 2 353 13
	jmp	.L48
.L72:
	.loc 2 359 18
	add	DWORD PTR [ebp+16], 4
	.loc 2 359 16
	mov	eax, DWORD PTR [ebp+16]
	mov	eax, DWORD PTR [eax-4]
	mov	DWORD PTR [ebp-48], eax
	.loc 2 361 24
	mov	eax, DWORD PTR [ebp-20]
	sub	eax, DWORD PTR [ebp+8]
	mov	edx, eax
	.loc 2 361 17
	mov	eax, DWORD PTR [ebp-48]
	mov	DWORD PTR [eax], edx
	.loc 2 362 13
	jmp	.L48
.L65:
	.loc 2 366 17
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	.loc 2 366 13
	cmp	al, 37
	je	.L91
	.loc 2 368 21
	mov	eax, DWORD PTR [ebp-20]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-20], edx
	.loc 2 368 24
	mov	BYTE PTR [eax], 37
.L91:
	.loc 2 371 17
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	.loc 2 371 13
	test	al, al
	je	.L92
	.loc 2 372 26
	mov	eax, DWORD PTR [ebp+12]
	movzx	edx, BYTE PTR [eax]
	.loc 2 372 21
	mov	eax, DWORD PTR [ebp-20]
	lea	ecx, [eax+1]
	mov	DWORD PTR [ebp-20], ecx
	.loc 2 372 24
	mov	BYTE PTR [eax], dl
	.loc 2 376 13
	jmp	.L96
.L92:
	.loc 2 375 17
	mov	eax, DWORD PTR [ebp+12]
	sub	eax, 1
	mov	DWORD PTR [ebp+12], eax
.L96:
	.loc 2 376 13
	nop
.L48:
.LBE3:
	.loc 2 175 5 discriminator 2
	mov	eax, DWORD PTR [ebp+12]
	add	eax, 1
	mov	DWORD PTR [ebp+12], eax
.L46:
	.loc 2 175 21 discriminator 1
	mov	eax, DWORD PTR [ebp+12]
	movzx	eax, BYTE PTR [eax]
	test	al, al
	jne	.L94
.LBE2:
	.loc 2 380 10
	mov	eax, DWORD PTR [ebp-20]
	mov	BYTE PTR [eax], 0
	.loc 2 383 7
	mov	eax, DWORD PTR [ebp-20]
	sub	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-16], eax
	.loc 2 384 12
	mov	eax, DWORD PTR [ebp-16]
	.loc 2 385 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	vsprintf, .-vsprintf
	.globl	sprintf
	.type	sprintf, @function
sprintf:
.LFB19:
	.loc 2 389 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 2 391 5
	lea	eax, [ebp+12]
	add	eax, 4
	mov	DWORD PTR [ebp-12], eax
	.loc 2 392 21
	mov	eax, DWORD PTR [ebp+12]
	sub	esp, 4
	push	DWORD PTR [ebp-12]
	push	eax
	push	DWORD PTR [ebp+8]
	call	vsprintf
	add	esp, 16
	mov	DWORD PTR [ebp-16], eax
	.loc 2 393 5
	mov	DWORD PTR [ebp-12], 0
	.loc 2 394 12
	mov	eax, DWORD PTR [ebp-16]
	.loc 2 395 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	sprintf, .-sprintf
.Letext0:
	.file 3 "/home/dever/OSdevelop/workspace/include/Gowinux/types.h"
	.file 4 "/home/dever/OSdevelop/workspace/include/lib/stdarg.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x394
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0xb
	.long	.LASF35
	.byte	0x21
	.long	.LASF0
	.long	.LASF1
	.long	.LLRL0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x8
	.long	.LASF9
	.byte	0x3
	.byte	0x22
	.long	0x31
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF3
	.uleb128 0x9
	.long	0x38
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF4
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0xd
	.string	"u8"
	.byte	0x3
	.byte	0x33
	.byte	0x7
	.long	0x59
	.uleb128 0x9
	.long	0x6e
	.uleb128 0x8
	.long	.LASF10
	.byte	0x4
	.byte	0x5
	.long	0x89
	.uleb128 0x7
	.long	0x38
	.uleb128 0x4
	.long	.LASF11
	.byte	0xf
	.long	0x79
	.uleb128 0x5
	.byte	0x3
	.long	_ZL7ZEROPAD
	.uleb128 0x4
	.long	.LASF12
	.byte	0x10
	.long	0x79
	.uleb128 0x5
	.byte	0x3
	.long	_ZL4SIGN
	.uleb128 0x4
	.long	.LASF13
	.byte	0x11
	.long	0x79
	.uleb128 0x5
	.byte	0x3
	.long	_ZL4PLUS
	.uleb128 0x4
	.long	.LASF14
	.byte	0x12
	.long	0x79
	.uleb128 0x5
	.byte	0x3
	.long	_ZL5SPACE
	.uleb128 0x4
	.long	.LASF15
	.byte	0x13
	.long	0x79
	.uleb128 0x5
	.byte	0x3
	.long	_ZL4LEFT
	.uleb128 0x4
	.long	.LASF16
	.byte	0x14
	.long	0x79
	.uleb128 0x5
	.byte	0x3
	.long	_ZL7SPECIAL
	.uleb128 0x4
	.long	.LASF17
	.byte	0x15
	.long	0x79
	.uleb128 0x5
	.byte	0x3
	.long	_ZL5SMALL
	.uleb128 0xe
	.long	.LASF36
	.byte	0x1
	.byte	0xc
	.byte	0x8
	.long	0x26
	.long	0x114
	.uleb128 0xf
	.long	0x114
	.byte	0
	.uleb128 0x7
	.long	0x3f
	.uleb128 0x10
	.long	.LASF19
	.byte	0x2
	.value	0x184
	.byte	0x5
	.long	0x4b
	.long	.LFB19
	.long	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x16e
	.uleb128 0xa
	.string	"buf"
	.byte	0x13
	.long	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xa
	.string	"fmt"
	.byte	0x24
	.long	0x114
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x11
	.uleb128 0x12
	.long	.LASF18
	.byte	0x2
	.value	0x186
	.byte	0xd
	.long	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.string	"i"
	.byte	0x2
	.value	0x188
	.byte	0x9
	.long	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x14
	.long	.LASF20
	.byte	0x2
	.byte	0x9b
	.byte	0x5
	.long	0x4b
	.long	.LFB18
	.long	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x246
	.uleb128 0x5
	.string	"buf"
	.byte	0x2
	.byte	0x9b
	.byte	0x14
	.long	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.string	"fmt"
	.byte	0x2
	.byte	0x9b
	.byte	0x25
	.long	0x114
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x6
	.long	.LASF18
	.byte	0x9b
	.byte	0x32
	.long	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1
	.string	"len"
	.byte	0x9d
	.byte	0x9
	.long	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.string	"i"
	.byte	0x9e
	.byte	0x9
	.long	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.string	"str"
	.byte	0xa1
	.byte	0xb
	.long	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1
	.string	"s"
	.byte	0xa2
	.byte	0xb
	.long	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.string	"ip"
	.byte	0xa3
	.byte	0xa
	.long	0x246
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x3
	.long	.LASF21
	.byte	0xa6
	.byte	0x9
	.long	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x3
	.long	.LASF22
	.byte	0xa8
	.byte	0x9
	.long	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.long	.LASF23
	.byte	0xa9
	.byte	0x9
	.long	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x3
	.long	.LASF24
	.byte	0xaa
	.byte	0x9
	.long	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x15
	.long	.LBB3
	.long	.LBE3-.LBB3
	.uleb128 0x3
	.long	.LASF25
	.byte	0xbc
	.byte	0xe
	.long	0x24b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x4b
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF26
	.uleb128 0x16
	.long	.LASF33
	.byte	0x2
	.byte	0x28
	.byte	0xe
	.long	0x89
	.long	.LFB17
	.long	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x322
	.uleb128 0x5
	.string	"str"
	.byte	0x2
	.byte	0x28
	.byte	0x1b
	.long	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.string	"num"
	.byte	0x2
	.byte	0x28
	.byte	0x2e
	.long	0x322
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x6
	.long	.LASF27
	.byte	0x28
	.byte	0x37
	.long	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x6
	.long	.LASF28
	.byte	0x28
	.byte	0x41
	.long	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x6
	.long	.LASF23
	.byte	0x28
	.byte	0x4b
	.long	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x6
	.long	.LASF21
	.byte	0x28
	.byte	0x5a
	.long	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1
	.string	"c"
	.byte	0x2a
	.byte	0xa
	.long	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x3
	.long	.LASF29
	.byte	0x2a
	.byte	0xd
	.long	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1
	.string	"tmp"
	.byte	0x2a
	.byte	0x13
	.long	0x329
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x3
	.long	.LASF30
	.byte	0x2b
	.byte	0x11
	.long	0x114
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1
	.string	"i"
	.byte	0x2c
	.byte	0x9
	.long	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3
	.long	.LASF31
	.byte	0x2d
	.byte	0x9
	.long	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.string	"ptr"
	.byte	0x2e
	.byte	0xb
	.long	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF32
	.uleb128 0x17
	.long	0x38
	.long	0x339
	.uleb128 0x18
	.long	0x322
	.byte	0x23
	.byte	0
	.uleb128 0x19
	.long	.LASF34
	.byte	0x2
	.byte	0x19
	.byte	0xc
	.long	0x4b
	.long	.LFB16
	.long	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x36d
	.uleb128 0x5
	.string	"s"
	.byte	0x2
	.byte	0x19
	.byte	0x23
	.long	0x36d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1
	.string	"i"
	.byte	0x1b
	.byte	0x9
	.long	0x4b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x7
	.long	0x114
	.uleb128 0x1a
	.long	.LASF37
	.byte	0x1
	.byte	0x20
	.byte	0xd
	.long	0x24b
	.long	.LFB9
	.long	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.string	"ch"
	.byte	0x1
	.byte	0x20
	.byte	0x1a
	.long	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x21
	.sleb128 27
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x6c
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
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
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 388
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x11
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.long	.LFB9
	.long	.LFE9-.LFB9
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
	.long	.LFB9
	.uleb128 .LFE9-.LFB9
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF9:
	.string	"size_t"
.LASF34:
	.string	"skip_atoi"
.LASF15:
	.string	"LEFT"
.LASF16:
	.string	"SPECIAL"
.LASF26:
	.string	"bool"
.LASF13:
	.string	"PLUS"
.LASF36:
	.string	"strlen"
.LASF8:
	.string	"long long unsigned int"
.LASF23:
	.string	"precision"
.LASF6:
	.string	"unsigned char"
.LASF11:
	.string	"ZEROPAD"
.LASF27:
	.string	"base"
.LASF7:
	.string	"short unsigned int"
.LASF10:
	.string	"va_list"
.LASF37:
	.string	"isdigit"
.LASF22:
	.string	"field_width"
.LASF12:
	.string	"SIGN"
.LASF14:
	.string	"SPACE"
.LASF32:
	.string	"long unsigned int"
.LASF2:
	.string	"unsigned int"
.LASF21:
	.string	"flags"
.LASF24:
	.string	"qualifier"
.LASF3:
	.string	"char"
.LASF35:
	.string	"GNU C++17 12.2.0 -m32 -masm=intel -mtune=generic -march=pentiumpro -g -finline-functions -ffreestanding -fno-builtin -fno-pie -fno-stack-protector"
.LASF33:
	.string	"number"
.LASF17:
	.string	"SMALL"
.LASF5:
	.string	"long long int"
.LASF31:
	.string	"index"
.LASF30:
	.string	"digits"
.LASF4:
	.string	"short int"
.LASF18:
	.string	"args"
.LASF29:
	.string	"sign"
.LASF25:
	.string	"repeat_flag"
.LASF28:
	.string	"size"
.LASF19:
	.string	"sprintf"
.LASF20:
	.string	"vsprintf"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"/home/dever/OSdevelop/workspace/lib/vsprintf.cpp"
.LASF1:
	.string	"/home/dever/OSdevelop/workspace"
	.ident	"GCC: (GNU) 12.2.0"
