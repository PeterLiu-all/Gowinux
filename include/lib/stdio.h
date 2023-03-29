#ifndef __LIB_STDIO_H__
#define __LIB_STDIO_H__

#include "stdarg.h"

extern "C" {
int vsprintf(char* buf, const char* fmt, va_list args);
int sprintf(char* buf, const char* fmt, ...);
}
#endif /* __LIB_STDIO_H__ */
