#!/bin/bash
nasm -f bin boot.asm -o boot.bin
nasm -f bin print.asm -o print.bin
nasm -f bin graphics.asm -o graphics.bin
nasm -f bin shell.asm -o shell.bin

cat boot.bin print.bin shell.bin graphics.bin > mangos.bin
