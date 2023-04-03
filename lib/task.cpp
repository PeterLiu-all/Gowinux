#include "lib/task.h"
#include "lib/stack.h"

static size_t base_stack;
static size_t task_stack;
static size_t cur_task;
static size_t task_num;
constexpr static const size_t stage = sizeof(task_frame_t);
// #define init_stack(task)     \
//     do {                     \
//         task.esp -= stage;   \
//         task_stack -= stage; \
//     } while (0)

void switch_task()
{
    // 防止switch到当前任务
    size_t cnt = task_num - 1;
    size_t next = cur_task;
    while (cnt--) {
        next += (stage * 8);
        if (next >= base_stack) {
            next = task_stack;
        } else if (((task_frame_t*)next)->name != FREETASK_SIGN) {
            cur_task = next;
            break;
        }
    }
    cur_task = next;
}

size_t find_spare_task(){
    size_t finder = task_stack;
    while (((task_frame_t*)finder)->name != FREETASK_SIGN && finder != base_stack) {
        finder += (stage*8);
    }
    return finder;
}

extern "C" {
// 初始化task
void task_init()
{
    size_t esp;
    get_esp(esp);
    base_stack = get_page_start(esp);
    cur_task = (task_stack = base_stack);
    task_num = 0;
}
// 创建一个task
task_t task_create(
    size_t name,
    size_t ebp,
    TASK_FUNC_TYPE eip,
    size_t edi,
    size_t esi,
    size_t edx,
    size_t ecx)
{
    task_t task;
    if ((task.esp = find_spare_task()) == base_stack)
    {
        task_stack -= (stage * 8);
        task.esp = task_stack;
    }
    task.frame->name = name;
    task.frame->ebp = ebp;
    task.frame->eip = (size_t)eip;
    task.frame->edi = edi;
    task.frame->esi = esi;
    task.frame->edx = edx;
    task.frame->ecx = ecx;
    task_num++;
    return task;
}
// 挂起task
void task_hang()
{
    switch_task();
    // __asm__ volatile(
    //     "call %%eax\n\t"
    //     :
    //     : "a"(((task_frame_t*)cur_task)->eip)
    //     : "memory");
    (*(TASK_FUNC_TYPE)(((task_frame_t*)cur_task)->eip))((task_frame_t*)cur_task);
}
// 结束任务
void task_end(task_t* task){
    task->frame->name = FREETASK_SIGN;
}

void task_start(task_t* task){
    cur_task = task->esp;
    // __asm__ volatile(
    //     "call %%eax\n\t"
    //     :
    //     : "a"(((task_frame_t*)cur_task)->eip)
    //     : "memory");
    (*(TASK_FUNC_TYPE)(((task_frame_t*)cur_task)->eip))((task_frame_t*)cur_task);
}

}