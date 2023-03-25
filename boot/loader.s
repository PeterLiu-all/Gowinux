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

detect_memory:
    ; 将 ebx 置为 0
    xor ebx, ebx
    ; es:di 结构体的缓存位置
    mov ax, 0
    mov es, ax
    mov edi, ards_buffer
    mov edx, 0x534d4150; 固定签名
    .next:
        ; 子功能号
        mov eax, 0xe820
        ; ards 结构的大小 (字节)
        mov ecx, 20
        ; 调用 0x15 系统调用
        int 0x15
        ; 如果 CF 置位，表示出错
        jc error
        ; 将缓存指针指向下一个结构体
        add di, cx
        ; 将结构体数量加一
        inc dword [ards_count]
        cmp ebx, 0
        jnz .next

    push detecting
    call puts

    jmp prepare_protected_mode

prepare_protected_mode:
    ; xchg bx, bx; 断点
    cli; 关闭中断
    ; 打开 A20 线
    in al,  0x92
    or al, 0b10
    out 0x92, al

    lgdt [gdt_ptr]; 加载 gdt

    ; 启动保护模式
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    ; 用跳转来刷新缓存，启用保护模式
    jmp dword code_selector:protect_mode

; jmp $

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

loading:
    db "loading now...", 0xa, 0xd, 0
detecting:
    db "Detecting Memory Success...", 0xa, 0xd, 0; \n\r

error:
    mov si, .msg
    call print
    hlt; 让 CPU 停止
    jmp $
    .msg db "Loading Error!!!", 0xa, 0xd, 0

[bits 32]
protect_mode:
    ; xchg bx, bx; 断点
    mov ax, data_selector
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax; 初始化段寄存器

    mov esp, 0x10000; 修改栈顶

    jmp $

stack_start:
    times 100 db 0
stack_end:

code_selector equ (1 << 3)
data_selector equ (2 << 3)

memory_base equ 0; 内存开始的位置：基地址

; 内存界限 4G / 4K - 1
memory_limit equ ((1024 * 1024 * 1024 * 4) / (1024 * 4)) - 1

gdt_ptr:
    dw (gdt_end - gdt_base) - 1
    dd gdt_base
gdt_base:
    dd 0, 0; NULL 描述符
gdt_code:
    dw memory_limit & 0xffff; 段界限 0 ~ 15 位
    dw memory_base & 0xffff; 基地址 0 ~ 15 位
    db (memory_base >> 16) & 0xff; 基地址 16 ~ 23 位
    ; 存在 - dlp 0 - S _ 代码 - 非依从 - 可读 - 没有被访问过
    db 0b_1_00_1_1_0_1_0;
    ; 4k - 32 位 - 不是 64 位 - 段界限 16 ~ 19
    db 0b1_1_0_0_0000 | (memory_limit >> 16) & 0xf;
    db (memory_base >> 24) & 0xff; 基地址 24 ~ 31 位
gdt_data:
    dw memory_limit & 0xffff; 段界限 0 ~ 15 位
    dw memory_base & 0xffff; 基地址 0 ~ 15 位
    db (memory_base >> 16) & 0xff; 基地址 16 ~ 23 位
    ; 存在 - dlp 0 - S _ 数据 - 向上 - 可写 - 没有被访问过
    db 0b_1_00_1_0_0_1_0;
    ; 4k - 32 位 - 不是 64 位 - 段界限 16 ~ 19
    db 0b1_1_0_0_0000 | (memory_limit >> 16) & 0xf;
    db (memory_base >> 24) & 0xff; 基地址 24 ~ 31 位
gdt_end:

ards_count:
    dd 0
ards_buffer: