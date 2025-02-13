bits 16
org 0x7c00

mov	ax, 0	; init registers
mov	ds, ax
mov	es, ax
mov	ss, ax

mov	bp, 0x7c00	; init pointers
mov	sp, bp

mov	ax, 0x860E
mov	es, ax
mov	cl, 2
call	read_sector	; read sector 2 from hdd
mov	si, big_logo
jmp	0x860E:0x0000
read_sector:
	mov	ah, 0x02
	mov	al, 1
	mov	ch, 0
	mov	dh, 0
	mov	dl, 0x80
	mov	bx, 0x0000
	int	0x13
	jc	.failed
	ret
.failed:
	mov	ah, 0x0e
	mov	al, 'E'
	int	0x10
big_logo db "         $$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$$\ ", 0x0D, 0x0A
db "$$$$$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  _____|", 0x0D, 0x0A
db "\______|$$ /  $$ |$$ /  $$ |$$ |  $$ |$$ /  $$ |\$$$$$$\  ", 0x0D, 0x0A
db "        $$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ | \____$$\ ", 0x0D, 0x0A
db "        \$$$$$$  |\$$$$$$  |$$ |  $$ |\$$$$$$  |$$$$$$$  |", 0x0D, 0x0A
db "         \______/  \______/ \__|  \__| \______/ \_______/ ", 0x0D, 0x0A
times	510 - ($-$$) db 0 ; fill the remainder with zeros
dw	0xaa55 ; boot signature
