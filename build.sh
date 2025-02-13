#!/bin/bash
nasm -f bin boot.asm -o boot.bin
nasm -f bin kernel/kernel.asm -o kernel.bin
nasm -f bin kernel/kernel_art.asm -o kernel_art.bin
cat boot.bin kernel.bin > goonos.bin
