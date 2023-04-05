#include "Gowinux/types.h"
#include "lib/stdlib.h"
#include "lib/log.h"

typedef void* handler_t;
#define  SYSCALL_SIZE  0x181
#define  SYSCALL_TAIL  0x180

void syscall_check(size_t eax){
    if (eax >= SYSCALL_SIZE)
    {
        ERROR("SYSCALL NO.%d is illegal!", eax);
        hang();
    }
}

static size_t default_syscall(
    size_t ebx, 
    size_t ecx, 
    size_t edx, 
    size_t esi, 
    size_t edi, 
    size_t ebp
){
    INFO(
        "This is a default syscall...\n"
        "\tEBX:0x%x\n"
        "\tECX:0x%x\n"
        "\tEDX:0x%x\n"
        "\tESI:0x%x\n"
        "\tEDI:0x%x\n"
        "\tEBP:0x%x\n",
        ebx, ecx, edx, esi, edi, ebp
    );
    return 0;
}

handler_t syscall_table[SYSCALL_SIZE] = {
    [0 ... SYSCALL_TAIL] = default_syscall
};