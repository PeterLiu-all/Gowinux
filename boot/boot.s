[org 0x7c00]
start:
    mov ax, 3
    int 0x10

    ; 初始化段
    mov ax, 0
    mov ds, ax
    mov es, ax
    mov ss, ax
    ; mov sp, 0x7c00
    mov sp, stack_end
    mov bp, sp

    ; 初始化显存数据段
    mov ax, 0xB800
    mov es, ax

    ; mov si, number
    push greeting
    call puts

    push 4
    push 0
    push 2
    push 0
    push 0x1000
    xchg bx, bx
    call read_disk

    xchg bx, bx
    cmp word [0x1000], 0x55aa
    jnz error
    jmp 0:0x1002
    ; push 1
    ; push 0
    ; push 2
    ; push 0
    ; push 0x1000
    ; ; xchg bx, bx
    ; call write_disk

    xchg bx, bx

    ; 阻塞
    .end:
    jmp $

; read_disk(dest_mem, start_part, num_part)
read_disk:
    dest_mem equ 4
    start_part equ 8
    num_part equ 12
    push bp
    mov bp, sp
    .set_num:
        ; 设置读取扇区的数量
        mov dx, 0x1f2
        mov al, [bp+num_part]
        out dx, al
    .set_p3:
        inc dx
        mov al, [bp+start_part]
        out dx, al
    .set_p4:
        inc dx
        mov al, [bp+start_part+1]
        out dx, al
    .set_p5:
        inc dx
        mov al, [bp+start_part+2]
        out dx, al
    .set_p6:
    ; xchg bx, bx
        inc dx
        mov al, [bp+start_part+3]
        and al, 0b1111
        or al, 0b1110_0000
        out dx, al
    ; xchg bx, bx
    .set_read_p7:
        inc dx
        mov al, 0x20
        out dx, al
    .get_read_num:
        xor ecx, ecx
        mov cl, [bp+num_part]
    ; xchg bx, bx
    .read:
        push cx
        jmp .waits
        .waits_end:
        jmp .reads
        ; xchg bx, bx
        .reads_end:
        pop cx
        loop .read
    leave
    ret

    .waits:
        mov dx, 0x1f7
        .check:
            in al, dx
            jmp $+2
            jmp $+2
            jmp $+2
            and al, 0b1000_1000
            cmp al, 0b0000_1000
            jnz .check
        jmp .waits_end
    .reads:
        mov dx, 0x1f0
        mov cx, 256
        mov edi, [bp+dest_mem]
        .readw:
            in ax, dx
            ; xchg bx, bx
            jmp $+2
            jmp $+2
            jmp $+2
            ; xchg bx, bx
            mov [edi], ax
            add edi, 2
            ; xchg bx, bx
            loop .readw
        ; xchg bx, bx
        mov [bp+dest_mem], di
        jmp .reads_end

; write_disk:
;     dest_mem equ 4
;     start_part equ 8
;     num_part equ 12
;     push bp
;     mov bp, sp
;     .set_num:
;         ; 设置读取扇区的数量
;         mov dx, 0x1f2
;         mov al, [bp+num_part]
;         out dx, al
;     .set_p3:
;         inc dx
;         mov al, [bp+start_part]
;         out dx, al
;     .set_p4:
;         inc dx
;         mov al, [bp+start_part+1]
;         out dx, al
;     .set_p5:
;         inc dx
;         mov al, [bp+start_part+2]
;         out dx, al
;     .set_p6:
;     ; xchg bx, bx
;         inc dx
;         mov al, [bp+start_part+3]
;         and al, 0b1111
;         or al, 0b1110_0000
;         out dx, al
;     ; xchg bx, bx
;     .set_read_p7:
;         inc dx
;         mov al, 0x30
;         out dx, al
;     .get_read_num:
;         xor ecx, ecx
;         mov cl, [bp+num_part]
;     ; xchg bx, bx
;     .write:
;         push ecx
;         jmp .waits
;         .waits_end:
;         jmp .writes
;         .writes_end:
;         pop ecx
;         loop .write
;     leave
;     ret

;     .waits:
;         mov dx, 0x1f7
;         .check:
;             in al, dx
;             jmp $+2
;             jmp $+2
;             jmp $+2
;             and al, 0b1000_0000
;             cmp al, 0b0000_0000
;             jnz .check
;         jmp .waits_end
;     .writes:
;         mov dx, 0x1f0
;         mov cx, 256
;         mov edi, [bp+dest_mem]
;         .writew:
;             mov ax, [edi]
;             out dx, ax
;             ; xchg bx, bx
;             jmp $+2
;             jmp $+2
;             jmp $+2
;             ; xchg bx, bx
;             add edi, 2
;             ; xchg bx, bx
;             loop .writew
;         jmp .writes_end

puts:
    ; xchg bx, bx
    show_str equ 4
    push bp
    mov bp, sp
    mov ah, 0xe
    mov si, [bp+show_str]
    .next:
        mov al, [si]
        cmp al, 0
        jz .done
        int 0x10
        ; xchg bx, bx
        add si, 1
        jmp .next
    .done:
        ; xchg bx, bx
        leave
        ret


greeting:
    db "booting now...", 0xa, 0xd, 0
error:
    push .msg
    call puts
    hlt
    jmp $
    .msg db "loader error...", 0xa, 0xd, 0
stack_start:
    times 100 db 0
stack_end:

times 512 - ($ - $$) - 2 db 0
dw 0xaa55
; 编译
; nasm -f bin boot.s -o boot.bin
; 创建硬盘镜像
; $PREFIX/bin/bximage -q -hd=16 -func=create -sectsize=512 -imgmode=flat master.img
; ata0-master: type=disk, path="master.img", mode=flat
; dd if=boot.bin of=master.img bs=512 count=1 conv=notrunc
; sudo apt-get install libasound2-dev libpulse-dev libgbm1 libsdl2-2.0 libsdl2-dev