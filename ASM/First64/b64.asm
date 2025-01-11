bits 64
global _start

%define HELLO "Hello world!"

section .data
	message	       : db HELLO, 10
	message_length : equ $-message
	exit_status    : equ 1
	WRITE_SYSCALL  : equ 1
	EXIT_SYSCALL   : equ 60
	
section .bss	
	RESERVE_25_BYTES     : resb 25 ; resb = reserve bytes 
	RESERVE_25_BYTES_BIS : times 25 resb 1 ; Same but slower

section .text
	_start:
	; Registers order : rdi, rsi, rdx, rcx, r8, r9, stack (right -> left)
	; return values in rax (64bits) or rax + rdx (for bigger return values)	
		mov rax, WRITE_SYSCALL
		mov rdi, 1
		mov rsi, message
		mov rdx, message_length
		syscall

		mov rax, EXIT_SYSCALL
		mov rdi, exit_status
		syscall 

