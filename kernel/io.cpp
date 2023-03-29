
#include "Gowinux/io.h"
#include "lib/string.h"
namespace std {
u8 inb(u16 port)
{
    u8 content;
    __asm__ volatile(
        "mov %1, %%dx\n\t"
        "in %%dx, %%al"
        : "=a"(content)
        : "r"(port));
    return content;
}

u16 inw(u16 port)
{
    u16 content;
    __asm__ volatile(
        "mov %1, %%dx\n\t"
        "in %%dx, %%ax"
        : "=a"(content)
        : "r"(port));
    return content;
}

void outb(u16 port, u8 value)
{
    __asm__ volatile(
        "mov %0, %%dx\n\t"
        "mov %1, %%al\n\t"
        "out %%al, %%dx"
        :
        : "r"(port), "r"(value)
        : "edx", "memory");
}

void outw(u16 port, u16 value)
{
    __asm__ volatile(
        "mov %0, %%dx\n\t"
        "mov %1, %%ax\n\t"
        "out %%ax, %%dx"
        :
        : "r"(port), "r"(value)
        : "edx", "memory");
}
}