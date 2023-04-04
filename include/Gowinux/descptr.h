#ifndef __GOWINUX_DESCPTR_H__
#define __GOWINUX_DESCPTR_H__

#include "Gowinux/types.h"

// 全局描述符表指针
struct pointer_t {
    u16 limit;
    u32 base;
} _packed;

#endif /* __GOWINUX_DESCPTR_H__ */
