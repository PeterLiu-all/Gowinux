#include "Gowinux/console.h"
#include "Gowinux/io.h"

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

    u16* ptr = (u16*)MEM_BASE;
    while (ptr != (u16*)MEM_END) {
        *ptr++ = ERASE;
    }
}

void console_t::console_write(char* buf, u32 count){
    char ch = *buf++;
    char* ptr = (char*)(this->pos);
    while (count--) {
        switch (ch) {
            case NUL:
                break;
            default:
                if (this->x >= WIDTH)
                {
                    this->x -= WIDTH;
                    this->pos -= ROW_SIZE;
                }
                *ptr++ = ch;
                *ptr++ = this->style;
                this->pos += 2;
                this->x++;
                
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