#include "Gowinux/idt.h"
#include "Gowinux/io.h"
#include "lib/log.h"
#include "lib/printk.h"

// 本代码用于定义idt table
// 使用C99的特性（Array designators）来初始化数组

extern void interrupt_default_handler();
// 默认中断入口
extern void interrupt_default_entry();
extern void syscall_handler();

// 异常
extern void interrupt_handler_0x00();
extern void interrupt_handler_0x01();
extern void interrupt_handler_0x02();
extern void interrupt_handler_0x03();
extern void interrupt_handler_0x04();
extern void interrupt_handler_0x05();
extern void interrupt_handler_0x06();
extern void interrupt_handler_0x07();
extern void interrupt_handler_0x08();
extern void interrupt_handler_0x09();
extern void interrupt_handler_0x0a();
extern void interrupt_handler_0x0b();
extern void interrupt_handler_0x0c();
extern void interrupt_handler_0x0d();
extern void interrupt_handler_0x0e();
extern void interrupt_handler_0x0f();
extern void interrupt_handler_0x10();
extern void interrupt_handler_0x11();
extern void interrupt_handler_0x12();
extern void interrupt_handler_0x13();
extern void interrupt_handler_0x14();
extern void interrupt_handler_0x15();
extern void interrupt_handler_0x16();
extern void interrupt_handler_0x17();
extern void interrupt_handler_0x18();
extern void interrupt_handler_0x19();
extern void interrupt_handler_0x1a();
extern void interrupt_handler_0x1b();
extern void interrupt_handler_0x1c();
extern void interrupt_handler_0x1d();
extern void interrupt_handler_0x1e();
extern void interrupt_handler_0x1f();
// 外中断
extern void interrupt_handler_0x20();
extern void interrupt_handler_0x21();
extern void interrupt_handler_0x22();
extern void interrupt_handler_0x23();
extern void interrupt_handler_0x24();
extern void interrupt_handler_0x25();
extern void interrupt_handler_0x26();
extern void interrupt_handler_0x27();
extern void interrupt_handler_0x28();
extern void interrupt_handler_0x29();
extern void interrupt_handler_0x2a();
extern void interrupt_handler_0x2b();
extern void interrupt_handler_0x2c();
extern void interrupt_handler_0x2d();
extern void interrupt_handler_0x2e();
extern void interrupt_handler_0x2f();
extern void interrupt_handler_0x80();

static char* messages[] = {
    "#DE Divide Error",
    "#DB RESERVED",
    "--  NMI Interrupt",
    "#BP Breakpoint",
    "#OF Overflow",
    "#BR BOUND Range Exceeded",
    "#UD Invalid Opcode (Undefined Opcode)",
    "#NM Device Not Available (No Math Coprocessor)",
    "#DF Double Fault",
    "    Coprocessor Segment Overrun (reserved)",
    "#TS Invalid TSS",
    "#NP Segment Not Present",
    "#SS Stack-Segment Fault",
    "#GP General Protection",
    "#PF Page Fault",
    "--  (Intel reserved. Do not use.)",
    "#MF x87 FPU Floating-Point Error (Math Fault)",
    "#AC Alignment Check",
    "#MC Machine Check",
    "#XF SIMD Floating-Point Exception",
    "#VE Virtualization Exception",
    "#CP Control Protection Exception",
};

// 与汇编的调用约定契合
static void exception_handler(
    int vector,
    u32 edi, u32 esi, u32 ebp, u32 esp,
    u32 ebx, u32 edx, u32 ecx, u32 eax,
    u32 gs, u32 fs, u32 es, u32 ds,
    u32 vector0, u32 error, u32 eip, u32 cs, u32 eflags)
{
    char* message = NULL;
    // 22~31号保留，不要使用
    if (vector < 22) {
        message = messages[vector];
    } else {
        message = messages[15];
    }

    printk("\nEXCEPTION : %s \n", message);
    printk("   VECTOR : 0x%02X\n", vector);
    printk("    ERROR : 0x%08X\n", error);
    printk("   EFLAGS : 0x%08X\n", eflags);
    printk("       CS : 0x%02X\n", cs);
    printk("      EIP : 0x%08X\n", eip);
    printk("      ESP : 0x%08X\n", esp);

    bool hanging = true;

    // 阻塞
    while (hanging) {
        __asm__ volatile(
            "hlt\n\t"
            "pause\n\t"
            :
            :
            : "memory");
    }
    // 通过 EIP 的值应该可以找到出错的位置
    // 也可以在出错时，可以将 hanging 在调试器中手动设置为 0
    // 然后在下面 return 打断点，单步调试，找到出错的位置
    return;
}
// 通知中断控制器，中断处理结束
void send_eoi(int vector)
{
    if (vector >= 0x20 && vector < 0x28) {
        outb(PIC_M_CTRL, PIC_EOI);
    }
    if (vector >= 0x28 && vector < 0x30) {
        outb(PIC_M_CTRL, PIC_EOI);
        outb(PIC_S_CTRL, PIC_EOI);
    }
}

static void outer_interrupt_default_handler(int vector)
{
    send_eoi(vector);
    INFO("calling outer interrupt NO.%x...\n\tNothing happend because this is a default handler...\n", vector);
}

// 每个中断实际做什么，但是0x80号中断：syscall的行为依赖于系统调用号
// 所以0x80号会跳转到一个查表的函数里
handler_t idt_table[IDT_SIZE] = {
    [0 ... 31] = exception_handler,
    [32 ... 47] = outer_interrupt_default_handler,
    [48 ... 127] = interrupt_default_handler,
    [128] = syscall_handler,
    [129 ... IDT_TAIL] = interrupt_default_handler
};

handler_t idt_entries[IDT_SIZE] = {
    [0] = interrupt_handler_0x00,
    [1] = interrupt_handler_0x01,
    [2] = interrupt_handler_0x02,
    [3] = interrupt_handler_0x03,
    [4] = interrupt_handler_0x04,
    [5] = interrupt_handler_0x05,
    [6] = interrupt_handler_0x06,
    [7] = interrupt_handler_0x07,
    [8] = interrupt_handler_0x08,
    [9] = interrupt_handler_0x09,
    [10] = interrupt_handler_0x0a,
    [11] = interrupt_handler_0x0b,
    [12] = interrupt_handler_0x0c,
    [13] = interrupt_handler_0x0d,
    [14] = interrupt_handler_0x0e,
    [15] = interrupt_handler_0x0f,
    [16] = interrupt_handler_0x10,
    [17] = interrupt_handler_0x11,
    [18] = interrupt_handler_0x12,
    [19] = interrupt_handler_0x13,
    [20] = interrupt_handler_0x14,
    [21] = interrupt_handler_0x15,
    [22] = interrupt_handler_0x16,
    [23] = interrupt_handler_0x17,
    [24] = interrupt_handler_0x18,
    [25] = interrupt_handler_0x19,
    [26] = interrupt_handler_0x1a,
    [27] = interrupt_handler_0x1b,
    [28] = interrupt_handler_0x1c,
    [29] = interrupt_handler_0x1d,
    [30] = interrupt_handler_0x1e,
    [31] = interrupt_handler_0x1f,
    [32] = interrupt_handler_0x20,
    [33] = interrupt_handler_0x21,
    [34] = interrupt_handler_0x22,
    [35] = interrupt_handler_0x23,
    [36] = interrupt_handler_0x24,
    [37] = interrupt_handler_0x25,
    [38] = interrupt_handler_0x26,
    [39] = interrupt_handler_0x27,
    [40] = interrupt_handler_0x28,
    [41] = interrupt_handler_0x29,
    [42] = interrupt_handler_0x2a,
    [43] = interrupt_handler_0x2b,
    [44] = interrupt_handler_0x2c,
    [45] = interrupt_handler_0x2d,
    [46] = interrupt_handler_0x2e,
    [47] = interrupt_handler_0x2f,
    [48 ... 127] = interrupt_default_handler,
    [128] = interrupt_handler_0x80,
    [129 ... IDT_TAIL] = interrupt_default_handler
};