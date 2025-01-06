bits 64
global _start

%define HELLO 'Hello world!'

section .data
    message        : db HELLO, 10
    message_length : equ $-message

section .text
    _start: 
        mov rax, 1
        mov rdi, 1
        mov rsi, message
        mov rdx, message_length
        syscall

        mov rax, 60
        mov rdi, 12
        syscall