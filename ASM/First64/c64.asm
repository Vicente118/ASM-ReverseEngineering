;; Data reading

bits 64
global _start

STDIN: equ 0
STDOUT: equ 1

section .data
	message      : db "Quel est ton nom ? "
	LEN_MSG      : equ $-message
	USERNAME_MAX : equ 11                   ; Max size in bytes

section .bss
	username: resb USERNAME_MAX
	
section .text
	_start:
	; Ask for name
		mov rax, 1
		mov rdi, STDOUT
		mov rsi, message
		mov rdx, LEN_MSG
		syscall 
	
	; Reading the name from STDIN
		mov rax, 0
		mov rdi, STDIN
		mov rsi, message
		mov rdx, USERNAME_MAX
		syscall

	; Print the username
		mov rax, 1
		mov rdi, STDOUT
		mov rsi, username
		mov rdx, USERNAME_MAX
		syscall

	; Close The program
		mov rax, 60
		xor rdi, rdi
		syscall
