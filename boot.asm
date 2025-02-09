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

mov	si, welcome
call	0x860E:0x0000

mov	ax, 0x40c
mov	es, ax
mov	cl, 3
call	read_sector	; read sector 3 from hdd

call	0x40c:0x0000
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
fail_notf db "Failed to open sector 2 from HDD", 10, 0
welcome db "Welcome to GoonOS", 0
times	510 - ($-$$) db 0 ; fill the remainder with zeros
dw	0xaa55 ; boot signature
