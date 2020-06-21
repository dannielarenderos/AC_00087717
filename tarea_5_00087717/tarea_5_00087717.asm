org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

; | de la izquierda

    mov 	si, 15d ; X -> Columna
	mov 	di, 30d ; Y -> Fila
    mov     bx, 120d
	call 	linea_v

; | de la derecha
    mov 	si, 90d ; X -> Columna
	mov 	di, 30d ; Y -> Fila
    mov     bx, 120d
	call 	linea_v


; linea v de abajo 2
 	mov 	si, 30d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
    mov     bx, 70d
	call 	linea_v

; linea v de abajo 3
 	mov 	si, 75d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
    mov     bx, 70d
	call 	linea_v


;linea v de abajo 4
 	mov 	si, 30d ; X -> Columna
	mov 	di, 90d ; Y -> Fila
    mov     bx, 120d
	call 	linea_v
	
; linea v de abajo 5
 	mov 	si, 75d ; X -> Columna
	mov 	di, 90d ; Y -> Fila
    mov     bx, 120d
	call 	linea_v

; ___ linea grande de arriba 

    mov 	si, 15d ; X -> Columna
	mov 	di, 30d ; Y -> Fila
    mov     bx, 90d
	call 	linea_h


; ___ linea 1 de en medio  

	mov 	si, 30d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
    mov     bx, 75d
	call 	linea_h

; ___ linea 2 de en medio 
	mov 	si, 30d ; X -> Columna
	mov 	di, 70d ; Y -> Fila
    mov     bx, 76d
	call 	linea_h

; ___ linea 3 de en medio 
	mov 	si, 30d ; X -> Columna
	mov 	di, 90d ; Y -> Fila
    mov     bx, 75d
	call 	linea_h

; ___ linea 1 de abajo
	mov 	si, 15d ; X -> Columna
	mov 	di, 120d ; Y -> Fila
    mov     bx, 31d
	call 	linea_h

; ___ linea 2 de abajo
	mov 	si, 75d ; X -> Columna
	mov 	di, 120d ; Y -> Fila
    mov     bx, 91d
	call 	linea_h

	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 0101b
	int 	10h
	ret

linea_h: 
lupi_h:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	    dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, bx
	jne 	lupi_h
	ret

linea_v:
lupi_v:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, bx
	jne 	lupi_v
	ret


kb: 	mov	ah, 00h
	int 	16h
	ret

section .data