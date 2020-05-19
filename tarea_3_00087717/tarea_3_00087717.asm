  
	org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
	call	kbwait

	int 	20h

texto:	
    mov ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:
    mov 	ah, 02h
	mov 	dx, di  ; columna
    add     dl, bl
	mov 	dh, al ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase: 
    mov di, 0d
lupi:	
    mov al, 2d ;fila
    mov bl, 5d ;col
    mov 	cl, [msg+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
    mov di, 0d
lupi2:	
    mov al, 10d
    mov bl, 35d
    mov 	cl, [msg1+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lupi2   
    mov di, 0d
lupi3:	
    mov al, 20d
    mov bl, 5d
    mov 	cl, [msg2+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lupi3   
	ret


section .data
msg	db 	"Si supieras lo que este efecto me provoca hacer "
len 	equ	$-msg
msg1	db 	"Experimentar contigo varias poses "
len2 	equ	$-msg1
msg2	db 	"Es que a mi todavia no me conoces   "
len3 	equ	$-msg2