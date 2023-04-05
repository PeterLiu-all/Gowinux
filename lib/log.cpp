#include "lib/log.h"
#include "Gowinux/console.h"
#include "lib/stdarg.h"
#include "lib/stdio.h"
#include "lib/string.h"

static char buf[2][1024] { 0 };

extern "C" {
void _normal_log(
    const char* level,
    const char* message,
    const char* file,
    const char* base,
    const char* func,
    unsigned int line, ...)
{
    va_list args;
    size_t cnt = 0;
    char* fmt;
    if (isbreak(message[strlen(message) - 1])) {
        fmt = "\n[%s]\t%s"
              "\tFrom ==> file: %s \n"
              "\tFrom ==> base: %s \n"
              "\tFrom ==> function: %s \n"
              "\tFrom ==> line: %u \n";
    } else {
        fmt = "\n[%s]\t%s\n"
              "\tFrom ==> file: %s \n"
              "\tFrom ==> base: %s \n"
              "\tFrom ==> function: %s \n"
              "\tFrom ==> line: %u \n";
    }
    args = (va_list)&level;
    cnt = vsprintf(buf[0], fmt, args);
    va_start_t(args, line, unsigned int);
    cnt = vsprintf(buf[1], buf[0], args);
    va_end(args);
    console_write(buf[1], cnt);
}

void _simple_log(const char* level, const char* message, ...)
{
    va_list args;
    size_t cnt = 0;
    const char* fmt = "\n[%s]\t%s";
    args = (va_list)&level;
    cnt = vsprintf(buf[0], fmt, args);
    va_start(args, message);
    cnt = vsprintf(buf[1], buf[0], args);
    va_end(args);
    console_write(buf[1], cnt);
}
}