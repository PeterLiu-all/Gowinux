#ifndef __GOWINUX_IDT_H__
#define __GOWINUX_IDT_H__

#include "Gowinux/types.h"

#ifdef __cplusplus
extern "C"{
#endif // __cplus

#ifdef __cplusplus
constexpr static const size_t IDT_SIZE = 256;
constexpr static const size_t IDT_TAIL = 255;
constexpr static const u8 PIC_M_CTRL = 0x20; // 主片的控制端口
constexpr static const u8 PIC_M_DATA = 0x21; // 主片的数据端口
constexpr static const u8 PIC_S_CTRL = 0xa0; // 从片的控制端口
constexpr static const u8 PIC_S_DATA = 0xa1; // 从片的数据端口
constexpr static const u8 PIC_EOI = 0x20; // 通知中断控制器中断结束
#else
#define IDT_SIZE 256
#define IDT_TAIL 255
#define PIC_M_CTRL 0x20 // 主片的控制端口
#define PIC_M_DATA 0x21 // 主片的数据端口
#define PIC_S_CTRL 0xa0 // 从片的控制端口
#define PIC_S_DATA 0xa1 // 从片的数据端口
#define PIC_EOI 0x20    // 通知中断控制器中断结束
#endif // __cplusplus


typedef struct gate_t
{
    u16 offset0;    // 段内偏移 0 ~ 15 位
    u16 selector;   // 代码段选择子
    u8 reserved;    // 保留不用
    u8 type : 4;    // 任务门/中断门/陷阱门
    u8 segment : 1; // segment = 0 表示系统段
    u8 DPL : 2;     // 使用 int 指令访问的最低权限
    u8 present : 1; // 是否有效
    u16 offset1;    // 段内偏移 16 ~ 31 位
} _packed gate_t;

#ifdef __cplusplus
using handler_t = void*;
#else
typedef void * handler_t;
#endif // __cplus

void interrupt_init();
void send_eoi(int vector);
// 获得 IF 位
bool get_interrupt_state();
// 清除 IF 位，返回设置之前的值
bool interrupt_disable();
// 设置 IF 位，返回设置之前的值
bool interrupt_enable();
// 设置 IF 位
bool set_interrupt_state(bool state);

#ifdef __cplusplus
}
#endif // __cplus
#endif /* __GOWINUX_IDT_H__ */
