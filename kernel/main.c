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
#include "lib/stack.h"
// static const int magic = GOWINUX_MAGIC;
static char message[] = "Hello,\t\vGowinux!\n"; // .data
static char buf[1024] = { 0 }; // .bss

void kernel_init()
{
    size_t store = 0;
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
    get_esp(store);
    INFO(itoa(get_page_start(store), buf, 16));
    INFO(itoa(get_page_end(store), buf, 16));
    get_eip(store);
    INFO(itoa(store, buf, 16));
    get_eflags(store);
    INFO(itoa(store, buf, 2));
    get_edx(store);
    INFO(itoa(store, buf, 16));
    get_edi(store);
    INFO(itoa(store, buf, 16));
    get_cr0(store);
    INFO(itoa(store, buf, 16));
    store = 1;
    get_cr8(store);
    INFO(itoa(store, buf, 16));
    if (isdigit('1'))
    {
        INFO("true");
    }
    return;
}