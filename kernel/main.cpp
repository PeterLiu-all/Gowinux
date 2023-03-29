#include "Gowinux/gowinux.h"
#include "Gowinux/types.h"
#include "Gowinux/io.h"
#include "Gowinux/console.h"
#include "lib/string.h"
static const int magic = GOWINUX_MAGIC;
static char message[] = "Hello, Gowinux!"; // .data
static char buf[1024] = {0}; // .bss

void kernel_init(){
    using namespace std;
    console_t& console = *(console_t::getInitInstance());
    // console.console_init();
    console.console_write(message, sizeof(message) - 1);
    return;
}