#include "lib/string.h"
#include "lib/log.h"

extern "C" {
// namespace std {
char* strcpy(char* dest, const char* src)
{
    uint32 ptr = 0;
    while (src[ptr] != EOS) {
        dest[ptr] = src[ptr];
        ptr++;
    }
    return dest;
}
char* strncpy(char* dest, const char* src, size_t count)
{
    uint32 ptr = 0;
    size_t cur_cnt = 0;
    while (src[ptr] != EOS && cur_cnt < count) {
        dest[ptr] = src[ptr];
        ptr++;
        cur_cnt++;
    }
    return dest;
}
char* strcat(char* dest, const char* src)
{
    size_t start = strlen(dest);
    strcpy(dest + start, src);
    return dest;
}
size_t strlen(const char* str)
{
    // 最后统计的字符不包括0
    size_t length = 0;
    while (str[length] != EOS) {
        length++;
    }
    return length;
}
int strcmp(const char* lhs, const char* rhs)
{
    size_t curp = 0;
    while (lhs[curp] == rhs[curp] && lhs[curp] != EOS && rhs[curp] != EOS) {
        curp++;
    }
    // lhs[curp] > rhs[curp]成立返回1，否则返回0
    // lhs[curp] < rhs[curp]成立返回-1，否则返回0
    // 都不成立返回0
    return lhs[curp] < rhs[curp] ? -1 : lhs[curp] > rhs[curp];
}
char* strchr(const char* str, int ch)
{
    size_t curp = 0;
    while (str[curp] != EOS) {
        if (str[curp] == ch) {
            return (char*)(str + curp);
        }
    }
    return nullptr;
}
char* strrchr(const char* str, int ch)
{
    size_t curp = 0;
    char* last = nullptr;
    while (str[curp] != EOS) {
        if (str[curp] == ch) {
            last = (char*)(str + curp);
        }
        curp++;
    }
    return last;
}

int memcmp(const void* lhs, const void* rhs, size_t count)
{
    char* lptr = (char*)lhs;
    char* rptr = (char*)rhs;
    while ((count > 0) && *lptr == *rptr) {
        lptr++;
        rptr++;
        count--;
    }
    if (count == 0)
        return 0;
    return *lptr < *rptr ? -1 : *lptr > *rptr;
}
void* memset(void* dest, int ch, size_t count)
{
    for (int i = 0; i < count; i++) {
        ((char*)dest)[i] = ch;
    }
    return dest;
}
void* memcpy(void* dest, const void* src, size_t count)
{
    for (int i = 0; i < count; i++) {
        ((char*)dest)[i] = ((char*)src)[i];
    }
    return dest;
}
void* memchr(const void* str, int ch, size_t count)
{
    for (int i = 0; i < count; i++) {
        if (((char*)str)[i] == ch) {
            return (char*)str + i;
        }
    }
    return nullptr;
}

#define SEPARATOR1 '/' // 目录分隔符 1
#define SEPARATOR2 '\\' // 目录分隔符 2
#define IS_SEPARATOR(c) (c == SEPARATOR1 || c == SEPARATOR2) // 字符是否位目录分隔符

// 获取第一个分隔符
char* strsep(const char* str)
{
    char* ptr = (char*)str;
    while (true) {
        if (IS_SEPARATOR(*ptr)) {
            return ptr;
        }
        if (*ptr++ == EOS) {
            return nullptr;
        }
    }
}

// 获取最后一个分隔符
char* strrsep(const char* str)
{
    char* last = nullptr;
    char* ptr = (char*)str;
    while (true) {
        if (IS_SEPARATOR(*ptr)) {
            last = ptr;
        }
        if (*ptr++ == EOS) {
            return last;
        }
    }
}
// }

char* _ltoa(const long num, char* store, const int radix)
{
    if (!(radix > 0 && radix < 17)) {
        ERROR("radix unknown!");
        return store;
    }
    char stack[21] = { '\0' };
    char* esp = stack;
    char sym_table[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    long abs_val = num;
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

char* _ultoa(const long num, char* store, const int radix)
{
    if (!(radix > 0 && radix < 17)) {
        ERROR("radix unknown!");
        return store;
    }
    char stack[21] = { '\0' };
    char* esp = stack;
    char sym_table[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    long abs_val = num;
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
}