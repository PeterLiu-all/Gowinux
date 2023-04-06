#ifndef __TRASH_IDT_HANDLER_H__
#define __TRASH_IDT_HANDLER_H__
#include "lib/log.h"
#include "Gowinux/types.h"

#ifdef __cplusplus
constexpr static const size_t IDT_SIZE = 256;
constexpr static const size_t IDT_TAIL = 255;
#else
#define IDT_SIZE 256
#define IDT_TAIL 255
#endif // __cplusplus
#ifdef __cplusplus
using handler_t = void*;
#else
typedef void* handler_t;
#endif // __cplus

#ifdef __cplusplus
extern "C" handler_t idt_table[IDT_SIZE];
extern  "C" handler_t idt_entries[IDT_SIZE];
extern "C" void interrupt_entry();
extern "C" void syscall_handler();
#else
extern handler_t idt_table[IDT_SIZE];
extern handler_t idt_entries[IDT_SIZE];
extern void interrupt_entry();
extern void syscall_handler();
#endif // __cplus

#endif /* __TRASH_IDT_HANDLER_H__ */
