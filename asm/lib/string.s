	.file	"string.cpp"
	.intel_syntax noprefix
	.text
.Ltext0:
	.file 0 "/home/dever/OSdevelop/workspace" "/home/dever/OSdevelop/workspace/lib/string.cpp"
	.section	.text.pop,"axG",@progbits,pop,comdat
	.weak	pop
	.type	pop, @function
pop:
.LFB0:
	.file 1 "/home/dever/OSdevelop/workspace/include/lib/stack.h"
	.loc 1 13 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	.loc 1 14 17
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 1 14 14
	lea	edx, [eax-1]
	.loc 1 14 22
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 14 17
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 1 14 22
	movzx	eax, BYTE PTR [eax]
	.loc 1 15 1
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	pop, .-pop
	.section	.text.push,"axG",@progbits,push,comdat
	.weak	push
	.type	push, @function
push:
.LFB1:
	.loc 1 18 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 4
	.cfi_offset 3, -12
	mov	eax, DWORD PTR [ebp+12]
	mov	BYTE PTR [ebp-8], al
	.loc 1 19 17
	movzx	edx, BYTE PTR [ebp-8]
	.loc 1 19 8
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 1 19 13
	lea	ebx, [eax+1]
	mov	ecx, DWORD PTR [ebp+8]
	mov	DWORD PTR [ecx], ebx
	.loc 1 19 17
	mov	BYTE PTR [eax], dl
	.loc 1 20 1
	nop
	mov	ebx, DWORD PTR [ebp-4]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	push, .-push
	.text
	.globl	strcpy
	.type	strcpy, @function
strcpy:
.LFB16:
	.file 2 "/home/dever/OSdevelop/workspace/lib/string.cpp"
	.loc 2 7 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	.loc 2 8 12
	mov	DWORD PTR [ebp-4], 0
	.loc 2 9 5
	jmp	.L5
.L6:
	.loc 2 10 28
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	.loc 2 10 17
	mov	ecx, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [ebp-4]
	add	edx, ecx
	.loc 2 10 28
	movzx	eax, BYTE PTR [eax]
	.loc 2 10 19
	mov	BYTE PTR [edx], al
	.loc 2 11 12
	add	DWORD PTR [ebp-4], 1
.L5:
	.loc 2 9 19
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	.loc 2 9 21
	test	al, al
	jne	.L6
	.loc 2 13 12
	mov	eax, DWORD PTR [ebp+8]
	.loc 2 14 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	strcpy, .-strcpy
	.globl	strncpy
	.type	strncpy, @function
strncpy:
.LFB17:
	.loc 2 16 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	.loc 2 17 12
	mov	DWORD PTR [ebp-4], 0
	.loc 2 18 12
	mov	DWORD PTR [ebp-8], 0
	.loc 2 19 5
	jmp	.L9
.L11:
	.loc 2 20 28
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	.loc 2 20 17
	mov	ecx, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [ebp-4]
	add	edx, ecx
	.loc 2 20 28
	movzx	eax, BYTE PTR [eax]
	.loc 2 20 19
	mov	BYTE PTR [edx], al
	.loc 2 21 12
	add	DWORD PTR [ebp-4], 1
	.loc 2 22 16
	add	DWORD PTR [ebp-8], 1
.L9:
	.loc 2 19 19
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	.loc 2 19 28
	test	al, al
	je	.L10
	.loc 2 19 28 is_stmt 0 discriminator 1
	mov	eax, DWORD PTR [ebp-8]
	cmp	eax, DWORD PTR [ebp+16]
	jb	.L11
.L10:
	.loc 2 24 12 is_stmt 1
	mov	eax, DWORD PTR [ebp+8]
	.loc 2 25 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	strncpy, .-strncpy
	.globl	strcat
	.type	strcat, @function
strcat:
.LFB18:
	.loc 2 27 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 2 28 26
	sub	esp, 12
	push	DWORD PTR [ebp+8]
	call	strlen
	add	esp, 16
	mov	DWORD PTR [ebp-12], eax
	.loc 2 29 11
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp-12]
	add	eax, edx
	sub	esp, 8
	push	DWORD PTR [ebp+12]
	push	eax
	call	strcpy
	add	esp, 16
	.loc 2 30 12
	mov	eax, DWORD PTR [ebp+8]
	.loc 2 31 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	strcat, .-strcat
	.globl	strlen
	.type	strlen, @function
strlen:
.LFB19:
	.loc 2 33 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	.loc 2 35 12
	mov	DWORD PTR [ebp-4], 0
	.loc 2 36 5
	jmp	.L16
.L17:
	.loc 2 37 15
	add	DWORD PTR [ebp-4], 1
.L16:
	.loc 2 36 22
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	.loc 2 36 24
	test	al, al
	jne	.L17
	.loc 2 39 12
	mov	eax, DWORD PTR [ebp-4]
	.loc 2 40 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	strlen, .-strlen
	.globl	strcmp
	.type	strcmp, @function
strcmp:
.LFB20:
	.loc 2 42 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	.loc 2 43 12
	mov	DWORD PTR [ebp-4], 0
	.loc 2 44 5
	jmp	.L20
.L22:
	.loc 2 45 13
	add	DWORD PTR [ebp-4], 1
.L20:
	.loc 2 44 20
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	movzx	edx, BYTE PTR [eax]
	.loc 2 44 33
	mov	ecx, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, ecx
	movzx	eax, BYTE PTR [eax]
	.loc 2 44 55
	cmp	dl, al
	jne	.L21
	.loc 2 44 46 discriminator 1
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	.loc 2 44 35 discriminator 1
	test	al, al
	je	.L21
	.loc 2 44 66 discriminator 2
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	.loc 2 44 55 discriminator 2
	test	al, al
	jne	.L22
.L21:
	.loc 2 50 20
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	movzx	edx, BYTE PTR [eax]
	.loc 2 50 32
	mov	ecx, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, ecx
	movzx	eax, BYTE PTR [eax]
	.loc 2 50 34
	cmp	dl, al
	jl	.L23
	.loc 2 50 49 discriminator 1
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	movzx	edx, BYTE PTR [eax]
	.loc 2 50 61 discriminator 1
	mov	ecx, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, ecx
	movzx	eax, BYTE PTR [eax]
	.loc 2 50 51 discriminator 1
	cmp	dl, al
	setg	al
	.loc 2 50 34 discriminator 1
	movzx	eax, al
	.loc 2 50 61 discriminator 1
	jmp	.L25
.L23:
	.loc 2 50 34 discriminator 2
	mov	eax, -1
.L25:
	.loc 2 51 1 discriminator 5
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	strcmp, .-strcmp
	.globl	strchr
	.type	strchr, @function
strchr:
.LFB21:
	.loc 2 53 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	.loc 2 54 12
	mov	DWORD PTR [ebp-4], 0
	.loc 2 55 5
	jmp	.L27
.L29:
	.loc 2 56 21
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	movsx	eax, al
	.loc 2 56 9
	cmp	DWORD PTR [ebp+12], eax
	jne	.L27
	.loc 2 57 38
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	jmp	.L28
.L27:
	.loc 2 55 20
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	.loc 2 55 22
	test	al, al
	jne	.L29
	.loc 2 60 12
	mov	eax, 0
.L28:
	.loc 2 61 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	strchr, .-strchr
	.globl	strrchr
	.type	strrchr, @function
strrchr:
.LFB22:
	.loc 2 63 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	.loc 2 64 12
	mov	DWORD PTR [ebp-4], 0
	.loc 2 65 11
	mov	DWORD PTR [ebp-8], 0
	.loc 2 66 5
	jmp	.L31
.L33:
	.loc 2 67 21
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	movsx	eax, al
	.loc 2 67 9
	cmp	DWORD PTR [ebp+12], eax
	jne	.L32
	.loc 2 68 18
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	mov	DWORD PTR [ebp-8], eax
.L32:
	.loc 2 70 13
	add	DWORD PTR [ebp-4], 1
.L31:
	.loc 2 66 20
	mov	edx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [ebp-4]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	.loc 2 66 22
	test	al, al
	jne	.L33
	.loc 2 72 12
	mov	eax, DWORD PTR [ebp-8]
	.loc 2 73 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	strrchr, .-strrchr
	.globl	memcmp
	.type	memcmp, @function
memcmp:
.LFB23:
	.loc 2 76 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	.loc 2 77 11
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-4], eax
	.loc 2 78 11
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [ebp-8], eax
	.loc 2 79 5
	jmp	.L36
.L38:
	.loc 2 80 13
	add	DWORD PTR [ebp-4], 1
	.loc 2 81 13
	add	DWORD PTR [ebp-8], 1
	.loc 2 82 14
	sub	DWORD PTR [ebp+16], 1
.L36:
	.loc 2 79 24
	cmp	DWORD PTR [ebp+16], 0
	je	.L37
	.loc 2 79 27 discriminator 1
	mov	eax, DWORD PTR [ebp-4]
	movzx	edx, BYTE PTR [eax]
	.loc 2 79 36 discriminator 1
	mov	eax, DWORD PTR [ebp-8]
	movzx	eax, BYTE PTR [eax]
	.loc 2 79 24 discriminator 1
	cmp	dl, al
	je	.L38
.L37:
	.loc 2 84 5
	cmp	DWORD PTR [ebp+16], 0
	jne	.L39
	.loc 2 85 16
	mov	eax, 0
	jmp	.L40
.L39:
	.loc 2 86 12
	mov	eax, DWORD PTR [ebp-4]
	movzx	edx, BYTE PTR [eax]
	.loc 2 86 20
	mov	eax, DWORD PTR [ebp-8]
	movzx	eax, BYTE PTR [eax]
	.loc 2 86 26
	cmp	dl, al
	jl	.L41
	.loc 2 86 33 discriminator 1
	mov	eax, DWORD PTR [ebp-4]
	movzx	edx, BYTE PTR [eax]
	.loc 2 86 41 discriminator 1
	mov	eax, DWORD PTR [ebp-8]
	movzx	eax, BYTE PTR [eax]
	.loc 2 86 39 discriminator 1
	cmp	dl, al
	setg	al
	.loc 2 86 26 discriminator 1
	movzx	eax, al
	.loc 2 86 42 discriminator 1
	jmp	.L43
.L41:
	.loc 2 86 26 discriminator 2
	mov	eax, -1
.L43:
	.loc 2 86 42
	nop
.L40:
	.loc 2 87 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE23:
	.size	memcmp, .-memcmp
	.globl	memset
	.type	memset, @function
memset:
.LFB24:
	.loc 2 89 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
.LBB2:
	.loc 2 90 14
	mov	DWORD PTR [ebp-4], 0
	.loc 2 90 5
	jmp	.L45
.L46:
	.loc 2 91 23 discriminator 3
	mov	edx, DWORD PTR [ebp-4]
	.loc 2 91 24 discriminator 3
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	.loc 2 91 26 discriminator 3
	mov	edx, DWORD PTR [ebp+12]
	mov	BYTE PTR [eax], dl
	.loc 2 90 5 discriminator 3
	add	DWORD PTR [ebp-4], 1
.L45:
	.loc 2 90 21 discriminator 1
	mov	eax, DWORD PTR [ebp-4]
	.loc 2 90 23 discriminator 1
	cmp	eax, DWORD PTR [ebp+16]
	jb	.L46
.LBE2:
	.loc 2 93 12
	mov	eax, DWORD PTR [ebp+8]
	.loc 2 94 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	memset, .-memset
	.globl	memcpy
	.type	memcpy, @function
memcpy:
.LFB25:
	.loc 2 96 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
.LBB3:
	.loc 2 97 14
	mov	DWORD PTR [ebp-4], 0
	.loc 2 97 5
	jmp	.L49
.L50:
	.loc 2 98 41 discriminator 3
	mov	edx, DWORD PTR [ebp-4]
	.loc 2 98 42 discriminator 3
	mov	eax, DWORD PTR [ebp+12]
	add	eax, edx
	.loc 2 98 23 discriminator 3
	mov	ecx, DWORD PTR [ebp-4]
	.loc 2 98 24 discriminator 3
	mov	edx, DWORD PTR [ebp+8]
	add	edx, ecx
	.loc 2 98 42 discriminator 3
	movzx	eax, BYTE PTR [eax]
	.loc 2 98 26 discriminator 3
	mov	BYTE PTR [edx], al
	.loc 2 97 5 discriminator 3
	add	DWORD PTR [ebp-4], 1
.L49:
	.loc 2 97 21 discriminator 1
	mov	eax, DWORD PTR [ebp-4]
	.loc 2 97 23 discriminator 1
	cmp	eax, DWORD PTR [ebp+16]
	jb	.L50
.LBE3:
	.loc 2 100 12
	mov	eax, DWORD PTR [ebp+8]
	.loc 2 101 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE25:
	.size	memcpy, .-memcpy
	.globl	memchr
	.type	memchr, @function
memchr:
.LFB26:
	.loc 2 103 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
.LBB4:
	.loc 2 104 14
	mov	DWORD PTR [ebp-4], 0
	.loc 2 104 5
	jmp	.L53
.L56:
	.loc 2 105 26
	mov	edx, DWORD PTR [ebp-4]
	.loc 2 105 27
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	movsx	eax, al
	.loc 2 105 9
	cmp	DWORD PTR [ebp+12], eax
	jne	.L54
	.loc 2 106 33
	mov	edx, DWORD PTR [ebp-4]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	jmp	.L55
.L54:
	.loc 2 104 5 discriminator 2
	add	DWORD PTR [ebp-4], 1
.L53:
	.loc 2 104 21 discriminator 1
	mov	eax, DWORD PTR [ebp-4]
	.loc 2 104 23 discriminator 1
	cmp	eax, DWORD PTR [ebp+16]
	jb	.L56
.LBE4:
	.loc 2 109 12
	mov	eax, 0
.L55:
	.loc 2 110 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE26:
	.size	memchr, .-memchr
	.globl	strsep
	.type	strsep, @function
strsep:
.LFB27:
	.loc 2 118 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	.loc 2 119 11
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-4], eax
.L62:
	.loc 2 121 13
	mov	eax, DWORD PTR [ebp-4]
	movzx	eax, BYTE PTR [eax]
	.loc 2 121 9
	cmp	al, 47
	je	.L58
	.loc 2 121 13 discriminator 1
	mov	eax, DWORD PTR [ebp-4]
	movzx	eax, BYTE PTR [eax]
	cmp	al, 92
	jne	.L59
.L58:
	.loc 2 122 20
	mov	eax, DWORD PTR [ebp-4]
	jmp	.L60
.L59:
	.loc 2 124 17
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-4], edx
	.loc 2 124 13
	movzx	eax, BYTE PTR [eax]
	.loc 2 124 20
	test	al, al
	sete	al
	.loc 2 124 9
	test	al, al
	je	.L62
	.loc 2 125 20
	mov	eax, 0
.L60:
	.loc 2 128 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE27:
	.size	strsep, .-strsep
	.globl	strrsep
	.type	strrsep, @function
strrsep:
.LFB28:
	.loc 2 132 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	.loc 2 133 11
	mov	DWORD PTR [ebp-4], 0
	.loc 2 134 11
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-8], eax
.L68:
	.loc 2 136 13
	mov	eax, DWORD PTR [ebp-8]
	movzx	eax, BYTE PTR [eax]
	.loc 2 136 9
	cmp	al, 47
	je	.L64
	.loc 2 136 13 discriminator 1
	mov	eax, DWORD PTR [ebp-8]
	movzx	eax, BYTE PTR [eax]
	cmp	al, 92
	jne	.L65
.L64:
	.loc 2 137 18
	mov	eax, DWORD PTR [ebp-8]
	mov	DWORD PTR [ebp-4], eax
.L65:
	.loc 2 139 17
	mov	eax, DWORD PTR [ebp-8]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-8], edx
	.loc 2 139 13
	movzx	eax, BYTE PTR [eax]
	.loc 2 139 20
	test	al, al
	sete	al
	.loc 2 139 9
	test	al, al
	je	.L68
	.loc 2 140 20
	mov	eax, DWORD PTR [ebp-4]
	.loc 2 143 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE28:
	.size	strrsep, .-strrsep
	.section	.rodata
	.align 4
.LC0:
	.string	"char* _ltoa(long int, char*, int)"
	.align 4
.LC1:
	.string	"/home/dever/OSdevelop/workspace/lib/string.cpp"
.LC2:
	.string	"radix unknown!"
.LC3:
	.string	"ERROR"
	.text
	.globl	_ltoa
	.type	_ltoa, @function
_ltoa:
.LFB29:
	.loc 2 147 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 84
	.cfi_offset 3, -12
	.loc 2 148 5
	cmp	DWORD PTR [ebp+16], 0
	jle	.L71
	.loc 2 148 9 discriminator 1
	cmp	DWORD PTR [ebp+16], 16
	jle	.L72
.L71:
	.loc 2 149 9
	sub	esp, 8
	push	149
	push	OFFSET FLAT:.LC0
	push	OFFSET FLAT:.LC1
	push	OFFSET FLAT:.LC1
	push	OFFSET FLAT:.LC2
	push	OFFSET FLAT:.LC3
	call	_normal_log
	add	esp, 32
	.loc 2 150 16
	mov	eax, DWORD PTR [ebp+12]
	jmp	.L78
.L72:
	.loc 2 152 10
	mov	DWORD PTR [ebp-37], 0
	mov	DWORD PTR [ebp-33], 0
	mov	DWORD PTR [ebp-29], 0
	mov	DWORD PTR [ebp-25], 0
	mov	DWORD PTR [ebp-21], 0
	mov	BYTE PTR [ebp-17], 0
	.loc 2 153 11
	lea	eax, [ebp-37]
	mov	DWORD PTR [ebp-44], eax
	.loc 2 154 10
	mov	DWORD PTR [ebp-81], 858927408
	mov	DWORD PTR [ebp-77], 926299444
	mov	DWORD PTR [ebp-73], 1111570744
	mov	DWORD PTR [ebp-69], 1178944579
	mov	DWORD PTR [ebp-65], 1246316615
	mov	DWORD PTR [ebp-61], 1313688651
	mov	DWORD PTR [ebp-57], 1381060687
	mov	DWORD PTR [ebp-53], 1448432723
	mov	DWORD PTR [ebp-49], 1515804759
	mov	BYTE PTR [ebp-45], 0
	.loc 2 155 10
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-12], eax
	.loc 2 156 18
	mov	DWORD PTR [ebp-16], 0
	.loc 2 157 5
	cmp	DWORD PTR [ebp+16], 10
	jne	.L75
	.loc 2 157 21 discriminator 1
	cmp	DWORD PTR [ebp+8], 0
	jns	.L75
	.loc 2 158 17
	mov	eax, DWORD PTR [ebp+8]
	neg	eax
	mov	DWORD PTR [ebp-12], eax
	.loc 2 159 9
	mov	ecx, DWORD PTR [ebp+12]
	.loc 2 159 19
	mov	eax, DWORD PTR [ebp-16]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-16], edx
	.loc 2 159 21
	add	eax, ecx
	.loc 2 159 23
	mov	BYTE PTR [eax], 45
.L75:
	.loc 2 162 38 discriminator 1
	mov	eax, DWORD PTR [ebp-12]
	cdq
	idiv	DWORD PTR [ebp+16]
	mov	eax, edx
	.loc 2 162 45 discriminator 1
	movzx	eax, BYTE PTR [ebp-81+eax]
	.loc 2 162 13 discriminator 1
	movsx	eax, al
	sub	esp, 8
	push	eax
	lea	eax, [ebp-44]
	push	eax
	call	push
	add	esp, 16
	.loc 2 163 17 discriminator 1
	mov	eax, DWORD PTR [ebp-12]
	cdq
	idiv	DWORD PTR [ebp+16]
	mov	DWORD PTR [ebp-12], eax
	.loc 2 164 14 discriminator 1
	cmp	DWORD PTR [ebp-12], 0
	jne	.L75
	.loc 2 165 5
	jmp	.L76
.L77:
	.loc 2 166 28
	sub	esp, 12
	lea	eax, [ebp-44]
	push	eax
	call	pop
	add	esp, 16
	mov	edx, eax
	.loc 2 166 9
	mov	ebx, DWORD PTR [ebp+12]
	.loc 2 166 19
	mov	eax, DWORD PTR [ebp-16]
	lea	ecx, [eax+1]
	mov	DWORD PTR [ebp-16], ecx
	.loc 2 166 21
	add	eax, ebx
	.loc 2 166 23
	mov	BYTE PTR [eax], dl
.L76:
	.loc 2 165 16
	mov	edx, DWORD PTR [ebp-44]
	lea	eax, [ebp-37]
	cmp	edx, eax
	jne	.L77
	.loc 2 168 15
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [ebp-16]
	add	eax, edx
	.loc 2 168 17
	mov	BYTE PTR [eax], 0
	.loc 2 169 12
	mov	eax, DWORD PTR [ebp+12]
.L78:
	.loc 2 170 1 discriminator 1
	mov	ebx, DWORD PTR [ebp-4]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE29:
	.size	_ltoa, .-_ltoa
	.section	.rodata
	.align 4
.LC4:
	.string	"char* _ultoa(long int, char*, int)"
	.text
	.globl	_ultoa
	.type	_ultoa, @function
_ultoa:
.LFB30:
	.loc 2 173 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 84
	.cfi_offset 3, -12
	.loc 2 174 5
	cmp	DWORD PTR [ebp+16], 0
	jle	.L80
	.loc 2 174 9 discriminator 1
	cmp	DWORD PTR [ebp+16], 16
	jle	.L81
.L80:
	.loc 2 175 9
	sub	esp, 8
	push	175
	push	OFFSET FLAT:.LC4
	push	OFFSET FLAT:.LC1
	push	OFFSET FLAT:.LC1
	push	OFFSET FLAT:.LC2
	push	OFFSET FLAT:.LC3
	call	_normal_log
	add	esp, 32
	.loc 2 176 16
	mov	eax, DWORD PTR [ebp+12]
	jmp	.L87
.L81:
	.loc 2 178 10
	mov	DWORD PTR [ebp-37], 0
	mov	DWORD PTR [ebp-33], 0
	mov	DWORD PTR [ebp-29], 0
	mov	DWORD PTR [ebp-25], 0
	mov	DWORD PTR [ebp-21], 0
	mov	BYTE PTR [ebp-17], 0
	.loc 2 179 11
	lea	eax, [ebp-37]
	mov	DWORD PTR [ebp-44], eax
	.loc 2 180 10
	mov	DWORD PTR [ebp-81], 858927408
	mov	DWORD PTR [ebp-77], 926299444
	mov	DWORD PTR [ebp-73], 1111570744
	mov	DWORD PTR [ebp-69], 1178944579
	mov	DWORD PTR [ebp-65], 1246316615
	mov	DWORD PTR [ebp-61], 1313688651
	mov	DWORD PTR [ebp-57], 1381060687
	mov	DWORD PTR [ebp-53], 1448432723
	mov	DWORD PTR [ebp-49], 1515804759
	mov	BYTE PTR [ebp-45], 0
	.loc 2 181 10
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-12], eax
	.loc 2 182 18
	mov	DWORD PTR [ebp-16], 0
	.loc 2 183 5
	cmp	DWORD PTR [ebp+16], 10
	jne	.L84
	.loc 2 183 21 discriminator 1
	cmp	DWORD PTR [ebp+8], 0
	jns	.L84
	.loc 2 184 17
	mov	eax, DWORD PTR [ebp+8]
	neg	eax
	mov	DWORD PTR [ebp-12], eax
	.loc 2 185 9
	mov	ecx, DWORD PTR [ebp+12]
	.loc 2 185 19
	mov	eax, DWORD PTR [ebp-16]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-16], edx
	.loc 2 185 21
	add	eax, ecx
	.loc 2 185 23
	mov	BYTE PTR [eax], 45
.L84:
	.loc 2 188 38 discriminator 1
	mov	eax, DWORD PTR [ebp-12]
	cdq
	idiv	DWORD PTR [ebp+16]
	mov	eax, edx
	.loc 2 188 45 discriminator 1
	movzx	eax, BYTE PTR [ebp-81+eax]
	.loc 2 188 13 discriminator 1
	movsx	eax, al
	sub	esp, 8
	push	eax
	lea	eax, [ebp-44]
	push	eax
	call	push
	add	esp, 16
	.loc 2 189 17 discriminator 1
	mov	eax, DWORD PTR [ebp-12]
	cdq
	idiv	DWORD PTR [ebp+16]
	mov	DWORD PTR [ebp-12], eax
	.loc 2 190 14 discriminator 1
	cmp	DWORD PTR [ebp-12], 0
	jne	.L84
	.loc 2 191 5
	jmp	.L85
.L86:
	.loc 2 192 28
	sub	esp, 12
	lea	eax, [ebp-44]
	push	eax
	call	pop
	add	esp, 16
	mov	edx, eax
	.loc 2 192 9
	mov	ebx, DWORD PTR [ebp+12]
	.loc 2 192 19
	mov	eax, DWORD PTR [ebp-16]
	lea	ecx, [eax+1]
	mov	DWORD PTR [ebp-16], ecx
	.loc 2 192 21
	add	eax, ebx
	.loc 2 192 23
	mov	BYTE PTR [eax], dl
.L85:
	.loc 2 191 16
	mov	edx, DWORD PTR [ebp-44]
	lea	eax, [ebp-37]
	cmp	edx, eax
	jne	.L86
	.loc 2 194 15
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [ebp-16]
	add	eax, edx
	.loc 2 194 17
	mov	BYTE PTR [eax], 0
	.loc 2 195 12
	mov	eax, DWORD PTR [ebp+12]
.L87:
	.loc 2 196 1 discriminator 1
	mov	ebx, DWORD PTR [ebp-4]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE30:
	.size	_ultoa, .-_ultoa
.Letext0:
	.file 3 "/home/dever/OSdevelop/workspace/include/Gowinux/types.h"
	.file 4 "/home/dever/OSdevelop/workspace/include/lib/log.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x6a2
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0x10
	.long	.LASF45
	.byte	0x21
	.long	.LASF0
	.long	.LASF1
	.long	.LLRL0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0xe
	.long	.LASF8
	.byte	0x22
	.long	0x30
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF3
	.uleb128 0x8
	.long	0x37
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF4
	.uleb128 0x11
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x8
	.long	0x4a
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0xe
	.long	.LASF9
	.byte	0x30
	.long	0x30
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x12
	.long	.LASF46
	.byte	0x4
	.byte	0x8
	.byte	0x6
	.long	0xa7
	.uleb128 0x7
	.long	0xa7
	.uleb128 0x7
	.long	0xa7
	.uleb128 0x7
	.long	0xa7
	.uleb128 0x7
	.long	0xa7
	.uleb128 0x7
	.long	0xa7
	.uleb128 0x7
	.long	0x30
	.byte	0
	.uleb128 0x9
	.long	0x3e
	.uleb128 0xc
	.long	.LASF19
	.byte	0xac
	.long	0x148
	.long	.LFB30
	.long	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0x148
	.uleb128 0x1
	.string	"num"
	.byte	0x2
	.byte	0xac
	.byte	0x19
	.long	0x154
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x3
	.long	.LASF11
	.byte	0x2
	.byte	0xac
	.byte	0x24
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x3
	.long	.LASF12
	.byte	0x2
	.byte	0xac
	.byte	0x35
	.long	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xf
	.long	.LASF21
	.long	0x169
	.uleb128 0x5
	.byte	0x3
	.long	.LC4
	.uleb128 0x2
	.long	.LASF13
	.byte	0xb2
	.byte	0xa
	.long	0x175
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.uleb128 0x6
	.string	"esp"
	.byte	0xb3
	.byte	0xb
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.long	.LASF14
	.byte	0xb4
	.byte	0xa
	.long	0x185
	.uleb128 0x3
	.byte	0x91
	.sleb128 -89
	.uleb128 0x2
	.long	.LASF15
	.byte	0xb5
	.byte	0xa
	.long	0x14d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2
	.long	.LASF16
	.byte	0xb6
	.byte	0x12
	.long	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x9
	.long	0x37
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.long	.LASF17
	.uleb128 0x8
	.long	0x14d
	.uleb128 0xa
	.long	0x3e
	.long	0x169
	.uleb128 0xb
	.long	0x16e
	.byte	0x22
	.byte	0
	.uleb128 0x8
	.long	0x159
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.long	.LASF18
	.uleb128 0xa
	.long	0x37
	.long	0x185
	.uleb128 0xb
	.long	0x16e
	.byte	0x14
	.byte	0
	.uleb128 0xa
	.long	0x37
	.long	0x195
	.uleb128 0xb
	.long	0x16e
	.byte	0x24
	.byte	0
	.uleb128 0xc
	.long	.LASF20
	.byte	0x92
	.long	0x148
	.long	.LFB29
	.long	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x231
	.uleb128 0x1
	.string	"num"
	.byte	0x2
	.byte	0x92
	.byte	0x18
	.long	0x154
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x3
	.long	.LASF11
	.byte	0x2
	.byte	0x92
	.byte	0x23
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x3
	.long	.LASF12
	.byte	0x2
	.byte	0x92
	.byte	0x34
	.long	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xf
	.long	.LASF21
	.long	0x241
	.uleb128 0x5
	.byte	0x3
	.long	.LC0
	.uleb128 0x2
	.long	.LASF13
	.byte	0x98
	.byte	0xa
	.long	0x175
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.uleb128 0x6
	.string	"esp"
	.byte	0x99
	.byte	0xb
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.long	.LASF14
	.byte	0x9a
	.byte	0xa
	.long	0x185
	.uleb128 0x3
	.byte	0x91
	.sleb128 -89
	.uleb128 0x2
	.long	.LASF15
	.byte	0x9b
	.byte	0xa
	.long	0x14d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2
	.long	.LASF16
	.byte	0x9c
	.byte	0x12
	.long	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xa
	.long	0x3e
	.long	0x241
	.uleb128 0xb
	.long	0x16e
	.byte	0x21
	.byte	0
	.uleb128 0x8
	.long	0x231
	.uleb128 0x4
	.long	.LASF22
	.byte	0x83
	.byte	0x7
	.long	0x148
	.long	.LFB28
	.long	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x28b
	.uleb128 0x1
	.string	"str"
	.byte	0x2
	.byte	0x83
	.byte	0x1b
	.long	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2
	.long	.LASF23
	.byte	0x85
	.byte	0xb
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x6
	.string	"ptr"
	.byte	0x86
	.byte	0xb
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x4
	.long	.LASF24
	.byte	0x75
	.byte	0x7
	.long	0x148
	.long	.LFB27
	.long	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x2c2
	.uleb128 0x1
	.string	"str"
	.byte	0x2
	.byte	0x75
	.byte	0x1a
	.long	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.string	"ptr"
	.byte	0x77
	.byte	0xb
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x4
	.long	.LASF25
	.byte	0x66
	.byte	0x7
	.long	0x31e
	.long	.LFB26
	.long	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x31e
	.uleb128 0x1
	.string	"str"
	.byte	0x2
	.byte	0x66
	.byte	0x1a
	.long	0x320
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1
	.string	"ch"
	.byte	0x2
	.byte	0x66
	.byte	0x23
	.long	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x3
	.long	.LASF26
	.byte	0x2
	.byte	0x66
	.byte	0x2e
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xd
	.long	.LBB4
	.long	.LBE4-.LBB4
	.uleb128 0x6
	.string	"i"
	.byte	0x68
	.byte	0xe
	.long	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.uleb128 0x9
	.long	0x325
	.uleb128 0x14
	.uleb128 0x4
	.long	.LASF27
	.byte	0x5f
	.byte	0x7
	.long	0x31e
	.long	.LFB25
	.long	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x383
	.uleb128 0x3
	.long	.LASF28
	.byte	0x2
	.byte	0x5f
	.byte	0x14
	.long	0x31e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1
	.string	"src"
	.byte	0x2
	.byte	0x5f
	.byte	0x26
	.long	0x320
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x3
	.long	.LASF26
	.byte	0x2
	.byte	0x5f
	.byte	0x32
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xd
	.long	.LBB3
	.long	.LBE3-.LBB3
	.uleb128 0x6
	.string	"i"
	.byte	0x61
	.byte	0xe
	.long	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF29
	.byte	0x58
	.byte	0x7
	.long	0x31e
	.long	.LFB24
	.long	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x3df
	.uleb128 0x3
	.long	.LASF28
	.byte	0x2
	.byte	0x58
	.byte	0x14
	.long	0x31e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1
	.string	"ch"
	.byte	0x2
	.byte	0x58
	.byte	0x1e
	.long	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x3
	.long	.LASF26
	.byte	0x2
	.byte	0x58
	.byte	0x29
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xd
	.long	.LBB2
	.long	.LBE2-.LBB2
	.uleb128 0x6
	.string	"i"
	.byte	0x5a
	.byte	0xe
	.long	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	.LASF30
	.byte	0x4b
	.byte	0x5
	.long	0x4a
	.long	.LFB23
	.long	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x442
	.uleb128 0x1
	.string	"lhs"
	.byte	0x2
	.byte	0x4b
	.byte	0x18
	.long	0x320
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1
	.string	"rhs"
	.byte	0x2
	.byte	0x4b
	.byte	0x29
	.long	0x320
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x3
	.long	.LASF26
	.byte	0x2
	.byte	0x4b
	.byte	0x35
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2
	.long	.LASF31
	.byte	0x4d
	.byte	0xb
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2
	.long	.LASF32
	.byte	0x4e
	.byte	0xb
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x4
	.long	.LASF33
	.byte	0x3e
	.byte	0x7
	.long	0x148
	.long	.LFB22
	.long	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x495
	.uleb128 0x1
	.string	"str"
	.byte	0x2
	.byte	0x3e
	.byte	0x1b
	.long	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1
	.string	"ch"
	.byte	0x2
	.byte	0x3e
	.byte	0x24
	.long	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x2
	.long	.LASF16
	.byte	0x40
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2
	.long	.LASF23
	.byte	0x41
	.byte	0xb
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x4
	.long	.LASF34
	.byte	0x34
	.byte	0x7
	.long	0x148
	.long	.LFB21
	.long	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x4da
	.uleb128 0x1
	.string	"str"
	.byte	0x2
	.byte	0x34
	.byte	0x1a
	.long	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1
	.string	"ch"
	.byte	0x2
	.byte	0x34
	.byte	0x23
	.long	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x2
	.long	.LASF16
	.byte	0x36
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x4
	.long	.LASF35
	.byte	0x29
	.byte	0x5
	.long	0x4a
	.long	.LFB20
	.long	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x520
	.uleb128 0x1
	.string	"lhs"
	.byte	0x2
	.byte	0x29
	.byte	0x18
	.long	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1
	.string	"rhs"
	.byte	0x2
	.byte	0x29
	.byte	0x29
	.long	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x2
	.long	.LASF16
	.byte	0x2b
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x4
	.long	.LASF36
	.byte	0x20
	.byte	0x8
	.long	0x26
	.long	.LFB19
	.long	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x557
	.uleb128 0x1
	.string	"str"
	.byte	0x2
	.byte	0x20
	.byte	0x1b
	.long	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2
	.long	.LASF37
	.byte	0x23
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.long	.LASF38
	.byte	0x1a
	.long	0x148
	.long	.LFB18
	.long	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x59c
	.uleb128 0x3
	.long	.LASF28
	.byte	0x2
	.byte	0x1a
	.byte	0x14
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1
	.string	"src"
	.byte	0x2
	.byte	0x1a
	.byte	0x26
	.long	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x2
	.long	.LASF39
	.byte	0x1c
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x4
	.long	.LASF40
	.byte	0xf
	.byte	0x7
	.long	0x148
	.long	.LFB17
	.long	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x5ff
	.uleb128 0x3
	.long	.LASF28
	.byte	0x2
	.byte	0xf
	.byte	0x15
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1
	.string	"src"
	.byte	0x2
	.byte	0xf
	.byte	0x27
	.long	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x3
	.long	.LASF26
	.byte	0x2
	.byte	0xf
	.byte	0x33
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x6
	.string	"ptr"
	.byte	0x11
	.byte	0xc
	.long	0x6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2
	.long	.LASF41
	.byte	0x12
	.byte	0xc
	.long	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x4
	.long	.LASF42
	.byte	0x6
	.byte	0x7
	.long	0x148
	.long	.LFB16
	.long	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x645
	.uleb128 0x3
	.long	.LASF28
	.byte	0x2
	.byte	0x6
	.byte	0x14
	.long	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1
	.string	"src"
	.byte	0x2
	.byte	0x6
	.byte	0x26
	.long	0xa7
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x6
	.string	"ptr"
	.byte	0x8
	.byte	0xc
	.long	0x6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.long	.LASF44
	.byte	0x1
	.byte	0x11
	.byte	0xd
	.long	.LFB1
	.long	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x67a
	.uleb128 0x1
	.string	"esp"
	.byte	0x1
	.byte	0x11
	.byte	0x19
	.long	0x67a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x3
	.long	.LASF43
	.byte	0x1
	.byte	0x11
	.byte	0x23
	.long	0x37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x9
	.long	0x148
	.uleb128 0x16
	.string	"pop"
	.byte	0x1
	.byte	0xc
	.byte	0xd
	.long	0x37
	.long	.LFB0
	.long	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1
	.string	"esp"
	.byte	0x1
	.byte	0xc
	.byte	0x18
	.long	0x67a
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
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
	.uleb128 0xb
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
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 7
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
	.uleb128 0xd
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.LFB0
	.long	.LFE0-.LFB0
	.long	.LFB1
	.long	.LFE1-.LFB1
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
	.long	.LFB0
	.uleb128 .LFE0-.LFB0
	.byte	0x7
	.long	.LFB1
	.uleb128 .LFE1-.LFB1
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF24:
	.string	"strsep"
.LASF8:
	.string	"size_t"
.LASF16:
	.string	"curp"
.LASF30:
	.string	"memcmp"
.LASF41:
	.string	"cur_cnt"
.LASF26:
	.string	"count"
.LASF39:
	.string	"start"
.LASF19:
	.string	"_ultoa"
.LASF12:
	.string	"radix"
.LASF44:
	.string	"push"
.LASF34:
	.string	"strchr"
.LASF13:
	.string	"stack"
.LASF21:
	.string	"__PRETTY_FUNCTION__"
.LASF10:
	.string	"long long unsigned int"
.LASF6:
	.string	"unsigned char"
.LASF42:
	.string	"strcpy"
.LASF18:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF38:
	.string	"strcat"
.LASF43:
	.string	"content"
.LASF40:
	.string	"strncpy"
.LASF29:
	.string	"memset"
.LASF28:
	.string	"dest"
.LASF25:
	.string	"memchr"
.LASF32:
	.string	"rptr"
.LASF20:
	.string	"_ltoa"
.LASF9:
	.string	"uint32"
.LASF2:
	.string	"unsigned int"
.LASF3:
	.string	"char"
.LASF45:
	.string	"GNU C++17 12.2.0 -m32 -masm=intel -mtune=generic -march=pentiumpro -g -finline-functions -ffreestanding -fno-builtin -fno-pie -fno-stack-protector"
.LASF14:
	.string	"sym_table"
.LASF35:
	.string	"strcmp"
.LASF5:
	.string	"long long int"
.LASF27:
	.string	"memcpy"
.LASF46:
	.string	"_normal_log"
.LASF4:
	.string	"short int"
.LASF15:
	.string	"abs_val"
.LASF31:
	.string	"lptr"
.LASF11:
	.string	"store"
.LASF17:
	.string	"long int"
.LASF22:
	.string	"strrsep"
.LASF23:
	.string	"last"
.LASF37:
	.string	"length"
.LASF36:
	.string	"strlen"
.LASF33:
	.string	"strrchr"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"/home/dever/OSdevelop/workspace/lib/string.cpp"
.LASF1:
	.string	"/home/dever/OSdevelop/workspace"
	.ident	"GCC: (GNU) 12.2.0"
