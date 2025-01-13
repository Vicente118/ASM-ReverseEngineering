


section .data
    bVar  db 5                  ; byte variable
    cVar  db "H"                ; single character
    str   db "Hello World!", 10 ; string
    dVar  dd 50000              ; 32-bits variale (4 bytes)
    array dd 100, 200, 300      ; 3 elements array

section .bss
    dElem resd 1                ; 1  element 32-bites/4-bytes
    bArr  resb 10               ; 10 elements byte array
    dArr  resd 25               ; 25 elements 32-bits/4-bytes array

section .text
    global _start
    _start :
      










