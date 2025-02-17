bits 64

global _start

section .data
    num1    db 100  ;; Defime a byte with value 100
    num2    dw 1024 ;; Define 2 byte with value 1024
    msg     db "Hello", 10 ;; Define a set of bytes

section .bss
    buffer  resb 64 ;; Define a buffer of size 64 bytes

section .text

_start:
    mov al, num1    ;; Move the address of num1 into the register al
    
    mov al, [num1]  ;; Move the value of num1 into the register al

   