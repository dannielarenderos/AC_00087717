org 	100h

section .text
	mov 	dx, msg
	call 	w_strng

	xor 	si, si 	;lo mimso que: mov si, 0000h
lupi:	call 	kb
	cmp 	al, "$"
	je	do
    sub     al, 30h
	mov	[300h+si], al ; CS:0300h en adelante
	inc 	si
	jmp 	lupi

do:mov     bx, 0000h
        mov     ax, 0000h
prom:    add     al, [300h+bx]
        inc     bx
        cmp     bx, 05h
        jb      prom
        mov     cl, 5d
        div     cl
        
mensaje:mov	dx, nl
	call 	w_strng
	cmp     al, 1d
        je      men1
	cmp     al, 2d
        je      men2
	cmp     al, 3d
        je      men3
	cmp     al, 4d
        je      men4
	cmp     al, 5d
        je      men5
	cmp     al, 6d
        je      men6
	cmp     al, 7d
        je      men7
	cmp     al, 8d
        je      men8
	cmp     al, 9d
        je      men9
	cmp     al, 10d
        je      men10
men1:	mov 	dx, msg1
        jmp     escr
men2:	mov 	dx, msg2
        jmp     escr	
men3:	mov 	dx, msg3
        jmp     escr
men4:	mov 	dx, msg4
        jmp     escr
men5:	mov 	dx, msg5
        jmp     escr
men6:	mov 	dx, msg6
        jmp     escr
men7:	mov 	dx, msg7
        jmp     escr
men8:	mov 	dx, msg8
        jmp     escr
men9:	mov 	dx, msg9
        jmp     escr
men10:	mov 	dx, msg9
        jmp     escr

escr:   call 	w_strng
	call 	kb	
	int 	20h



texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb: 	mov	ah, 1h
	int 	21h
	ret

w_strng:mov	ah, 09h
	int 	21h
	ret

section .data
                                       
msg 	db 	"Ingrese los 5 numeros del carne: $"
msg10 	db 	"Perfecto solo Dios$"
msg9 	db 	"Siempre me esfuerzo$"
msg8 	db 	"Colocho$"
msg7 	db 	"Muy bien$"
msg6 	db 	"Peor es nada$"
msg5 	db 	"En el segundo$"
msg4 	db 	"Me recupero$"
msg3 	db 	"Hay salud$"
msg2 	db 	"Aun se pasa$"
msg1 	db 	"Solo necesito el 0$"
nl	db 	0xA, 0xD, "$"
