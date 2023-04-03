#ifndef __LIB_STRING_H__
#define __LIB_STRING_H__
#include "Gowinux/types.h"
#include "lib/memory.h"
#include "lib/stack.h"
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

char* _ltoa(const long num, char* store, const int radix);
char* _ultoa(const long num, char* store, const int radix);

#ifdef __cplusplus
inline char* itoa(const int num, char* store, const int radix)
{
    return _ltoa(num, store, radix);
}
inline char* ltoa(const long num, char* store, const int radix) { return _ltoa(num, store, radix); }
// char* lltoa(const long long num, char* store, const int radix);
inline char* uitoa(const unsigned int num, char* store, const int radix) { return _ultoa(num, store, radix); }
inline char* ultoa(const unsigned long num, char* store, const int radix) { return _ultoa(num, store, radix); }
inline bool isspace(char ch) { return ch == ' ' || ch == '\t' || ch == '\n' || ch == '\f' || ch == '\b' || ch == '\r'; }
inline bool isdigit(char ch) { return ch >= '0' && ch <= '9'; }
inline bool isalpha(char ch) { return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z'); }
inline bool ispunct(char ch) { return (ch >= '!' && ch <= '/') || (ch >= ':' && ch <= '@') || (ch >= '[' && ch <= '`') || (ch >= '{' && ch <= '~'); }
inline bool isprint(char ch) { return ch >= 32 && ch <= 126; }
inline bool isnull(char ch) { return ch == 0; }
inline bool isdel(char ch) { return ch == 0x7F; }
inline bool isbreak(char ch) { return ch == '\n'; }
#else
#define itoa(num, store, radix) _ltoa(num, store, radix)
#define ltoa(num, store, radix) _ltoa(num, store, radix)
#define uitoa(num, store, radix) _ultoa(num, store, radix)
#define ultoa(num, store, radix) _ultoa(num, store, radix)
#define isspace(ch) ((bool)((ch) == ' ' || (ch) == '\t' || (ch) == '\n' || (ch) == '\f' || (ch) == '\b' || (ch) == '\r'))
#define isdigit(ch) ((bool)((ch) >= '0' && (ch) <= '9'))
#define isalpha(ch) ((bool)(((ch) >= 'a' && (ch) <= 'z') || ((ch) >= 'A' && (ch) <= 'Z')))
#define ispunct(ch) ((bool)(((ch) >= '!' && (ch) <= '/') || ((ch) >= ':' && (ch) <= '@') || ((ch) >= '[' && (ch) <= '`') || ((ch) >= '{' && (ch) <= '~')))
#define isprint(ch) ((bool)((ch) >= 32 && (ch) <= 126))
#define isnull(ch) ((bool)((ch) == 0))
#define isdel(ch) ((bool)((ch) == 0x7F))
#define isbreak(ch) ((bool)((ch) == '\n'))
#endif // __cplusplus

// char* ulltoa(const unsigned long long num, char* store, const int radix);

#ifdef __cplusplus
}
#endif // __cplusplus

#endif /* __LIB_STRING_H__ */
