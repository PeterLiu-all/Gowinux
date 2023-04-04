[bits 32]

section .text

extern _simple_log

global interrupt_handler
interrupt_handler:
    push message
    push level
    call _simple_log
    pop ecx
    pop ebx
    iret
message:
    db "using interrupt handler...", 0xa, 0
level:
    db "INFO", 0