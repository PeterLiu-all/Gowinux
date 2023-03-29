#include "Gowinux/console.h"
#include "Gowinux/gowinux.h"
#include "Gowinux/io.h"
#include "Gowinux/types.h"
#include "lib/string.h"
#include "lib/printk.h"
static const int magic = GOWINUX_MAGIC;
static char message[] = "Hello,\vGowinux!\n"; // .data
static char buf[1024] = { 0 }; // .bss

void kernel_init()
{
    using namespace std;
    console_t& console = *(console_t::getInstance());
    console.console_init();
    // for(int i = 0; i < 100; i++)
    // {
    //     console.console_write(message, sizeof(message) - 1);
    // }
    console.set_style((u32)color::red | (u32)color::gray_back);
    console.console_write(message, sizeof(message) - 1);
    console.recover_style();
    console.console_write(message, sizeof(message) - 1);
    printk("Gowinux is No.%1d!\n", 1);
    return;
}