#ifndef __GOWINUX_CONSOLE_H__
#define __GOWINUX_CONSOLE_H__

#include "types.h"

namespace std
{
constexpr static u16 CRT_ADDR_REG = 0x3D4; // CRT(6845)索引寄存器
constexpr static u16 CRT_DATA_REG = 0x3D5; // CRT(6845)数据寄存器

constexpr static u8 CRT_START_ADDR_H = 0xC; // 显示内存起始位置 - 高位
constexpr static u8 CRT_START_ADDR_L = 0xD; // 显示内存起始位置 - 低位
constexpr static u8 CRT_CURSOR_H = 0xE; // 光标位置 - 高位
constexpr static u8 CRT_CURSOR_L = 0xF; // 光标位置 - 低位

constexpr static size_t MEM_BASE = 0xB8000; // 显卡内存起始位置
constexpr static size_t MEM_SIZE = 0x4000; // 显卡内存大小
constexpr static size_t MEM_END = (MEM_BASE + MEM_SIZE); // 显卡内存结束位置
constexpr static u16 WIDTH = 80; // 屏幕文本列数
constexpr static u16 HEIGHT = 25; // 屏幕文本行数
constexpr static u16 ROW_SIZE = (WIDTH * 2); // 每行字节数
constexpr static u16 SCR_SIZE = (ROW_SIZE * HEIGHT); // 屏幕字节数

constexpr static u8 NUL = 0x00;
constexpr static u8 ENQ = 0x05;
constexpr static u8 ESC = 0x1B; // ESC
constexpr static u8 BEL = 0x07; // \a
constexpr static u8 BS = 0x08; // \b
constexpr static u8 HT = 0x09; // \t
constexpr static u8 LF = 0x0A; // \n
constexpr static u8 VT = 0x0B; // \v
constexpr static u8 FF = 0x0C; // \f
constexpr static u8 CR = 0x0D; // \r
constexpr static u8 DEL = 0x7F;

constexpr static u8 STYLE = 7;
constexpr static u8 BLINK = 0x80;
constexpr static u8 BOLD = 0x0F;
constexpr static u8 UNDER = 0x0F;

constexpr static u16 ERASE = 0x0720;
constexpr static u8 ARG_NR = 16;

constexpr static u8 TAB_SIZE = 8;

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

enum class state : u32
{
    STATE_NOR,
    STATE_ESC,
    STATE_QUE,
    STATE_ARG,
    STATE_CSI,
};
class console_t
{
public:
    // 构造、析构函数
    static console_t* getInstance(){
        return &console;
    }
    // static void deleteInstance(){
    //     delete &console;
    // }
    // 清空屏幕并重置光标
    void console_clear();
    // 初始化一些参数
    void console_init();
    // 写入一段字符串
    void console_write(char* buf, u32 count);
    void set_style(u32 stl){ this->style = stl; }
    u32 get_style(){ return this->style; }
    void recover_style(){ this->style = STYLE; }
    void console_putchar(char ch);
private:
    // 私有方法
    console_t() = default;
    ~console_t() = default;
    console_t(const console_t&) = delete;
    console_t& operator=(const console_t&) = delete;
    void get_screen(); // 获得当前显示器开始的位置
    void set_screen(); // 设置当前显示器开始的位置
    void get_cursor(); // 获得当前光标开始的位置
    void set_cursor(); // 设置当前光标开始的位置
    void erase_screen();
    void command_bel(); // \a
    void command_bs(); // \b
    void command_ht(); // \t
    void command_lf(); // \n
    void scroll_up(); // 向上滚一行
    void scroll_down(); // 向下滚动一行
    void command_vt(); // \v
    void command_ff(); // \f
    void command_cr(); // \r
    void command_del(); // 0x7f
    inline void save_cursor(); // 保存旧的cursor
    // 静态变量
    static console_t console;
    // 成员变量
    u32 mem_base; // 内存基地址
    u32 mem_size; // 内存大小
    u32 mem_end;  // 内存结束位置

    u32 screen;   // 当前屏幕位置
    u32 scr_size; // 屏幕内存大小

    union
    {
        u32 pos;   // 当前光标位置
        char *ptr; // 位置指针
    };
    u32 x;        // 光标坐标 x
    u32 y;        // 光标坐标 y
    u32 saved_x;  // 保存的 x
    u32 saved_y;  // 保存的 y
    u32 width;    // 屏幕宽度
    u32 height;   // 屏幕高度
    u32 row_size; // 行内存大小

    u8 state;         // 当前状态
    u32 args[ARG_NR]; // 参数
    u32 argc;         // 参数数量
    u32 ques;         //

    u16 erase; // 清屏字符
    u8 style;  // 当前样式

};   
}

#endif /* __GOWINUX_CONSOLE_H__ */
