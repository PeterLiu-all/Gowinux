#include "lib/assert.h"
#include "lib/printk.h"
#include "lib/stdarg.h"
#include "lib/stdio.h"

static char buf[1024] = {0};

// 强制阻塞
static void spin(const char *name)
{
    printk("\n[X] spinning in [ %s ] ...\n", name);
    // __asm__ volatile (
    // ".spin_stop_now_%=: \n\t"
    // "jmp .spin_stop_now_%= \n\t"
    // :
    // :
    // : "memory"
    // );
    // __asm__ volatile (
    //     ".spin_stop_now_%=:\n\t"
    //     "hlt\n\t"
    //     "pause\n\t"
    //     "jmp .spin_stop_now_%="
    //     : : : "memory"
    // );
    while (true){
        __asm__ volatile (
        "hlt\n\t"
        "pause\n\t"
        : : : "memory"
        );
    }
    printk("\nspin function error: reach an unbeliveable point...\n");
    // 不可能到达这里，否则使用汇编判错
    __asm__ volatile(
        "ud2"
    );
}

void assert_failed(const char *exp, const char *file, const char *base, const char* func, unsigned int line){
    printk(
        "\n--> assert expression((%s) == false) failed!\n"
        "--> file: %s \n"
        "--> base: %s \n"
        "--> function: %s \n"
        "--> line: %u \n",
        exp, file, base, func, line);
    spin(__PRETTY_FUNCTION__);
}

void panic(const char *fmt, ...){
    va_list args;
    va_start(args, fmt);
    int i = vsprintf(buf, fmt, args);
    va_end(args);
    printk("\n[X] PANIC NOW !!!\n--> %s \n", buf);
    spin(__PRETTY_FUNCTION__);
}