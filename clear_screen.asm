; TODO link with boot and print and remove as bootable file 

[bits 16]
org 0x7c00

mov	ax, 0	; init registers
mov	ds, ax
mov	es, ax
mov	ss, ax

mov	bp, 0x7c00	; init pointers
mov	sp, bp

mov	ah, 0
mov	al, 0x03
int	0x10

times 510 - ($-$$) db 0
dw	0xaa55 ; boot signature
