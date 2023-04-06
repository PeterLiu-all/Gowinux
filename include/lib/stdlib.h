#ifndef __GOWINUX_STDLIB_H__
#define __GOWINUX_STDLIB_H__

#include "Gowinux/types.h"

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

#ifdef __cplusplus
inline void delay(size_t count)
{
    while (count--)
        ;
}
inline void hang()
{
    while (true) {
        __asm__ volatile(
            "hlt\n\t"
            "pause\n\t"
            :
            :
            : "memory");
    }
}

#else
#define delay(count) \
    do {             \
    count--;  \
    } while (count)
#define hang()            \
    do {                  \
        __asm__ volatile( \
            "hlt\n\t"     \
            "pause\n\t"   \
            :             \
            :             \
            : "memory");  \
    } while (true)
#endif // __cplusplus

#ifdef __cplusplus
}
#endif // __cplusplus

#endif /* __GOWINUX_STDLIB_H__ */
