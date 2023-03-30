#include "lib/log.h"
#include "lib/printk.h"
#include "lib/string.h"

void _normal_log(const char *level, const char *message, const char *file, const char *base, const char *func, unsigned int line){
    if (message[std::strlen(message)-1] == '\n')
    {
        printk(
        "\n[%s] %s"
        "From ==> file: %s \n"
        "From ==> base: %s \n"
        "From ==> function: %s \n"
        "From ==> line: %u \n",
        level, message, file, base, func, line);
    }
    else
    {
        printk(
        "\n[%s] %s\n"
        "From ==> file: %s \n"
        "From ==> base: %s \n"
        "From ==> function: %s \n"
        "From ==> line: %u \n",
        level, message, file, base, func, line);
    }
    
}