#ifndef __LIB_MEMORY_H__
#define __LIB_MEMORY_H__

#include "Gowinux/types.h"

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

int memcmp(const void* lhs, const void* rhs, size_t count);
void* memset(void* dest, int ch, size_t count);
void* memcpy(void* dest, const void* src, size_t count);
void* memchr(const void* str, int ch, size_t count);

#ifdef __cplusplus
}
#endif // __cplusplus

#endif /* __LIB_MEMORY_H__ */
