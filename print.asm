[bits 16]

mov	ax, 0
mov	dx, ax
mov	es, ax
mov	ss, ax
mov	bp, 0x7c00
mov	sp, bp

print_string:
	cld
	mov	ah, 0x0e
	.char:
		lodsb
		cmp	al, 0
		je	.ret
		int	0x10
		jmp	.char
	.ret:
		ret

times	510 - ($-$$) db 0
