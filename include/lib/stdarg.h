#ifndef __LIB_STDARG_H__
#define __LIB_STDARG_H__

using va_list = char*;

#define va_start(ap, v) (ap = (va_list)&v + sizeof(char*))
#define va_arg(ap, t) (*(t*)((ap += sizeof(char*)) - sizeof(char*)))
#define va_end(ap) (ap = (va_list) nullptr)

#endif /* __LIB_STDARG_H__ */
