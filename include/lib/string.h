#ifndef __LIB_STRING_H__
#define __LIB_STRING_H__
#include "lib/stack.h"
#include <Gowinux/types.h>
namespace std {
char* strcpy(char* dest, const char* src);
char* strncpy(char* dest, const char* src, size_t count);
char* strcat(char* dest, const char* src);
size_t strlen(const char* str);
int strcmp(const char* lhs, const char* rhs);
char* strchr(const char* str, int ch);
char* strrchr(const char* str, int ch);
char* strsep(const char* str);
char* strrsep(const char* str);

int memcmp(const void* lhs, const void* rhs, size_t count);
void* memset(void* dest, int ch, size_t count);
void* memcpy(void* dest, const void* src, size_t count);
void* memchr(const void* str, int ch, size_t count);

template <typename NT>
char* itoa(const NT num, char* store, const unsigned int radix)
{
    char stack[21] = { '\0' };
    char* esp = stack;
    char sym_table[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NT abs_val = 0;
    unsigned int curp = 0;
    if (radix == 10 && num < 0) {
        abs_val = -num;
        store[curp++] = '-';
    }
    do {
        push(&esp, sym_table[abs_val % radix]);
        abs_val /= radix;
    } while (abs_val);
    while (esp != stack) {
        store[curp++] = pop(&esp);
    }
    store[curp] = '\0';
    return store;
}

template <typename NT>
char* itoa(const NT num, char* store, const unsigned int radix, bool)
{
    char stack[21] = { '\0' };
    char* esp = stack;
    char sym_table[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    unsigned int curp = 0;
    do {
        push(&esp, sym_table[num % radix]);
        num /= radix;
    } while (num);
    while (esp != stack) {
        store[curp++] = pop(&esp);
    }
    store[curp] = '\0';
    return store;
}
}

#endif /* __LIB_STRING_H__ */
