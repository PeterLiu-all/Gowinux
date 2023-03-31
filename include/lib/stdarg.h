#ifndef __LIB_STDARG_H__
#define __LIB_STDARG_H__

#ifdef __cplusplus
using va_list = char*;
#else
typedef char* va_list;
#endif // __cplusplus


#define va_start(args_ptr, var) (args_ptr = (va_list)&var + sizeof(char*))
#define va_arg(args_ptr, type) (*(type*)((args_ptr += sizeof(char*)) - sizeof(char*)))
#define va_end(args_ptr) (args_ptr = (va_list) nullptr)

#endif /* __LIB_STDARG_H__ */
