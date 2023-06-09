#ifndef __GOWINUX_TYPES_H__
#define __GOWINUX_TYPES_H__

// stdbool.h的内容
/* Don't define bool, true, and false in C++, except as a GNU extension. */
#ifndef __cplusplus
#define bool _Bool
#define true 1
#define false 0
#elif defined(__GNUC__) && !defined(__STRICT_ANSI__)
/* Define _Bool as a GNU extension. */
#define _Bool bool
#if __cplusplus < 201103L
/* For C++98, define bool, false, true as a GNU extension. */
#define bool  bool
#define false false
#define true  true
#endif
#endif

#define __bool_true_false_are_defined 1

#define EOF -1
#define EOS '\0'
#ifdef __cplusplus
#define NULL nullptr
#else
#define NULL ((void*)0)
#endif

#define _packed __attribute__((packed))

#ifdef __cplusplus
using size_t = unsigned int;

using int8 = char;
using int16 = short;
using int32 = int;
using int64 = long long;

using i8 = char;
using i16 = short;
using i32 = int;
using i64 = long long;

using uint8 = unsigned char;
using uint16 = unsigned short;
using uint32 = unsigned int;
using uint64 = unsigned long long;

using u8 = unsigned char;
using u16 = unsigned short;
using u32 = unsigned int;
using u64 = unsigned long long;
#else
typedef unsigned int size_t;
typedef char int8;
typedef short int16;
typedef int int32;
typedef long long int64;

typedef char i8;
typedef short i16;
typedef int i32;
typedef long long i64;

typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;
typedef unsigned long long uint64;

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;
#endif // __cplusplus

#endif /* __GOWINUX_TYPES_H__ */
