#include "Gowinux/console.h"
#include "Gowinux/io.h"
#include "lib/string.h"

// using namespace std;
namespace {
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

enum class state : u32 {
    STATE_NOR,
    STATE_ESC,
    STATE_QUE,
    STATE_ARG,
    STATE_CSI,
};
class console_t {
public:
    // 构造、析构函数
    static console_t* getInstance()
    {
        return &console_t::console;
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
    void set_style(u32 stl) { this->style = stl; }
    u32 get_style() { return this->style; }
    void recover_style() { this->style = STYLE; }
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
    void clear_page(size_t base);
    void command_ff(); // \f
    void command_cr(); // \r
    void command_del(); // 0x7f
    inline void save_cursor(); // 保存旧的cursor
    // 静态变量
    static console_t console;
    // 成员变量
    u32 mem_base; // 内存基地址
    u32 mem_size; // 内存大小
    u32 mem_end; // 内存结束位置

    u32 screen; // 当前屏幕位置
    u32 scr_size; // 屏幕内存大小

    union {
        u32 pos; // 当前光标位置
        char* ptr; // 位置指针
    };
    u32 x; // 光标坐标 x
    u32 y; // 光标坐标 y
    u32 saved_x; // 保存的 x
    u32 saved_y; // 保存的 y
    u32 width; // 屏幕宽度
    u32 height; // 屏幕高度
    u32 row_size; // 行内存大小

    u8 state; // 当前状态
    u32 args[ARG_NR]; // 参数
    u32 argc; // 参数数量
    u32 ques; //

    u16 erase; // 清屏字符
    u8 style; // 当前样式
};

console_t console_t::console;

void console_t::console_init()
{
    mem_base = MEM_BASE;
    mem_size = MEM_SIZE;
    mem_end = MEM_END;
    scr_size = SCR_SIZE;
    width = WIDTH;
    height = HEIGHT;
    row_size = ROW_SIZE;
    erase = ERASE;
    style = STYLE;

    console_clear();
}

void console_t::console_clear()
{
    this->screen = MEM_BASE;
    this->pos = MEM_BASE;
    this->x = this->y = 0;
    this->set_screen();
    this->set_cursor();

    this->erase_screen();
}

void console_t::console_putchar(char ch)
{
    if (this->x >= WIDTH) {
        this->command_cr();
        this->command_lf();
    }
    *(this->ptr)++ = ch;
    *(this->ptr)++ = this->style;
    this->x++;
}

inline void console_t::erase_screen()
{
    u16* cptr = (u16*)(this->screen);
    while (cptr < (u16*)(this->screen + SCR_SIZE)) {
        *cptr++ = ERASE;
    }
}

void console_t::command_bel()
{
    // todo \a
}

void console_t::command_bs()
{
    if (this->x) {
        this->x--;
        this->pos -= 2;
    }
}

void console_t::command_del()
{
    *(u16*)this->pos = erase;
}

void console_t::command_ht()
{
    auto offset = TAB_SIZE - (this->x & 7);
    this->x += offset;
    this->pos += (offset << 1);
    if (this->x >= WIDTH) {
        this->x -= WIDTH;
        this->pos -= ROW_SIZE;
        this->command_lf();
    }
}

void console_t::scroll_up()
{
    // 假如滚动之后达到了显存的末端
    if ((this->screen + SCR_SIZE + ROW_SIZE) >= MEM_END) {
        // 将目前一屏幕的内容拷贝到显存开始的地方
        memcpy((void*)MEM_BASE, (void*)(this->screen), SCR_SIZE);
        // 回退pos
        this->pos -= (this->screen - MEM_BASE);
        // 重置screen
        this->screen = MEM_BASE;
    }
    // 不论怎么样都需要滚动一行
    u16* cptr = (u16*)(this->screen + SCR_SIZE);
    for (int i = 0; i < WIDTH; i++) {
        *cptr++ = ERASE;
    }
    this->screen += ROW_SIZE;
    this->pos += ROW_SIZE;
    set_screen();
}

void console_t::scroll_down()
{
    this->screen -= ROW_SIZE;
    if (this->screen < MEM_BASE) {
        this->screen = MEM_BASE;
    }
    this->set_screen();
}

void console_t::command_lf()
{
    if (y + 1 < HEIGHT) {
        this->y++;
        this->pos += ROW_SIZE;
    } else {
        this->scroll_up();
    }
}

void console_t::command_vt()
{
    this->command_lf();
    auto change_x = this->x & (~(0b111));
    auto offset = this->x - change_x;
    this->x = change_x;
    this->pos -= (offset << 1);
}

void console_t::clear_page(size_t base)
{
    this->screen = base;
    this->pos = base;
    this->x = this->y = 0;
    this->set_screen();
    this->erase_screen();
}

void console_t::command_ff()
{
    // 假如滚动之后达到了显存的末端
    if ((this->screen + 2 * SCR_SIZE) >= MEM_END) {
        this->clear_page(MEM_BASE);
        return;
    } else {
        this->clear_page(this->screen + SCR_SIZE);
    }
}

void console_t::command_cr()
{
    this->pos -= (this->x << 1);
    this->x = 0;
}

void console_t::console_write(char* buf, u32 count)
{
    char ch = *buf++;
    char* ptr = (char*)(this->pos);
    while (count--) {
        switch (ch) {
        case NUL: // \0
            break;
        case BEL: // \a
            this->command_bel();
            break;
        case BS: // \b
            this->command_bs();
            break;
        case HT: // \t
            this->command_ht();
            break;
        case LF: // \n
            this->command_lf();
            this->command_cr();
            break;
        case VT: // \v
            this->command_vt();
            break;
        case FF: // \f
            this->command_ff();
            break;
        case CR: // \r
            this->command_cr();
            break;
        case DEL:
            this->command_del();
            break;
        default:
            this->console_putchar(ch);
            break;
        }
        ch = *buf++;
    }

    set_cursor();
}

void console_t::get_screen()
{
    outb(CRT_ADDR_REG, CRT_START_ADDR_H);
    this->screen = inb(CRT_DATA_REG) << 8;
    outb(CRT_ADDR_REG, CRT_START_ADDR_L);
    this->screen |= inb(CRT_DATA_REG);

    this->screen <<= 1; // 每个字符有两个字节（其中一个是样式）
    this->screen += MEM_BASE; //
}

inline void console_t::save_cursor()
{
    this->saved_x = this->x;
    this->saved_y = this->y;
}

void console_t::set_screen()
{
    outb(CRT_ADDR_REG, CRT_START_ADDR_H);
    outb(CRT_DATA_REG, ((this->screen - MEM_BASE) >> 9) & 0xff);
    outb(CRT_ADDR_REG, CRT_START_ADDR_L);
    outb(CRT_DATA_REG, ((this->screen - MEM_BASE) >> 1) & 0xff);
}

void console_t::get_cursor()
{
    outb(CRT_ADDR_REG, CRT_CURSOR_H);
    this->pos = inb(CRT_DATA_REG) << 8;
    outb(CRT_ADDR_REG, CRT_CURSOR_L);
    this->pos |= inb(CRT_DATA_REG);

    this->pos <<= 1;
    this->pos += MEM_BASE;

    // 通过相对位置得到x、y
    u32 delta = (this->pos - this->screen) >> 1;
    this->x = delta % WIDTH;
    this->y = delta / WIDTH;
}

void console_t::set_cursor()
{
    outb(CRT_ADDR_REG, CRT_CURSOR_H);
    outb(CRT_DATA_REG, ((this->pos - MEM_BASE) >> 9) & 0xff);
    outb(CRT_ADDR_REG, CRT_CURSOR_L);
    outb(CRT_DATA_REG, ((this->pos - MEM_BASE) >> 1) & 0xff);
}

}

extern "C" {
void console_clear() { console_t::getInstance()->console_clear(); }
void console_init() { console_t::getInstance()->console_init(); }
void console_write(char* buf, u32 count) { console_t::getInstance()->console_write(buf, count); }
void set_style(u32 stl) { console_t::getInstance()->set_style(stl); }
u32 get_style() { return console_t::getInstance()->get_style(); }
void recover_style() { console_t::getInstance()->recover_style(); }
void console_putchar(char ch) { console_t::getInstance()->console_putchar(ch); }
}