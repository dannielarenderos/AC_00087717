    org 100h

; Ejercicio 1


; Ejercicio 2 
   
    mov ax, 0000h
    mov bx, 0000h
    mov cx, 0000h
    mov cl, 2d
    mov ax, 4d
    mov bx, 0h
    mov [210h], ax


run: INC bx
    mul cl
    mov [210h + bx], ax
    cmp ax, 0XFF
    jb run
run3:
    INC bx
    INC bx
    mul cl
    mov [210h + bx], ax
    cmp bx, 13d
    jb run3

; Ejercicio 3 


    int 20h
