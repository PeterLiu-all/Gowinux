#ifndef __LIB_REG_H__
#define __LIB_REG_H__

#define get_esp(store) __asm__ volatile("movl %%esp, %%eax" : "=a"(store)::"memory");
#define get_ebp(store) __asm__ volatile("movl %%ebp, %%eax" : "=a"(store)::"memory");
// eip要加上5就是下一条指令的开头
// 标号加f表示“forward reference”，即向前的引用，用于在代码中引用还未定义的标号
#define get_eip(store) __asm__ volatile("call 1f\n\t1: pop %0" : "=r" (store)::"memory");
#define get_eflags(store) __asm__ volatile("pushf\n\tpop %0" : "=r" (store)::"memory");
#define get_eax(store) __asm__ volatile("mov %%eax, %0" : "=r" (store)::"memory");
#define get_ebx(store) __asm__ volatile("mov %%ebx, %0" : "=r" (store)::"memory");
#define get_ecx(store) __asm__ volatile("mov %%ecx, %0" : "=r" (store)::"memory");
#define get_edx(store) __asm__ volatile("mov %%edx, %0" : "=r" (store)::"memory");
#define get_edi(store) __asm__ volatile("mov %%edi, %0" : "=r" (store)::"memory");
#define get_esi(store) __asm__ volatile("mov %%esi, %0" : "=r" (store)::"memory");
#define get_cr0(store) __asm__ volatile("mov %%cr0, %0" : "=r" (store)::"memory");
#define get_cr2(store) __asm__ volatile("mov %%cr2, %0" : "=r" (store)::"memory");
#define get_cr3(store) __asm__ volatile("mov %%cr3, %0" : "=r" (store)::"memory");
#define get_cr4(store) __asm__ volatile("mov %%cr4, %0" : "=r" (store)::"memory");
#define get_cr8(store) __asm__ volatile("mov %%cr8, %0" : "=r" (store)::"memory");

// #define get_ebp(store) __asm__ volatile("movl %%ebp, %%eax" : "=a"(store)::"memory");

// 因为要获取即时信息，所以不能使用以下函数
// inline size_t get_esp(size_t store){
//     __asm__ volatile("movl %%esp, %%eax" : "=a"(store)::"memory");
//     return store;
// }

#endif /* __LIB_REG_H__ */
