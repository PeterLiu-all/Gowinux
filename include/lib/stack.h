#ifndef __LIB_STACK_H__
#define __LIB_STACK_H__

namespace std {
inline char pop(char** esp)
{
    return *(--(*esp));
}

inline void push(char** esp, char content)
{
    *((*esp)++) = content;
}
}

#endif /* __LIB_STACK_H__ */
