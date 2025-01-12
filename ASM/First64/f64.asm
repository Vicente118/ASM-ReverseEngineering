;; Operations

bits 64

%define WRITE 1
%define EXIT  60

section .text
	global _start	
_start:
	mov rax, 5
	mov rbx, 10
	add rax, rbx

	; Exit call
	mov rax, EXIT
	xor rdi, rdi
	syscall	
