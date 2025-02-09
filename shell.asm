[bits 16]
mov	ax, 0
mov	dx, ax
mov	es, ax
mov	ss, ax
mov	bp, 0x7c00
mov	sp, bp
main:
mov	ax, 0x89b
mov	es, ax
mov	cl, 4
mov	ah, 0x02
mov	al, 1
mov	ch, 0
mov	dh, 0
mov	dl, 0x80
mov	bx, 0x0000
int	0x13
mov	bx, testing
call	0x89b:0x0000
jc	.failed
.failed:
	mov	ah, 0x0e
	mov	al, 'E'
	int	0x10
big_logo db " $$$$$$\   $$$$$$\  $$\      $$\", 10 
db "$$  __$$\ $$  __$$\ $$$\    $$$ |", 10
db "$$ /  $$ |$$ /  \__|$$$$\  $$$$ |", 10
db "$$$$$$$$ |\$$$$$$\  $$\$$\$$ $$ |", 10
db "$$  __$$ | \____$$\ $$ \$$$  $$ |", 10
db "$$ |  $$ |$$\   $$ |$$ |\$  /$$ |", 10
db "$$ |  $$ |\$$$$$$  |$$ | \_/ $$ |", 10
db "\__|  \__| \______/ \__|     \__|", 10, 0
testing db "hello world", 0
times 510 -($$-$) db 0
