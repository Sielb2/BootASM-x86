[bits 16]
mov	ax, 0
mov	dx, ax
mov	es, ax
mov	ss, ax
mov	bp, 0x7c00
mov	sp, bp
mov	bx, big_logo

print:
	mov	ah, 0x0e
	mov	al, [bx]
	cmp	al, 0
	je	.finish
	int	0x10
	inc	bx
	jmp	print
	.finish:
		ret
big_logo db " $$$$$$\   $$$$$$\  $$\      $$\", 10 
db "$$  __$$\ $$  __$$\ $$$\    $$$ |", 10
db "$$ /  $$ |$$ /  \__|$$$$\  $$$$ |", 10
db "$$$$$$$$ |\$$$$$$\  $$\$$\$$ $$ |", 10
db "$$  __$$ | \____$$\ $$ \$$$  $$ |", 10
db "$$ |  $$ |$$\   $$ |$$ |\$  /$$ |", 10
db "$$ |  $$ |\$$$$$$  |$$ | \_/ $$ |", 10
db "\__|  \__| \______/ \__|     \__|", 10, 0
times 510 - ($$-$) db 0
