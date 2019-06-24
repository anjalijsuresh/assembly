extern printf
extern scanf


section .data
    format: dw "%d", 0
    format1: dw "%d ", 0
    print: db "Enter the limit: ", 0
    read: times 4 dw ""
 
section .text
    global main

main:
    push ebp
    mov ebp,esp

    push print
    call printf
    add esp,4

    push read
    push format
    call scanf
    add esp, 8

    mov ax,0
    mov bx,1  
    mov cx, [read]
    cmp cx,1
    je loop3
    cmp cx, 2
    je loop4 

    push ax
    push format1
    call printf
    add esp,4
    pop ax
    push bx
    push format1
    call printf
    add esp,4
    pop bx
    mov ax,0
    mov bx,1
    xor dx,dx
    add dx,2

loop1:  add ax,bx
        add dx,1
        push ax
        push format1
        call printf
        add esp,4
        pop ax
        
        mov cx,bx
        mov bx,ax
        mov ax,cx
        
        mov cx, [read]
        sub cx,2
        cmp bx,cx
        jle loop1
   
        jmp loop5
  
loop3:  mov ax,0
        mov bx,1
        push ax
        push format1
        call printf
        add esp,4
        pop ax    
        jmp loop5
loop4:  push ax
        push format1
        call printf
        add esp,4
        pop ax
        push bx
        push format1
        call printf
        add esp,4
        pop bx
        jmp loop5
        
loop5:  mov ax,0
        mov esp,ebp
        pop ebp
        ret 
