extern printf

section .data
    format: dw "%d ", 0
   
section .text
	global main

main:   push ebp
        mov ebp,esp
        mov cx, 1
        mov bx, 2
loop1: 	inc cx
        mov ax,cx
        xor dx,dx
        div bx
        cmp dx, 0
        jne loop2
        push cx
        push format
        call printf
        add esp,4
        pop cx
                
loop2:  mov ax, cx
        cmp ax, 100
        jne loop1
        
        mov ax, 0
        mov esp,ebp
        pop ebp
        ret                         
