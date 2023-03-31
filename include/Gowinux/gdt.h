#ifndef __GOWINUX_GDT_H__
#define __GOWINUX_GDT_H__
#include "Gowinux/types.h"

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

void gdt_init();
void tss_init();

#ifdef __cplusplus
}
#endif // __cplusplus
#endif /* __GOWINUX_GDT_H__ */
