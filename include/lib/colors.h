#ifndef __GOWINUX_COLORS_H__
#define __GOWINUX_COLORS_H__

#include "Gowinux/types.h"

#ifdef __cplusplus
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
#ifdef UNSAFE_COLOR
#define BLACK			        (u32)color::black
#define BLUE			        (u32)color::blue
#define GREEN			        (u32)color::green
#define CYAN			        (u32)color::cyan
#define RED			            (u32)color::red
#define PURPLE			        (u32)color::purple
#define ORANGE			        (u32)color::orange
#define WHITE			        (u32)color::white
#define GRAY			        (u32)color::gray
#define BRIGHT_BLUE		        (u32)color::bright_blue
#define BRIGHT_GREEN	        (u32)color::bright_green
#define BRIGHT_CYAN		        (u32)color::bright_cyan
#define BRIGHT_RED	            (u32)color::bright_red
#define BRIGHT_PURPLE	        (u32)color::bright_purple
#define BRIGHT_ORANGE	        (u32)color::bright_orange
#define BRIGHT_WHITE	        (u32)color::bright_white
#define BLACK_BACK		        (u32)color::black_back
#define BLUE_BACK		        (u32)color::blue_back
#define GREEN_BACK		        (u32)color::green_back
#define CYAN_BACK		        (u32)color::cyan_back
#define RED_BACK		        (u32)color::red_back
#define PURPLE_BACK		        (u32)color::purple_back
#define ORANGE_BACK		        (u32)color::orange_back
#define WHITE_BACK		        (u32)color::white_back
#define GRAY_BACK		        (u32)color::gray_back
#define BRIGHT_BLUE_BACK		(u32)color::bright_blue_back
#define BRIGHT_GREEN_BACK		(u32)color::bright_green_back
#define BRIGHT_CYAN_BACK		(u32)color::bright_cyan_back
#define BRIGHT_RED_BACK			(u32)color::bright_red_back
#define BRIGHT_PURPLE_BACK		(u32)color::bright_purple_back
#define BRIGHT_ORANGE_BACK		(u32)color::bright_orange_back
#define BRIGHT_WHITE_BACK		(u32)color::bright_white_back  
#endif // UNSAFE_COLOR

#else
enum COLOR {
    BLACK = 0,
    BLUE = 1,
    GREEN = 2,
    CYAN = 3,
    RED = 4,
    PURPLE = 5,
    ORANGE = 6,
    WHITE = 7,
    GRAY = 8,

    BRIGHT_BLUE = 9,
    BRIGHT_GREEN = 0xA,
    BRIGHT_CYAN = 0xB,
    BRIGHT_RED = 0xC,
    BRIGHT_PURPLE = 0xD,
    BRIGHT_ORANGE = 0xE,
    BRIGHT_WHITE = 0xF,

    BLACK_BACK = 0x00,
    BLUE_BACK = 0x10,
    GREEN_BACK = 0x20,
    CYAN_BACK = 0x30,
    RED_BACK = 0x40,
    PURPLE_BACK = 0x50,
    ORANGE_BACK = 0x60,
    WHITE_BACK = 0x70,

    GRAY_BACK = 0x80,
    BRIGHT_BLUE_BACK = 0x90,
    BRIGHT_GREEN_BACK = 0xA0,
    BRIGHT_CYAN_BACK = 0xB0,
    BRIGHT_RED_BACK = 0xC0,
    BRIGHT_PURPLE_BACK = 0xD0,
    BRIGHT_ORANGE_BACK = 0xE0,
    BRIGHT_WHITE_BACK = 0xF0,
};

#endif // __cplusplus


#endif /* __GOWINUX_COLORS_H__ */
