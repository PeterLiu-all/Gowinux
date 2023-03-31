#ifndef __GOWINUX_COLORS_H__
#define __GOWINUX_COLORS_H__

#include "Gowinux/types.h"

enum class color : u32 {
    black = 0,
    blue = 1,
    green = 2,
    cyan = 3,
    red = 4,
    purple = 5,
    orange = 6,
    white = 7,
    gray = 8,

    bright_blue = 9,
    bright_green = 0xA,
    bright_cyan = 0xB,
    bright_red = 0xC,
    bright_purple = 0xD,
    bright_orange = 0xE,
    bright_white = 0xF,

    black_back = 0x00,
    blue_back = 0x10,
    green_back = 0x20,
    cyan_back = 0x30,
    red_back = 0x40,
    purple_back = 0x50,
    orange_back = 0x60,
    white_back = 0x70,

    gray_back = 0x80,
    bright_blue_back = 0x90,
    bright_green_back = 0xA0,
    bright_cyan_back = 0xB0,
    bright_red_back = 0xC0,
    bright_purple_back = 0xD0,
    bright_orange_back = 0xE0,
    bright_white_back = 0xF0,
};

#endif /* __GOWINUX_COLORS_H__ */
