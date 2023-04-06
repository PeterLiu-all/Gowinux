#ifndef __GOWINUX_IDT_H__
#define __GOWINUX_IDT_H__

#include "Gowinux/idt_handler.h"
#include "Gowinux/types.h"
#include "lib/assert.h"

#ifdef __cplusplus
extern "C" {
#endif // __cplus

#ifdef __cplusplus
constexpr static const u8 PIC_M_CTRL = 0x20; // 主片的控制端口
constexpr static const u8 PIC_M_DATA = 0x21; // 主片的数据端口
constexpr static const u8 PIC_S_CTRL = 0xa0; // 从片的控制端口
constexpr static const u8 PIC_S_DATA = 0xa1; // 从片的数据端口
constexpr static const u8 PIC_EOI = 0x20; // 通知中断控制器中断结束

constexpr static const u8 IRQ_CLOCK = 0; // 时钟
constexpr static const u8 IRQ_KEYBOARD = 1; // 键盘
constexpr static const u8 IRQ_CASCADE = 2; // 8259 从片控制器
constexpr static const u8 IRQ_SERIAL_2 = 3; // 串口 2
constexpr static const u8 IRQ_SERIAL_1 = 4; // 串口 1
constexpr static const u8 IRQ_PARALLEL_2 = 5; // 并口 2
constexpr static const u8 IRQ_FLOPPY = 6; // 软盘控制器
constexpr static const u8 IRQ_PARALLEL_1 = 7; // 并口 1
constexpr static const u8 IRQ_RTC = 8; // 实时时钟
constexpr static const u8 IRQ_REDIRECT = 9; // 重定向 IRQ2
constexpr static const u8 IRQ_MOUSE = 12; // 鼠标
constexpr static const u8 IRQ_MATH = 13; // 协处理器 x87
constexpr static const u8 IRQ_HARDDISK = 14; // ATA 硬盘第一通道
constexpr static const u8 IRQ_HARDDISK2 = 15; // ATA 硬盘第二通道

constexpr static const u8 IRQ_MASTER_NR = 0x20; // 主片起始向量号
constexpr static const u8 IRQ_SLAVE_NR = 0x28; // 从片起始向量号
#else
#define PIC_M_CTRL 0x20 // 主片的控制端口
#define PIC_M_DATA 0x21 // 主片的数据端口
#define PIC_S_CTRL 0xa0 // 从片的控制端口
#define PIC_S_DATA 0xa1 // 从片的数据端口
#define PIC_EOI 0x20 // 通知中断控制器中断结束

#define IRQ_CLOCK 0 // 时钟
#define IRQ_KEYBOARD 1 // 键盘
#define IRQ_CASCADE 2 // 8259 从片控制器
#define IRQ_SERIAL_2 3 // 串口 2
#define IRQ_SERIAL_1 4 // 串口 1
#define IRQ_PARALLEL_2 5 // 并口 2
#define IRQ_FLOPPY 6 // 软盘控制器
#define IRQ_PARALLEL_1 7 // 并口 1
#define IRQ_RTC 8 // 实时时钟
#define IRQ_REDIRECT 9 // 重定向 IRQ2
#define IRQ_MOUSE 12 // 鼠标
#define IRQ_MATH 13 // 协处理器 x87
#define IRQ_HARDDISK 14 // ATA 硬盘第一通道
#define IRQ_HARDDISK2 15 // ATA 硬盘第二通道

#define IRQ_MASTER_NR 0x20 // 主片起始向量号
#define IRQ_SLAVE_NR 0x28 // 从片起始向量号
#endif // __cplusplus

typedef struct gate_t {
    u16 offset0; // 段内偏移 0 ~ 15 位
    u16 selector; // 代码段选择子
    u8 reserved; // 保留不用
    u8 type : 4; // 任务门/中断门/陷阱门
    u8 segment : 1; // segment = 0 表示系统段
    u8 DPL : 2; // 使用 int 指令访问的最低权限
    u8 present : 1; // 是否有效
    u16 offset1; // 段内偏移 16 ~ 31 位
} _packed gate_t;

void interrupt_init();
void send_eoi(int vector);
// 获得 IF 位
bool get_interrupt_state();
// 清除 IF 位，返回设置之前的值
bool interrupt_disable();
#ifdef __cplusplus
// 设置 IF 位，返回设置之前的值
inline void interrupt_enable() { __asm__ volatile("sti\n\t"); }
inline void set_interrupt_handler(u32 irq, handler_t handler)
{
    assert(irq >= 0 && irq < 16);
    idt_table[IRQ_MASTER_NR + irq] = handler;
}
#else
#define interrupt_enable() __asm__ volatile("sti\n\t")
#define set_interrupt_handler(irq, handler)       \
    do {                                          \
        assert(irq >= 0 && irq < 16);             \
        idt_table[IRQ_MASTER_NR + irq] = handler; \
    } while (false)
#endif // __cplusplus

// 设置 IF 位
void set_interrupt_state(bool state);
void set_interrupt_mask(u32 irq, bool enable);
#ifdef __cplusplus
}
#endif // __cplus
#endif /* __GOWINUX_IDT_H__ */
