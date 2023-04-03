#ifndef __LIB_LOG_H__
#define __LIB_LOG_H__

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

void _normal_log(
    const char* level,
    const char* message,
    const char* file,
    const char* base,
    const char* func,
    unsigned int line);

void _simple_log(const char *level, const char *message);
#ifdef __cplusplus
}
#endif // __cplusplus

#ifndef __cplusplus
#define __PRETTY_FUNCTION__ __FUNCTION__
#endif // __cplusplus

#ifdef SIMPLE_LOG
#define  INFO(msg)  _simple_log("INFO", msg)
#ifdef GOWINUX_DEBUG
#define  DEBUG(msg)  _simple_log("DEBUG", msg)
#else
#define DEBUG(msg) 
#endif
#define  ERROR(msg)  _simple_log("ERROR", msg)
#define  WARNING(msg)  _simple_log("WARNING", msg)
#else
#define INFO(msg) _normal_log("INFO", msg, __FILE__, __BASE_FILE__, __PRETTY_FUNCTION__, __LINE__)
#ifdef GOWINUX_DEBUG
#define DEBUG(msg) _normal_log("DEBUG", msg, __FILE__, __BASE_FILE__, __PRETTY_FUNCTION__, __LINE__)
#else
#define DEBUG(msg) 
#endif
#define ERROR(msg) _normal_log("ERROR", msg, __FILE__, __BASE_FILE__, __PRETTY_FUNCTION__, __LINE__)
#define WARNING(msg) _normal_log("WARNING", msg, __FILE__, __BASE_FILE__, __PRETTY_FUNCTION__, __LINE__)
#endif // SIMPLE_LOG

#endif /* __LIB_LOG_H__ */
