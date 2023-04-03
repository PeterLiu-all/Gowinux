#include "lib/printk.h"
#include "lib/stdio.h"
#include "Gowinux/console.h"

static char buf[1024] = {0};

extern "C" {
int printk(const char* fmt, ...){
    va_list args;
    int cnt = 0;

    va_start(args, fmt);

    cnt = vsprintf(buf, fmt, args);

    va_end(args);

    console_write(buf, cnt);

    return cnt;
}
}