#ifndef __GOWINUX_CONSOLE_H__
#define __GOWINUX_CONSOLE_H__

#include "types.h"

extern "C"{
// 清空并重置控制台
void console_clear();
// 初始化一些参数
void console_init();
// 写入一段字符串
void console_write(char* buf, u32 count);
void set_style(u32 stl);
u32 get_style();
void recover_style();
void console_putchar(char ch);
}
#endif /* __GOWINUX_CONSOLE_H__ */
