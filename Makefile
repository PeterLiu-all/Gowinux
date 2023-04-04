SRC:=$(MYOS)/workspace
BUILD:=$(SRC)/build
ASM:=$(SRC)/asm
IMG:=$(BUILD)/master.img
DEBUG:= -g
STRIP:= -s

CFLAGS:= -m32
CFLAGS+= -finline-functions
CFLAGS+= -ffreestanding
CFLAGS+= -nostdlib
CFLAGS+= -nostdinc
CFLAGS+= -nostartfiles
CFLAGS+= -fno-builtin
CFLAGS+= -fno-pic
CFLAGS+= -fno-pie
CFLAGS+= -fno-stack-protector
CFLAGS+=$(DEBUG)
# CFLAGS+=$(STRIP)
# CFLAGS+= -O2
CFLAGS+= -DGOWINUX
CFLAGS+= -DGOWINUX_DEBUG
CFLAGS+= -DSIMPLE_LOG
# CFLAGS+= -fvisibility=hidden
# CFLAGS+= --verbose
CFLAGS:=$(strip $(CFLAGS))

ASMFLAGS:= 
ASMFLAGS+= -masm=intel
ASMFLAGS:=$(strip $(ASMFLAGS))

INCLUDE:= -I$(SRC)/include -I$(SRC)

ENTRYPOINT:=0x10000

# 汇编boot.s和loader.s
$(BUILD)/boot/%.bin: $(SRC)/boot/%.s
	$(shell mkdir -p $(dir $@))
	nasm -f bin $< -o $@

# 汇编kernel的启动函数
$(BUILD)/kernel/%.o: $(SRC)/kernel/%.s
	$(shell mkdir -p $(dir $@))
	nasm -f elf32 $(DEBUG) $< -o $@

$(BUILD)/lib/%.o: $(SRC)/lib/%.s
	$(shell mkdir -p $(dir $@))
	nasm -f elf32 $(DEBUG) $< -o $@

# 编译C/C++
$(BUILD)/kernel/%.o: $(SRC)/kernel/%.cpp
	$(shell mkdir -p $(dir $@))
	$(PREFIX)/bin/$(TARGET)-gcc $(CFLAGS) $(INCLUDE) -c -x c++ $< -o $@

$(BUILD)/kernel/%.o: $(SRC)/kernel/%.c
	$(shell mkdir -p $(dir $@))
	$(PREFIX)/bin/$(TARGET)-gcc $(CFLAGS) $(INCLUDE) -Wall -std=c11 -c -x c $< -o $@

$(BUILD)/lib/%.o: $(SRC)/lib/%.cpp
	$(shell mkdir -p $(dir $@))
	$(PREFIX)/bin/$(TARGET)-gcc $(CFLAGS) $(INCLUDE) -c -x c++ $< -o $@

$(BUILD)/lib/%.o: $(SRC)/lib/%.c
	$(shell mkdir -p $(dir $@))
	$(PREFIX)/bin/$(TARGET)-gcc $(CFLAGS) $(INCLUDE) -Wall -std=c11 -c -x c $< -o $@

# 编译C/C++
$(ASM)/kernel/%.s: $(SRC)/kernel/%.cpp
	$(shell mkdir -p $(dir $@))
	$(PREFIX)/bin/$(TARGET)-gcc $(CFLAGS) $(INCLUDE) -S $(ASMFLAGS) -x c++ $< -o $@

$(ASM)/kernel/%.s: $(SRC)/kernel/%.c
	$(shell mkdir -p $(dir $@))
	$(PREFIX)/bin/$(TARGET)-gcc $(CFLAGS) $(INCLUDE) -Wall -std=c11 -S $(ASMFLAGS) -x c $< -o $@

$(ASM)/lib/%.s: $(SRC)/lib/%.cpp
	$(shell mkdir -p $(dir $@))
	$(PREFIX)/bin/$(TARGET)-gcc $(CFLAGS) $(INCLUDE) -S $(ASMFLAGS) -x c++ $< -o $@

$(ASM)/lib/%.s: $(SRC)/lib/%.c
	$(shell mkdir -p $(dir $@))
	$(PREFIX)/bin/$(TARGET)-gcc $(CFLAGS) $(INCLUDE) -Wall -std=c11 -S $(ASMFLAGS) -x c $< -o $@

# 生成kernel
$(BUILD)/kernel.bin: \
		$(BUILD)/kernel/start.o \
		$(BUILD)/kernel/main.o \
		$(BUILD)/kernel/io.o \
		$(BUILD)/kernel/console.o \
		$(BUILD)/kernel/gdt.o \
		$(BUILD)/kernel/idt_handler.o \
		$(BUILD)/kernel/idt.o \
		$(BUILD)/lib/string.o \
		$(BUILD)/lib/printk.o \
		$(BUILD)/lib/assert.o \
		$(BUILD)/lib/log.o \
		$(BUILD)/lib/task.o \
		$(BUILD)/lib/vsprintf.o 
	$(shell mkdir -p $(dir $@))
	$(PREFIX)/bin/$(TARGET)-ld -m elf_i386 -static $^ -o $@ -Ttext $(ENTRYPOINT)

# 展开bss段等
$(BUILD)/system.bin: $(BUILD)/kernel.bin
	objcopy -O binary $< $@

# 导出符号表
$(BUILD)/system.map: $(BUILD)/kernel.bin
	nm $< | sort > $@

# 生成镜像文件
$(IMG): \
	$(BUILD)/boot/boot.bin \
	$(BUILD)/boot/loader.bin \
	$(BUILD)/system.bin $(BUILD)/system.map \
	asm

	yes | $(PREFIX)/bin/bximage -q -hd=16 -func=create -sectsize=512 -imgmode=flat $@
	dd if=$(BUILD)/boot/boot.bin of=$@ bs=512 count=1 conv=notrunc
	dd if=$(BUILD)/boot/loader.bin of=$@ bs=512 count=4 seek=2 conv=notrunc
	dd if=$(BUILD)/system.bin of=$@ bs=512 count=200 seek=10 conv=notrunc

# 测试
.PHONY: test
test: clean $(IMG)
.PHONY: image
image: clean $(IMG)
.PHONY: asm
asm:	$(ASM)/kernel/main.s \
		$(ASM)/kernel/io.s \
		$(ASM)/kernel/console.s \
		$(ASM)/kernel/gdt.s \
		$(ASM)/kernel/idt.s \
		$(ASM)/lib/string.s \
		$(ASM)/lib/printk.s \
		$(ASM)/lib/assert.s \
		$(ASM)/lib/log.s \
		$(ASM)/lib/task.s \
		$(ASM)/lib/vsprintf.s 

	cp $(SRC)/kernel/start.s $(ASM)/kernel/
	cp $(SRC)/kernel/idt_handler.s $(ASM)/kernel/
	cp -r $(SRC)/boot/ $(ASM)
	echo "intel风格的代码，内嵌汇编会有问题，不要直接用这个代码编译！"
# 清理
.PHONY: clean
clean: 
	rm -rf $(BUILD)
	rm -rf $(ASM)

.PHONY: cleanasm
cleanasm: 
	rm -rf $(ASM)

# 使用bochs启动
.PHONY: bochs
bochs: clean $(IMG) 
	cd $(SRC)
	bochs -q -f $(SRC)/bochsrc

# 使用qemu启动
.PHONY: qemu
qemu: $(IMG)
	qemu-system-i386 \
	-m 32M \
	-boot c \
	-hda $<

# 使用qemu调试
.PHONY: qemug
qemug: $(IMG)
	qemu-system-i386 \
	-gdb tcp::1234 -S \
	-m 32M \
	-boot c \
	-hda $< 

# 导出为VMware的vmdk格式
$(BUILD)/master.vmdk: $(IMG)
	qemu-img convert -O vmdk $< $@

.PHONY: vmdk
vmdk: $(BUILD)/master.vmdk