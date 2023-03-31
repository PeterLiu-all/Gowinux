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
static char message[] = "Hello,\vGowinux!\n"; // .data
// static char buf[1024] = { 0 }; // .bss

void kernel_init()
{
    using namespace std;
    console_init();
    gdt_init();
    // for(int i = 0; i < 100; i++)
    // {
    //     console.console_write(message, sizeof(message) - 1);
    // }
    set_style((u32)color::red | (u32)color::gray_back);
    console_write(message, sizeof(message) - 1);
    recover_style();
    console_write(message, sizeof(message) - 1);
    // console.console_write("\f\f\f\f\f", 1);
    printk("Gowinux is No.%1d!\n", 1);
    DEBUG("I'm logging!\n");
    return;
}