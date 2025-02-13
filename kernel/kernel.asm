[org 0x7C00 + 512]

mov	ax, 0
mov	dx, ax
mov	es, ax
mov	ss, ax
mov	bp, 0x7c00
mov	sp, bp

start:
	call	print_string
	call	create_icons
	jmp	os_main_loop
print_string:
	mov	ah, 0x0e
	.char:
		lodsb
		cmp	al, 0
		je	.ret
		int	0x10
		jmp	.char
	.ret: ret
os_main_loop:
	mov	si, hello
	call	print_string
	hlt
	jmp	os_main_loop
create_icons:
	mov	cx, 0
	mov	ah, 0x0e
	mov	bx, 16
	call	.bar
	.bar:
		cmp	cx, bx
		jge	.next
		cmp	cx, 15
		je	.bar_fill
		mov	al, 10
		int	0x10
		inc	cx	
		jmp	.bar
		.next:
			mov	al, 219
			int	0x10
			ret
		.bar_fill:

			jmp	.bar_fill
hello db "goon", 0		
times	510 - ($-$$) db 0
