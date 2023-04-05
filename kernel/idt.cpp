#include "Gowinux/idt.h"
#include "lib/log.h"
#include "Gowinux/descptr.h"
#include "Gowinux/idt_handler.h"
extern "C" void interrupt_entry();

class InterruptDescriptorTable
{
public:
    InterruptDescriptorTable() = default;
    ~InterruptDescriptorTable() = default;
    InterruptDescriptorTable(const InterruptDescriptorTable&) = delete;
    InterruptDescriptorTable& operator=(const InterruptDescriptorTable&) = delete;
    void idt_init(){
        for(size_t i = 0; i < IDT_SIZE; i++)
        {
            table[i].offset0 = (u16)((u32)(idt_entries[i]) & 0xffff);
            table[i].offset1 = (u16)(((u32)(idt_entries[i]) >> 16) & 0xffff);
            table[i].selector = 1 << 3;
            table[i].reserved = 0;
            table[i].type = 0b1110;
            table[i].segment = 0;
            table[i].DPL = 0;
            table[i].present = 1;
        }
        ptr.base = (u32)table;
        ptr.limit = sizeof(gate_t)*IDT_SIZE - 1;
        // 	由于寄存器的限制，我们不能直接将一个地址传递给寄存器，需要通过对寄存器和内存操作符的组合来传递地址。在使用m作为操作数限定符时，gcc会将操作数存放到内存中，并返回对应的内存地址。
        // 以下内联汇编会转化为：lidt [eax+2048]
        __asm__ volatile(
            "lidt %0\n\t"::"m"(ptr):"memory"
        );
    }
private:
    gate_t table[IDT_SIZE];
    pointer_t ptr;
};

static InterruptDescriptorTable idt;

extern "C"{
    void idt_init(){
        idt.idt_init();
    }
}