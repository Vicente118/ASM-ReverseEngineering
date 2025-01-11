;; Loops

bits 64

%define NULL     0
%define STDOUT   1
%define SYSWRITE 1
%define SYSEXIT  60
	
section .data
	message: db "Bonjour, sur GNU/LINUX", 10
	MSG_LEN: equ $-message
	
section .text
	global _start

_start:
	; Loop counter
	mov rbx, 5
	 

loop_message:
	; Message to print
	mov rax, SYSWRITE
	mov rdi, STDOUT
	mov rsi, message
	mov rdx, MSG_LEN
	syscall

	; Decrement rbx + jump if not equal to 0 
	dec rbx
	jnz loop_message
	
	; Exit call
	mov rax, SYSEXIT
	xor rdi, rdi
	syscall
