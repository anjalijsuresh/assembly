BITS 32

extern printf
extern scanf

section .data
	display: db "Enter your name", 10, 0
	output: db "Good morning ", 0
	read: times 4 dw ""
	format: dw "%s", 0

section .text:
	global main

main:
	push ebp
	mov ebp,esp
	
	push display                  ;print "Enter your name"
	call printf
	add esp,4

	push read                     ; read the user input
	push format
	call scanf
	add esp,4

	push output                   ; display "Good morning"
	call printf
	add esp,4

	push read                      ; display user name
	push format
	call printf
	add esp,4

	mov ax,0
	mov esp,ebp
	pop ebp
	ret
