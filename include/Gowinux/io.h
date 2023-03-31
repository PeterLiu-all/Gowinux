#ifndef __GOWINUX_IO_H__
#define __GOWINUX_IO_H__

#include "Gowinux/types.h"

extern "C"{
    // constexpr static u16 CRT_ADDR_REG = 0X3D4;
    // constexpr static u16 CRT_DATA_REG = 0X3D5;
    // constexpr static u8 CRT_CURSOR_H = 0XE;
    // constexpr static u8 CRT_CURSOR_L = 0XF;
    u8 inb(u16 port);
    u16 inw(u16 port);
    void outb(u16 port, u8 value);
    void outw(u16 port, u16 value);
}

#endif /* __GOWINUX_IO_H__ */
