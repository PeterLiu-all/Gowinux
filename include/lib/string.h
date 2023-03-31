#ifndef __LIB_STRING_H__
#define __LIB_STRING_H__
#include "lib/memory.h"
#include "lib/stack.h"
#include <Gowinux/types.h>
#ifdef __cplusplus
extern "C" {
#endif // __cplusplus
char* strcpy(char* dest, const char* src);
char* strncpy(char* dest, const char* src, size_t count);
char* strcat(char* dest, const char* src);
size_t strlen(const char* str);
int strcmp(const char* lhs, const char* rhs);
char* strchr(const char* str, int ch);
char* strrchr(const char* str, int ch);
char* strsep(const char* str);
char* strrsep(const char* str);

char* itoa(const int num, char* store, const int radix);
char* ltoa(const long num, char* store, const int radix);
// char* lltoa(const long long num, char* store, const int radix);
char* uitoa(const unsigned int num, char* store, const int radix);
char* ultoa(const unsigned long num, char* store, const int radix);
// char* ulltoa(const unsigned long long num, char* store, const int radix);

inline bool isspace(char ch) { return ch == ' ' || ch == '\t' || ch == '\n' || ch == '\f' || ch == '\b' || ch == '\r'; }
inline bool isdigit(char ch) { return ch >= '0' && ch <= '9'; }
inline bool isalpha(char ch) { return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z'); }
inline bool ispunct(char ch) { return (ch >= '!' && ch <= '/') || (ch >= ':' && ch <= '@') || (ch >= '[' && ch <= '`') || (ch >= '{' && ch <= '~'); }
inline bool isprint(char ch) { return ch >= 32 && ch <= 126; }
inline bool isnull(char ch) { return ch == 0; }
inline bool isdel(char ch) { return ch == 0x7F; }
inline bool isbreak(char ch) { return ch == '\n'; }
#ifdef __cplusplus
}
#endif // __cplusplus

#endif /* __LIB_STRING_H__ */
