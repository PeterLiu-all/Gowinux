#!/bin/bash

nasm -f bin boot.s -o boot.bin
echo "yes" | $PREFIX/bin/bximage -q -hd=16 -func=create -sectsize=512 -imgmode=flat master.img 
dd if=boot.bin of=master.img bs=512 count=1 conv=notrunc
