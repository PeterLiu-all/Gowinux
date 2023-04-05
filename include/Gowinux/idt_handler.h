#ifndef __TRASH_IDT_HANDLER_H__
#define __TRASH_IDT_HANDLER_H__
#include "lib/log.h"
#include "Gowinux/idt.h"

#ifdef __cplusplus
extern "C" handler_t idt_table[IDT_SIZE];
extern  "C" handler_t idt_entries[IDT_SIZE];
#else
extern handler_t idt_table[IDT_SIZE];
extern handler_t idt_entries[IDT_SIZE];
#endif // __cplus

#endif /* __TRASH_IDT_HANDLER_H__ */
