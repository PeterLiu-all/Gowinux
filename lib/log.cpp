#include "lib/log.h"
#include "lib/printk.h"
#include "lib/string.h"

extern "C" {
void _normal_log(const char *level, const char *message, const char *file, const char *base, const char *func, unsigned int line){
    if (isbreak(message[strlen(message)-1]))
    {
        printk(
        "\n[%s] %s"
        "\tFrom ==> file: %s \n"
        "\tFrom ==> base: %s \n"
        "\tFrom ==> function: %s \n"
        "\tFrom ==> line: %u \n",
        level, message, file, base, func, line);
    }
    else
    {
        printk(
        "\n[%s] %s\n"
        "\tFrom ==> file: %s \n"
        "\tFrom ==> base: %s \n"
        "\tFrom ==> function: %s \n"
        "\tFrom ==> line: %u \n",
        level, message, file, base, func, line);
    }
    
}
}