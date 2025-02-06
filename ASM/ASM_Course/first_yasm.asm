SUCCESS equ 0
STDOUT  equ 1
WRITE 	equ 1
EXIT 	equ 60

section .data
    bVar  db 0x5                ; byte variable
    cVar  db "H"                ; single character
    dVar  dd 50000              ; 32-bits variable (4 bytes)
    eVar  dd 25000
    array dd 100, 200, 300      ; 3 elements array
    msg	  db "Hello", 10 	; string \n
    len   equ $ - msg
    adVar dd 0	
section .bss
    dElem resd 1                ; 1  element 32-bites/4-bytes
    bArr  resb 10               ; 10 elements byte array
    dArr  resd 25               ; 25 elements 32-bits/4-bytes array
	
section .text
    global _start
    _start:
	mov bl, byte [bVar]
    	
    write_label:
	mov rax, WRITE
	mov rdi, STDOUT
	mov rsi, msg
	mov rdx, len
	syscall

	dec bl
	jnz write_label
	jmp add_label

    add_label:	
	mov eax, dword [dVar]
	add eax, dword [eVar]
	mov dword [adVar], eax
	
	mov rax, EXIT
	xor rdi, rdi
	syscall      











