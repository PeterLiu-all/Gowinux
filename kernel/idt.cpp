#include "Gowinux/idt.h"
#include "lib/log.h"
#include "Gowinux/descptr.h"

extern "C" void interrupt_handler();

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
            table[i].offset0 = (u16)((u32)interrupt_handler & 0xffff);
            table[i].offset1 = (u16)(((u32)interrupt_handler >> 16) & 0xffff);
            table[i].selector = 1 << 3;
            table[i].reserved = 0;
            table[i].type = 0b1110;
            table[i].segment = 0;
            table[i].DPL = 0;
            table[i].present = 1;
        }
        ptr.base = (u32)table;
        ptr.limit = sizeof(table) - 1;
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