#ifndef __LIB_PRINTK_H__
#define __LIB_PRINTK_H__

#include "stdarg.h"

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus
int printk(const char* fmt, ...);
#ifdef __cplusplus
}
#endif // __cplusplus

#endif /* __LIB_PRINTK_H__ */
