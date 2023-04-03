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
static size_t cnta = 4;
static size_t cntb = 5;


void task_a(task_frame_t* frame){
    // set_style(RED | GRAY_BACK);
    if (cnta--)
    {
        printk(itoa(frame->ebp, buf, 16));
        task_hang();
    }
    
}

void task_b(task_frame_t* frame){
    // recover_style();
    if (cntb--)
    {
        printk(itoa(frame->edi, buf, 16));
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
    
    task_t tsk1 = task_create("A", 0x111, task_a, 0xfff, 0, 0, 0);
    task_t tsk2 = task_create("B", 0x111, task_b, 0xfff, 0, 0, 0);
    task_start(&tsk1);
    task_end(&tsk1);
    task_end(&tsk2);
    printk("I'm back!\n");
    return;
}