#include "Gowinux/console.h"
#include "Gowinux/io.h"
#include "lib/string.h"

namespace std {
console_t console_t::console;

void console_t::console_init(){
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

void console_t::console_clear(){
    this->screen = MEM_BASE;
    this->pos = MEM_BASE;
    this->x = this->y = 0;
    this->set_screen();
    this->set_cursor();

    this->erase_screen();
}

void console_t::console_putchar(char ch){
    if (this->x >= WIDTH)
    {
        this->command_cr();
        this->command_lf();
    }
    *(this->ptr)++ = ch;
    *(this->ptr)++ = this->style;
    this->x++;
}

void console_t::erase_screen(){
    u16* cptr = (u16*)(this->screen);
    while (cptr < (u16*)(this->screen + SCR_SIZE)) {
        *cptr++ = ERASE;
    }
}

void console_t::command_bel(){
    // todo \a
}

void console_t::command_bs(){
    if (this->x)
    {
        this->x--;
        this->pos -= 2;
    }
}

void console_t::command_del(){
    *(u16*)this->pos = erase;
}

void console_t::command_ht(){
    // todo \t
}

void console_t::scroll_up(){
    // 假如滚动之后达到了显存的末端
    if ((this->screen + SCR_SIZE + ROW_SIZE) >= MEM_END)
    {
        // 将目前一屏幕的内容拷贝到显存开始的地方
        memcpy((void*)MEM_BASE, (void*)(this->screen), SCR_SIZE);
        // 回退pos
        this->pos -= (this->screen - MEM_BASE);
        // 重置screen
        this->screen = MEM_BASE;
    }
    // 不论怎么样都需要滚动一行
    u16* cptr = (u16*)(this->screen + SCR_SIZE);
    for(int i = 0; i < WIDTH; i++)
    {
        *cptr++ = ERASE;
    }
    this->screen += ROW_SIZE;
    this->pos += ROW_SIZE;
    set_screen();
}

void console_t::scroll_down(){
    this->screen -= ROW_SIZE;
    if (this->screen < MEM_BASE)
    {
        this->screen = MEM_BASE;
    }
    this->set_screen();
}

void console_t::command_lf(){
    if (y + 1 < HEIGHT)
    {
        this->y++;
        this->pos += ROW_SIZE;
    }else
    {
        this->scroll_up();
    }
}

void console_t::command_vt(){
    // todo \v
}

void console_t::command_ff(){
    // todo \f
}

void console_t::command_cr(){
    this->pos -= (this->x << 1);
    this->x = 0;
}

void console_t::console_write(char* buf, u32 count){
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

void console_t::get_screen(){
    outb(CRT_ADDR_REG, CRT_START_ADDR_H);
    this->screen = inb(CRT_DATA_REG) << 8;
    outb(CRT_ADDR_REG, CRT_START_ADDR_L);
    this->screen |= inb(CRT_DATA_REG);

    this->screen <<= 1; // 每个字符有两个字节（其中一个是样式）
    this->screen += MEM_BASE; // 
}

void console_t::set_screen(){
    outb(CRT_ADDR_REG, CRT_START_ADDR_H);
    outb(CRT_DATA_REG, ((this->screen - MEM_BASE) >> 9) & 0xff);
    outb(CRT_ADDR_REG, CRT_START_ADDR_L);
    outb(CRT_DATA_REG, ((this->screen - MEM_BASE) >> 1) & 0xff);
}

void console_t::get_cursor(){
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

void console_t::set_cursor(){
    outb(CRT_ADDR_REG, CRT_CURSOR_H);
    outb(CRT_DATA_REG, ((this->pos - MEM_BASE) >> 9) & 0xff);
    outb(CRT_ADDR_REG, CRT_CURSOR_L);
    outb(CRT_DATA_REG, ((this->pos - MEM_BASE) >> 1) & 0xff);
}

}