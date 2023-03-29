#ifndef __LIB_PRINTK_H__
#define __LIB_PRINTK_H__

#include "stdarg.h"

extern "C" {
int printk(const char* fmt, ...);
}

#endif /* __LIB_PRINTK_H__ */
