#ifndef __LIB_STDIO_H__
#define __LIB_STDIO_H__

#include "stdarg.h"

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus
int vsprintf(char* buf, const char* fmt, va_list args);
int sprintf(char* buf, const char* fmt, ...);
#ifdef __cplusplus
}
#endif // __cplusplus
#endif /* __LIB_STDIO_H__ */
