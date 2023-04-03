#ifndef __LIB_STACK_H__
#define __LIB_STACK_H__

#include "Gowinux/types.h"
#include "lib/reg.h"

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

#ifdef __cplusplus
inline char pop(char** esp)
{
    return *(--(*esp));
}

inline void push(char** esp, char content)
{
    *((*esp)++) = content;
}

inline size_t get_page_start(size_t esp){
    return esp & (size_t)~(0xfff);
}

inline size_t get_page_end(size_t esp){
    return (esp & (size_t)~(0xfff)) + 0x1000;
}
#else
#define pop(esp) (*(--(*esp)))
#define push(esp, content) *((*esp)++) = content
#define get_page_start(esp) (esp & (size_t)~(0xfff))
#define get_page_end(esp) ((esp & (size_t)~(0xfff)) + 0x1000)
#endif // __cplusplus


#ifdef __cplusplus
}
#endif // __cplusplus

#endif /* __LIB_STACK_H__ */
