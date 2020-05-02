    org 100h

; Ejercicio 1

section .data
message         db      'Peor es nada' 
msglen          equ     $-message

section .text 
    mov di, 0d
    mov cx, [msglen]
    
mensaje: mov bl, [message+di]
    mov [di+200h], bl
    inc di 
    loop mensaje 
   
   

; Ejercicio 2 
    mov ax, 0000h
    mov bx, 0000h
    mov cx, 0000h
    mov cx, 2d
    mov ax, 4d
    mov bx, 0h
    mov [210h], ax


run: INC bx
    mul cx
    mov [210h + bx], ax
    cmp ax, 0XFF
    jb run
run3: INC bx
    INC bx
    mul cx
    mov [210h + bx], ax
    cmp bx, 12d
    jbe run3
    
; Ejercicio 3 


    mov dl, 0d
    mov [220h], dl
    mov dl, 1d
    mov [221h], dl
	mov ax, 0d
	mov dx, 1d
	mov bx, 2d	
fib:	
    MOV cx, dx
	ADD dx, ax
	MOV ax, cx
	CMP dx, 255d		
	JBE loop1
	JA loop2

loop1:	
    mov [220h+bx],dx
	INC bx
	cmp bx, 10h	
	jb fib

loop2:
    mov [220h+bx],dx
	INC bx
    INC bx
	cmp bx, 10h
	jb fib			

    int 20h
