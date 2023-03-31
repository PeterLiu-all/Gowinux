#ifndef __LIB_STACK_H__
#define __LIB_STACK_H__

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus
inline char pop(char** esp)
{
    return *(--(*esp));
}

inline void push(char** esp, char content)
{
    *((*esp)++) = content;
}
#ifdef __cplusplus
}
#endif // __cplusplus

#endif /* __LIB_STACK_H__ */
