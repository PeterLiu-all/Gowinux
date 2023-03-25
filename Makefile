SRC:=$(MYOS)/workspace
BUILD:=$(SRC)/build
IMG:=$(BUILD)/master.img

ENTRYPOINT:=0x10000

$(BUILD)/boot/%.bin: $(SRC)/boot/%.s
	$(shell mkdir -p $(dir $@))
	nasm -f bin $< -o $@

$(BUILD)/kernel/%.o: $(SRC)/kernel/%.s
	$(shell mkdir -p $(dir $@))
	nasm -f elf32 $< -o $@

$(BUILD)/kernel.bin: $(BUILD)/kernel/start.o
	$(shell mkdir -p $(dir $@))
	ld -m elf_i386 -static $^ -o $@ -Ttext $(ENTRYPOINT)

$(BUILD)/system.bin: $(BUILD)/kernel.bin
	objcopy -O binary $< $@

$(BUILD)/system.map: $(BUILD)/kernel.bin
	nm $< | sort > $@

$(IMG): \
	$(BUILD)/boot/boot.bin \
	$(BUILD)/boot/loader.bin \
	$(BUILD)/system.bin $(BUILD)/system.map

	yes | $(PREFIX)/bin/bximage -q -hd=16 -func=create -sectsize=512 -imgmode=flat $@
	dd if=$(BUILD)/boot/boot.bin of=$@ bs=512 count=1 conv=notrunc
	dd if=$(BUILD)/boot/loader.bin of=$@ bs=512 count=4 seek=2 conv=notrunc
	dd if=$(BUILD)/system.bin of=$@ bs=512 count=200 seek=10 conv=notrunc

test: $(IMG) 

.PHONY: clean
clean: 
	rm -rf $(BUILD)

.PHONY: bochs
bochs: clean $(IMG) 
	cd $(SRC)
	bochs -q -f $(SRC)/bochsrc

save: clean
	$(shell if [[ -n $* ]]; then git commit -am "$*"; else git commit -am "`date`"; fi)