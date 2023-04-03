#include "Gowinux/gdt.h"
#include "lib/log.h"
#include "lib/string.h"

namespace {
// 定义有多少个global descriptor
constexpr static const u8 GDT_SIZE = 128;

constexpr static const u8 KERNEL_CODE_IDX = 1;
constexpr static const u8 KERNEL_DATA_IDX = 2;
constexpr static const u8 KERNEL_TSS_IDX = 3;

constexpr static const u8 USER_CODE_IDX = 4;
constexpr static const u8 USER_DATA_IDX = 5;

constexpr static const u8 KERNEL_CODE_SELECTOR = (KERNEL_CODE_IDX << 3);
constexpr static const u8 KERNEL_DATA_SELECTOR = (KERNEL_DATA_IDX << 3);
constexpr static const u8 KERNEL_TSS_SELECTOR = (KERNEL_TSS_IDX << 3);

constexpr static const u8 USER_CODE_SELECTOR = (USER_CODE_IDX << 3 | 0b11);
constexpr static const u8 USER_DATA_SELECTOR = (USER_DATA_IDX << 3 | 0b11);

// 全局描述符
struct descriptor_t /* 共 8 个字节 */
{
    unsigned short limit_low; // 段界限 0 ~ 15 位
    unsigned int base_low : 24; // 基地址 0 ~ 23 位 16M
    unsigned char type : 4; // 段类型
    unsigned char segment : 1; // 1 表示代码段或数据段，0 表示系统段
    unsigned char DPL : 2; // Descriptor Privilege Level 描述符特权等级 0 ~ 3
    unsigned char present : 1; // 存在位，1 在内存中，0 在磁盘上
    unsigned char limit_high : 4; // 段界限 16 ~ 19;
    unsigned char available : 1; // 该安排的都安排了，送给操作系统吧
    unsigned char long_mode : 1; // 64 位扩展标志
    unsigned char big : 1; // 32 位 还是 16 位;
    unsigned char granularity : 1; // 粒度 4KB 或 1B
    unsigned char base_high; // 基地址 24 ~ 31 位
} _packed;

// 段选择子
struct selector_t {
    u8 RPL : 2; // Request Privilege Level
    u8 TI : 1; // Table Indicator
    u16 index : 13;
};

// 全局描述符表指针
struct pointer_t {
    u16 limit;
    u32 base;
} _packed;

struct tss_t {
    u32 backlink; // 前一个任务的链接，保存了前一个任状态段的段选择子
    u32 esp0; // ring0 的栈顶地址
    u32 ss0; // ring0 的栈段选择子
    u32 esp1; // ring1 的栈顶地址
    u32 ss1; // ring1 的栈段选择子
    u32 esp2; // ring2 的栈顶地址
    u32 ss2; // ring2 的栈段选择子
    u32 cr3;
    u32 eip;
    u32 flags;
    u32 eax;
    u32 ecx;
    u32 edx;
    u32 ebx;
    u32 esp;
    u32 ebp;
    u32 esi;
    u32 edi;
    u32 es;
    u32 cs;
    u32 ss;
    u32 ds;
    u32 fs;
    u32 gs;
    u32 ldtr; // 局部描述符选择子
    u16 trace : 1; // 如果置位，任务切换时将引发一个调试异常
    u16 reversed : 15; // 保留不用
    u16 iobase; // I/O 位图基地址，16 位从 TSS 到 IO 权限位图的偏移
    u32 ssp; // 任务影子栈指针
} _packed;

struct GlogalDescriptorTable {
public:
    GlogalDescriptorTable() = default;
    ~GlogalDescriptorTable() = default;
    GlogalDescriptorTable(const GlogalDescriptorTable&) = delete;
    GlogalDescriptorTable& operator=(const GlogalDescriptorTable&) = delete;
    void gdt_init();
    void tss_init();
    void descriptor_init(descriptor_t* desc, u32 base, u32 limit);

private:
    descriptor_t table[GDT_SIZE]; // 内核全局描述符表
    pointer_t ptr; // 内核全局描述符表指针
    tss_t tss; // 任务状态段
};

static GlogalDescriptorTable gdt;

void GlogalDescriptorTable::descriptor_init(descriptor_t* desc, u32 base, u32 limit)
{
    DEBUG("init single Descriptor\n");
    desc->base_low = base & 0xffffff;
    desc->base_high = (base >> 24) & 0xff;
    desc->limit_low = limit & 0xffff;
    desc->limit_high = (limit >> 16) & 0xf;
}

// 初始化内核全局描述符表
void GlogalDescriptorTable::gdt_init()
{
    DEBUG("init Glogal Descriptor Table...\n");
    memset(this->table, 0, sizeof(this->table));

    descriptor_t* desc;
    desc = this->table + KERNEL_CODE_IDX;
    descriptor_init(desc, 0, 0xFFFFF);
    desc->segment = 1; // 代码段
    desc->granularity = 1; // 4K
    desc->big = 1; // 32 位
    desc->long_mode = 0; // 不是 64 位
    desc->present = 1; // 在内存中
    desc->DPL = 0; // 内核特权级
    desc->type = 0b1010; // 代码 / 非依从 / 可读 / 没有被访问过

    desc = this->table + KERNEL_DATA_IDX;
    descriptor_init(desc, 0, 0xFFFFF);
    desc->segment = 1; // 数据段
    desc->granularity = 1; // 4K
    desc->big = 1; // 32 位
    desc->long_mode = 0; // 不是 64 位
    desc->present = 1; // 在内存中
    desc->DPL = 0; // 内核特权级
    desc->type = 0b0010; // 数据 / 向上增长 / 可写 / 没有被访问过

    desc = this->table + USER_CODE_IDX;
    descriptor_init(desc, 0, 0xFFFFF);
    desc->segment = 1; // 代码段
    desc->granularity = 1; // 4K
    desc->big = 1; // 32 位
    desc->long_mode = 0; // 不是 64 位
    desc->present = 1; // 在内存中
    desc->DPL = 3; // 用户特权级
    desc->type = 0b1010; // 代码 / 非依从 / 可读 / 没有被访问过

    desc = this->table + USER_DATA_IDX;
    descriptor_init(desc, 0, 0xFFFFF);
    desc->segment = 1; // 数据段
    desc->granularity = 1; // 4K
    desc->big = 1; // 32 位
    desc->long_mode = 0; // 不是 64 位
    desc->present = 1; // 在内存中
    desc->DPL = 3; // 用户特权级
    desc->type = 0b0010; // 数据 / 向上增长 / 可写 / 没有被访问过

    this->ptr.base = (u32) & (this->table);
    this->ptr.limit = sizeof(this->table) - 1;
}

void GlogalDescriptorTable::tss_init()
{
    memset(&(this->tss), 0, sizeof((this->tss)));

    (this->tss).ss0 = KERNEL_DATA_SELECTOR;
    (this->tss).iobase = sizeof((this->tss));

    descriptor_t* desc = this->table + KERNEL_TSS_IDX;
    descriptor_init(desc, (u32) & (this->tss), sizeof((this->tss)) - 1);
    desc->segment = 0; // 系统段
    desc->granularity = 0; // 字节
    desc->big = 0; // 固定为 0
    desc->long_mode = 0; // 固定为 0
    desc->present = 1; // 在内存中
    desc->DPL = 0; // 用于任务门或调用门
    desc->type = 0b1001; // 32 位可用 tss

    __asm__ volatile(
        "ltr %%ax\n" ::"a"(KERNEL_TSS_SELECTOR));
}
}

extern "C" {
void gdt_init() { gdt.gdt_init(); }
void tss_init() { gdt.tss_init(); }
}