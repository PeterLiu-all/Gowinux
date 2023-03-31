#ifndef __GOWINUX_GDT_H__
#define __GOWINUX_GDT_H__
#include "Gowinux/types.h"

extern "C"{
void gdt_init();
void tss_init();
}
#endif /* __GOWINUX_GDT_H__ */
