;; Reproduce this code 

;; #include <stdio.h>
;;
;; char *msg    = "Emter a number: ";
;; char *msg2   = "Looping $d of %d";
;; char *format = "%d";
;; int num      = 0;
;; 
;; int main()
;; {
;;     int i;
;; 
;;     printf(msg);
;;     scanf(format, &num);
;;
;;     i = 0;
;;     do {
;;         printf(msg2, i, num);
;;         i++;
;;     } while (i < num);
;; 
;;     return 0;
;; }

bits 64

global main           

extern printf, scanf, exit

section .text

main:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 16
    
    xor     eax, eax
    lea     rdi, [msg]
    call    printf

    xor     eax, eax
    lea     rdi, [format]
    lea     rsi, [number]
    call    scanf

    mov     DWORD [rbp - 4], 0

loop:
    mov     edx, [number]
    mov     rsi, [rbp - 4]
    lea     rdi, [msg2]
    xor     eax, eax
    call printf

    mov     ecx, DWORD [number]
    add     DWORD [rbp - 4], 1
    cmp     [rbp - 4], ecx
    jle     loop


    add     rsp, 16
    leave
    ret


section .data
    msg    : db "Enter a number: ", 0
    msg2   : db "Looping %d of %d", 10, 0
    format : db "%d", 0

section .bss
    number resb 4