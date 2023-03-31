#define UNSAFE_COLOR
#include "Gowinux/console.h"
#include "Gowinux/gowinux.h"
#include "Gowinux/io.h"
#include "Gowinux/types.h"
#include "lib/string.h"
#include "lib/printk.h"
#include "lib/assert.h"
#include "lib/log.h"
#include "lib/colors.h"
#include "Gowinux/gdt.h"
// static const int magic = GOWINUX_MAGIC;
static char message[] = "Hello,\t\vGowinux!\n"; // .data
static char buf[1024] = { 0 }; // .bss

void kernel_init()
{
    console_init();
    gdt_init();
    // for(int i = 0; i < 100; i++)
    // {
    //     console.console_write(message, sizeof(message) - 1);
    // }
    set_style(RED | GRAY_BACK);
    console_write(message, sizeof(message) - 1);
    recover_style();
    console_write(message, sizeof(message) - 1);
    // console.console_write("\f\f\f\f\f", 1);
    printk("Gowinux is No.%1d!\n", 1);
    DEBUG("I'm logging!\n");
    INFO(itoa(1000000000, buf, 16));
    return;
}