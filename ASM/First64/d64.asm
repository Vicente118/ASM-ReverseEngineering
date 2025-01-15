;; Conditions

bits 64

STDOUT:   equ 1
SYSWRITE: equ 1
SYSEXIT:  equ 60


section .data
	A: dq 5
	B: dq 6
	
	EQUAL_MSG: db       "A is equal to B", 10
	EQUAL_MSG_LEN: equ   $-EQUAL_MSG
	UNEQUAL_MSG: db     "A is not equal to B", 10
	UNEQUAL_MSG_LEN: equ $-UNEQUAL_MSG
 	
section .text
	global _start

_start:
	; Place values in accumulators
	mov rax, [A]
	mov rbx, [B]	
		
	; Comparaison
	cmp rax, rbx
	je equal
	jne unequal		

equal:
	mov rax, SYSWRITE
	mov rdi, STDOUT
	mov rsi, EQUAL_MSG
	mov rdx, EQUAL_MSG_LEN
	syscall
	jmp end

unequal:
	mov rax, SYSWRITE
	mov rdi, STDOUT
	mov rsi, UNEQUAL_MSG
	mov rdx, UNEQUAL_MSG_LEN
	syscall
	jmp end

end:	
	mov rax, SYSEXIT
	xor rdi, rdi
	syscall


; CMP <A>, <B> : Compares numerical values
; JMP <label>  : Unconditonal jump
;
; JE  	       : Jump if equal -> A is equal to B
; JNE          : Jump if not equal -> A is not equal to B
;
; JG           : Jump if A is STRICTLY GREATER than B
; JL           : Jump if A is STRICTLY LOWER than B
;
; JGE          : Jump is A is GREATER OR EQUAL to B
; JLE          : Jump is A is LOWER OR EQUAL to B;
