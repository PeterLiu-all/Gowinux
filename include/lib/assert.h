#ifndef __LIB_ASSERT_H__
#define __LIB_ASSERT_H__

extern "C" {
void assert_failed(const char *exp, const char *file, const char *base, const char* func, unsigned int line);
void panic(const char* fmt, ...);
}

#define assert(exp)                                                 \
    do {                                                            \
        if (!(exp))                                                   \
            assert_failed(#exp, __FILE__, __BASE_FILE__, __PRETTY_FUNCTION__, __LINE__); \
    } while (0)
#endif /* __LIB_ASSERT_H__ */
