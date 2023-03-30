SRC:=$(MYOS)/workspace
BUILD:=$(SRC)/build
IMG:=$(BUILD)/master.img
DEBUG:= -g
STRIP:= -s

CFLAGS:= -m32
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
CFLAGS+= -O2
CFLAGS+= -DGOWINUX
CFLAGS+= -DGOWINUX_DEBUG
CFLAGS+= -c
# CFLAGS+= --verbose
CFLAGS:=$(strip $(CFLAGS))

INCLUDE:= -I$(SRC)/include

ENTRYPOINT:=0x10000

# 汇编boot.s和loader.s
$(BUILD)/boot/%.bin: $(SRC)/boot/%.s
	$(shell mkdir -p $(dir $@))
	nasm -f bin $< -o $@

# 汇编kernel的启动函数
$(BUILD)/kernel/%.o: $(SRC)/kernel/%.s
	$(shell mkdir -p $(dir $@))
	nasm -f elf32 $(DEBUG) $< -o $@ -gdwarf

# 编译C/C++
$(BUILD)/kernel/%.o: $(SRC)/kernel/%.cpp
	$(shell mkdir -p $(dir $@))
	$(PREFIX)/bin/$(TARGET)-gcc $(CFLAGS) $(INCLUDE) -xc++ $< -o $@

$(BUILD)/kernel/%.o: $(SRC)/kernel/%.c
	$(shell mkdir -p $(dir $@))
	$(PREFIX)/bin/$(TARGET)-gcc $(CFLAGS) $(INCLUDE) -xc $< -o $@

$(BUILD)/lib/%.o: $(SRC)/lib/%.cpp
	$(shell mkdir -p $(dir $@))
	$(PREFIX)/bin/$(TARGET)-gcc $(CFLAGS) $(INCLUDE) -xc++ $< -o $@

$(BUILD)/lib/%.o: $(SRC)/lib/%.c
	$(shell mkdir -p $(dir $@))
	$(PREFIX)/bin/$(TARGET)-gcc $(CFLAGS) $(INCLUDE) -xc $< -o $@

# 生成kernel
$(BUILD)/kernel.bin: \
		$(BUILD)/kernel/start.o \
		$(BUILD)/kernel/main.o \
		$(BUILD)/kernel/io.o \
		$(BUILD)/kernel/console.o \
		$(BUILD)/lib/string.o \
		$(BUILD)/lib/printk.o \
		$(BUILD)/lib/assert.o \
		$(BUILD)/lib/log.o \
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
	$(BUILD)/system.bin $(BUILD)/system.map

	yes | $(PREFIX)/bin/bximage -q -hd=16 -func=create -sectsize=512 -imgmode=flat $@
	dd if=$(BUILD)/boot/boot.bin of=$@ bs=512 count=1 conv=notrunc
	dd if=$(BUILD)/boot/loader.bin of=$@ bs=512 count=4 seek=2 conv=notrunc
	dd if=$(BUILD)/system.bin of=$@ bs=512 count=200 seek=10 conv=notrunc

# 测试
test: clean $(IMG)

# 清理
.PHONY: clean
clean: 
	rm -rf $(BUILD)

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