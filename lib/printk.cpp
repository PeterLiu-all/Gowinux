#include "lib/printk.h"
#include "lib/stdio.h"
#include "Gowinux/console.h"

static char buf[1024] = {0};

int printk(const char* fmt, ...){
    va_list args;
    int cnt = 0;

    va_start(args, fmt);

    cnt = vsprintf(buf, fmt, args);

    va_end(args);

    std::console_t* console = std::console_t::getInstance();
    console->console_write(buf, cnt);
    console = nullptr;

    return cnt;
}