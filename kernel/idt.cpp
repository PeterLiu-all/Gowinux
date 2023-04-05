#include "Gowinux/idt.h"
#include "Gowinux/descptr.h"
#include "Gowinux/idt_handler.h"
#include "Gowinux/io.h"
#include "lib/log.h"
#include "lib/reg.h"

extern "C" void interrupt_entry();
extern "C" void syscall_handler();

#define CLEAR_IF __asm__ volatile("cli\n\t")
#define SET_IF __asm__ volatile("sti\n\t")

class InterruptDescriptorTable {
public:
    InterruptDescriptorTable() = default;
    ~InterruptDescriptorTable() = default;
    InterruptDescriptorTable(const InterruptDescriptorTable&) = delete;
    InterruptDescriptorTable& operator=(const InterruptDescriptorTable&) = delete;
    void idt_init()
    {
        for (size_t i = 0; i < IDT_SIZE; i++) {
            table[i].offset0 = (u16)((u32)(idt_entries[i]) & 0xffff);
            table[i].offset1 = (u16)(((u32)(idt_entries[i]) >> 16) & 0xffff);
            table[i].selector = 1 << 3;
            table[i].reserved = 0;
            table[i].type = 0b1110;
            table[i].segment = 0;
            table[i].DPL = 0;
            table[i].present = 1;
        }

        table[0x80].DPL = 3; // 0x80号中断：syscall处于用户态

        ptr.base = (u32)table;
        ptr.limit = sizeof(gate_t) * IDT_SIZE - 1;
        // 	由于寄存器的限制，我们不能直接将一个地址传递给寄存器，需要通过对寄存器和内存操作符的组合来传递地址。在使用m作为操作数限定符时，gcc会将操作数存放到内存中，并返回对应的内存地址。
        // 以下内联汇编会转化为：lidt [eax+2048]
        __asm__ volatile(
            "lidt %0\n\t" ::"m"(ptr)
            : "memory");
        INFO("init Interrupt Descriptor Table...");
    }
    void pic_init()
    {
        outb(PIC_M_CTRL, 0b00010001); // ICW1: 边沿触发, 级联 8259, 需要ICW4.
        outb(PIC_M_DATA, 0x20); // ICW2: 起始中断向量号 0x20
        outb(PIC_M_DATA, 0b00000100); // ICW3: IR2接从片.
        outb(PIC_M_DATA, 0b00000001); // ICW4: 8086模式, 正常EOI

        outb(PIC_S_CTRL, 0b00010001); // ICW1: 边沿触发, 级联 8259, 需要ICW4.
        outb(PIC_S_DATA, 0x28); // ICW2: 起始中断向量号 0x28
        outb(PIC_S_DATA, 2); // ICW3: 设置从片连接到主片的 IR2 引脚
        outb(PIC_S_DATA, 0b00000001); // ICW4: 8086模式, 正常EOI

        outb(PIC_M_DATA, 0b11111111); // 关闭所有中断
        outb(PIC_S_DATA, 0b11111111); // 关闭所有中断
        INFO("init Programmable Interrupt Controller...");
    }

private:
    gate_t table[IDT_SIZE];
    pointer_t ptr;
};

static InterruptDescriptorTable idt;

extern "C" {
void interrupt_init()
{
    idt.idt_init();
    idt.pic_init();
    __asm__ volatile(
        "sti\n\t"
    );
}

// 获得 IF 位
bool get_interrupt_state()
{
    size_t eflag = 0;
    get_eflags(eflag);
    return (bool)((eflag << 9) & 0x1);
}

// 清除 IF 位，返回设置之前的值
bool interrupt_disable()
{
    bool eflag_IF = get_interrupt_state();
    CLEAR_IF;
    return eflag_IF;
}

// 设置 IF 位，返回设置之前的值
bool interrupt_enable()
{
    bool eflag_IF = get_interrupt_state();
    SET_IF;
    return eflag_IF;
}

// 设置 IF 位
bool set_interrupt_state(bool state)
{
    if (state)
        return interrupt_enable();
    else
        return interrupt_disable();
}
}