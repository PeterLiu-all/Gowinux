[bits 32]

extern idt_table

section .text

; 定义一个宏，叫做INTERRUPT_HANDLER，有两个参数
%macro INTERRUPT_HANDLER 2
; 导出interrupt_handler_%1，%1是第一个参数
global interrupt_handler_%1
; 定义标号
interrupt_handler_%1:
    ; xchg bx, bx
; 假如没有定义第二个参数，就入栈一个魔数
%ifn %2
    push 0x474C5450 ; GOWINUX_MAGIC ; PTLG
%endif
; 一定会入栈中断向量
    push %1; 压入中断向量，跳转到中断入口
    jmp interrupt_entry
%endmacro

; 假如没有人为地定义这个中断号，那么就默认使用了255号中断（最后一个中断）
interrupt_default_entry:
    push 0x474C5450
    push 255

interrupt_entry:

    ; 保存上文寄存器信息
    push ds
    push es
    push fs
    push gs
    ; PUSHA指令用于将16位寄存器按以下顺序压入堆栈：AX、CX、DX、BX、SP、BP、SI、DI。PUSHAD指令用于将32位寄存器按以下顺序压入堆栈：EAX、ECX、EDX、EBX、ESP、EBP、ESI、EDI
    ; 因此这里压入8个16位寄存器
    pusha

    ; 找到前面 push %1 压入的 中断向量
    mov eax, [esp + 12 * 4]

    ; 向中断处理函数传递参数
    push eax

    ; 调用中断处理函数，handler_table 中存储了中断处理函数的指针
    call [idt_table + eax * 4]
; call完接着执行
global interrupt_exit
interrupt_exit:

    ; 对应 push eax，调用结束恢复栈
    add esp, 4

    ; 调用信号处理函数
    ; call task_signal

    ; 恢复下文寄存器信息
    popa
    pop gs
    pop fs
    pop es
    pop ds

    ; 对应 push %1
    ; 对应 error code 或 push magic
    add esp, 8
    iret

; 生成对应的入口函数
INTERRUPT_HANDLER 0x00, 0; divide by zero
INTERRUPT_HANDLER 0x01, 0; debug
INTERRUPT_HANDLER 0x02, 0; non maskable interrupt
INTERRUPT_HANDLER 0x03, 0; breakpoint

INTERRUPT_HANDLER 0x04, 0; overflow
INTERRUPT_HANDLER 0x05, 0; bound range exceeded
INTERRUPT_HANDLER 0x06, 0; invalid opcode
INTERRUPT_HANDLER 0x07, 0; device not avilable

INTERRUPT_HANDLER 0x08, 1; double fault
INTERRUPT_HANDLER 0x09, 0; coprocessor segment overrun
INTERRUPT_HANDLER 0x0a, 1; invalid TSS
INTERRUPT_HANDLER 0x0b, 1; segment not present

INTERRUPT_HANDLER 0x0c, 1; stack segment fault
INTERRUPT_HANDLER 0x0d, 1; general protection fault
INTERRUPT_HANDLER 0x0e, 1; page fault
INTERRUPT_HANDLER 0x0f, 0; reserved

INTERRUPT_HANDLER 0x10, 0; x87 floating point exception
INTERRUPT_HANDLER 0x11, 1; alignment check
INTERRUPT_HANDLER 0x12, 0; machine check
INTERRUPT_HANDLER 0x13, 0; SIMD Floating - Point Exception

INTERRUPT_HANDLER 0x14, 0; Virtualization Exception
INTERRUPT_HANDLER 0x15, 1; Control Protection Exception
INTERRUPT_HANDLER 0x16, 0; reserved
INTERRUPT_HANDLER 0x17, 0; reserved

INTERRUPT_HANDLER 0x18, 0; reserved
INTERRUPT_HANDLER 0x19, 0; reserved
INTERRUPT_HANDLER 0x1a, 0; reserved
INTERRUPT_HANDLER 0x1b, 0; reserved

INTERRUPT_HANDLER 0x1c, 0; reserved
INTERRUPT_HANDLER 0x1d, 0; reserved
INTERRUPT_HANDLER 0x1e, 0; reserved
INTERRUPT_HANDLER 0x1f, 0; reserved

INTERRUPT_HANDLER 0x20, 0; clock 时钟中断
INTERRUPT_HANDLER 0x21, 0; keyboard 键盘中断
INTERRUPT_HANDLER 0x22, 0
INTERRUPT_HANDLER 0x23, 0; com2 串口2
INTERRUPT_HANDLER 0x24, 0; com1 串口1
INTERRUPT_HANDLER 0x25, 0
INTERRUPT_HANDLER 0x26, 0
INTERRUPT_HANDLER 0x27, 0
INTERRUPT_HANDLER 0x28, 0; rtc 实时时钟
INTERRUPT_HANDLER 0x29, 0
INTERRUPT_HANDLER 0x2a, 0
INTERRUPT_HANDLER 0x2b, 0
INTERRUPT_HANDLER 0x2c, 0
INTERRUPT_HANDLER 0x2d, 0
INTERRUPT_HANDLER 0x2e, 0; harddisk1 硬盘主通道
INTERRUPT_HANDLER 0x2f, 0; harddisk2 硬盘从通道