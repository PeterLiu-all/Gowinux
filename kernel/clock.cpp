#include "Gowinux/idt.h"
#include "Gowinux/io.h"
#include "lib/log.h"

constexpr static const u8 PIT_CHAN0_REG = 0x40;
constexpr static const u8 PIT_CHAN2_REG = 0x42;
constexpr static const u8 PIT_CTRL_REG = 0x43;

constexpr static const u8 HZ = 100;
constexpr static const size_t OSCILLATOR = 1193182;
constexpr static const size_t CLOCK_COUNTER = (OSCILLATOR / HZ);
constexpr static const u8 JIFFY = (1000 / HZ);

constexpr static const u8 SPEAKER_REG = 0x61;
constexpr static const u16 BEEP_HZ = 440;
constexpr static const size_t BEEP_COUNTER = (OSCILLATOR / BEEP_HZ);
constexpr static const u8 BEEP_MS = 100;

class Clock {
public:
    Clock() = default;
    Clock(Clock&&) = default;
    Clock(const Clock&) = default;
    Clock& operator=(Clock&&) = default;
    Clock& operator=(const Clock&) = default;
    ~Clock() = default;

    void clock_click(int vector)
    {
        assert(vector == 0x20);
        send_eoi(vector); // 发送中断处理结束
        jiffies++;
        INFO("clock jiffies %d ...", jiffies);
    }
    void pit_init()
    {
        // 配置计数器 0 时钟
        outb(PIT_CTRL_REG, 0b00110100);
        outb(PIT_CHAN0_REG, CLOCK_COUNTER & 0xff);
        outb(PIT_CHAN0_REG, (CLOCK_COUNTER >> 8) & 0xff);

        // 配置计数器 2 蜂鸣器
        // outb(PIT_CTRL_REG, 0b10110110);
        // outb(PIT_CHAN2_REG, (u8)BEEP_COUNTER);
        // outb(PIT_CHAN2_REG, (u8)(BEEP_COUNTER >> 8));
    }

    size_t jiffy;
    size_t volatile jiffies;
    // bool volatile beeping;
};

static Clock clock;

extern "C" {
void clock_handler(int vector){
    clock.clock_click(vector);
}

void clock_init()
{
    clock.jiffy = JIFFY;
    clock.jiffies = 0;
    // clock.beeping = false;
    clock.pit_init();
    // set_interrupt_handler(IRQ_CLOCK, (handler_t)clock_handler);
    set_interrupt_mask(IRQ_CLOCK, true);
    INFO("init clock interrupt...");
}
}