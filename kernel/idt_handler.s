[bits 32]

extern _simple_log
global interrupt_default_handler
interrupt_default_handler:
    push message
    push level
    call _simple_log
    pop ecx
    pop ebx
    iret
message:
    db "Default interrupt handler...", 0xa, 0
level:
    db "INFO", 0