#ifndef __LIB_TASK_H__
#define __LIB_TASK_H__

#include "Gowinux/types.h"
#ifdef __cplusplus
constexpr static const size_t FREETASK_SIGN = ~((size_t)0);
#else
#define  FREETASK_SIGN  (~((size_t)0))
#endif // __cplusplus

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus
typedef struct task_frame_t {
    size_t name;
    size_t ebp; // ebp用于传递更多的参数！使用的时候可以强制转换为结构体或者数组的指针！
    size_t eip;
    // 下面四个是直接传递的参数
    size_t edi;
    size_t esi;
    size_t edx;
    size_t ecx;
}task_frame_t;

typedef struct task_t {
    // 这里esp指向的位置，也是ebp、eip、其他四个参数的位置
    union {
        size_t esp;
        task_frame_t* frame;
    };
}task_t;

#ifdef __cplusplus
using TASK_FUNC_TYPE = void (*)(task_frame_t*);
#else
typedef void(*TASK_FUNC_TYPE)(task_frame_t*);
#endif // __cplusplus

// 初始化task
void task_init();
// 创建一个task
task_t task_create(size_t name,
    size_t ebp,
    TASK_FUNC_TYPE eip,
    size_t edi,
    size_t esi,
    size_t edx,
    size_t ecx);
// 挂起task
void task_hang();
// 结束任务
void task_end(task_t* task);
void task_start(task_t* task);
#ifdef __cplusplus
}
#endif // __cplusplus

#endif /* __LIB_TASK_H__ */
