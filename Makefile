SRC:=$(MYOS)/workspace
BUILD:=$(SRC)/build
IMG:=$(BUILD)/master.img

$(BUILD)/boot/%.bin: $(SRC)/boot/%.s
	$(shell mkdir -p $(dir $@))
	nasm -f bin $< -o $@

$(IMG): \
	$(BUILD)/boot/boot.bin \
	$(BUILD)/boot/loader.bin

	yes | $(PREFIX)/bin/bximage -q -hd=16 -func=create -sectsize=512 -imgmode=flat $@
	dd if=$(BUILD)/boot/boot.bin of=$@ bs=512 count=1 conv=notrunc
	dd if=$(BUILD)/boot/loader.bin of=$@ bs=512 count=4 seek=2 conv=notrunc

.PHONY: clean
clean: 
	rm -rf $(BUILD)

.PHONY: bochs
bochs: clean $(IMG) 
	cd $(SRC)
	bochs -q -f $(SRC)/bochsrc
