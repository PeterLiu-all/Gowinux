#ifndef __GOWINUX_IDT_H__
#define __GOWINUX_IDT_H__

#include "Gowinux/types.h"

#ifdef __cplusplus
extern "C"{
#endif // __cplus

#ifdef __cplusplus
constexpr static const size_t IDT_SIZE = 256;
constexpr static const size_t IDT_TAIL = 255;
constexpr static const size_t DEFINED_IDT_SIZE = 48;
#else
#define IDT_SIZE 256
#define IDT_TAIL 255
#define DEFINED_IDT_SIZE 256
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
void idt_init();

#ifdef __cplusplus
}
#endif // __cplus
#endif /* __GOWINUX_IDT_H__ */
