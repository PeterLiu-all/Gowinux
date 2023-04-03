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
#include "lib/task.h"
// static const int magic = GOWINUX_MAGIC;
static char message[] = "Hello,\t\vGowinux!\n"; // .data
static char buf[1024] = { 0 }; // .bss
static size_t cnta = 1;
static size_t cntb = 1;


void task_a(){
    // set_style(RED | GRAY_BACK);
    printk("A");
    if (cnta--)
    {
        task_hang();
    }
    
}

void task_b(){
    // recover_style();
    printk("B");
    if (cntb--)
    {
        task_hang();
    }
}

void kernel_init()
{
    size_t store = 0;
    console_init();
    gdt_init();
    task_init();
    set_style(WHITE);
    // for(int i = 0; i < 100; i++)
    // {
    //     console.console_write(message, sizeof(message) - 1);
    // }
    
    task_t tsk1 = task_create("A", 0x111, task_a, 0, 0, 0, 0);
    task_t tsk2 = task_create("B", 0x111, task_b, 0, 0, 0, 0);
    task_start(&tsk1);
    task_end(&tsk1);
    task_end(&tsk2);
    printk("I'm back!\n");
    return;
}