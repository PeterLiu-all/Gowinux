#include "Gowinux/gowinux.h"

static const int magic = GOWINUX_MAGIC;
static char message[] = "Hello, Gowinux!\n";
static char buf[1024] = {0};

void kernel_init(){
    char* video_memory = (char*) 0xB8000; // 显存位置
    for(int i = 0; i < sizeof(message); i++)
    {
        video_memory[i*2] = message[i];
    }
    
}