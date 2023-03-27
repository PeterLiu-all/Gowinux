#include "Gowinux/gowinux.h"
#include "Gowinux/types.h"
#include "Gowinux/io.h"
#include "lib/string.h"
static const int magic = GOWINUX_MAGIC;
static char message[] = "Hello, Gowinux!"; // .data
static char buf[1024] = {0}; // .bss

void kernel_init(){
    char* video_memory = (char*) 0xB8000; // 显存位置
    // std::itoa<int>(100, buf, 10);
    std::outb(CRT_ADDR_REG, CRT_CURSOR_H);
    u16 pos = std::inb(CRT_DATA_REG) << 8;
    std::outb(CRT_ADDR_REG, CRT_CURSOR_L);
    pos |= std::inb(CRT_DATA_REG);

    for(int i = 0; i < sizeof(message); i++)
    {
        video_memory[i*2] = message[i];
    }
    
}