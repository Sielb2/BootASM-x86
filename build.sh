#!/bin/bash
nasm -f bin boot.asm -o boot.bin
nasm -f bin kernel/kernel.asm -o kernel.bin
cat boot.bin kernel.bin > goonos.bin
