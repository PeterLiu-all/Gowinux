[org 0x1000]

dw 0x55aa
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

push loading
call puts

jmp $

puts:
    ; xchg bx, bx
    pop bx
    pop si
    push bx
    push bp
    mov bp, sp
    mov ah, 0xe
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

loading:
    db "loading now...", 0xa, 0xd, 0

stack_start:
    times 100 db 0
stack_end: