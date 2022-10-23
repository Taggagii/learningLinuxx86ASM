; goal is to learn about memory allocation and the stack in asm

; to define memory in ASM you use one of a few different keywords (depending on size)
; db : defines a byte
;   name1 db "string"
;   name2 db 0xff ; 0x means it's a hex value
;   name3 db 1000 ; without 0x it's a decimal value
; dw : defines a word (2 bytes)
;   name4 dw 0x1234
;   name5 dw 1000
; dd : defines a double word (4 bytes)
;   name6 dd 0x12345678
;   name7 dd 100000

global _start

section .data
    addr db "yellow"   ; define a pointer to some memory address named "addr" which contains the string "yellow"

section .text
_start:
    mov [addr], byte 'H'; we're moving some data into the address "addr" and we're moving the byte representation of the character 'H'. (the byte keyword is important because mov can be used with other sizes and the assembler needs to know how much to move), because addr is the beginning of our string, that's where the 'H' will be moved to
    mov [addr+5], byte '!' ; move '!' to the index 5 of addr
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, addr       ; bytes to write
    mov edx, 6          ; number of bytes to write
    int 0x80            ; system call

    mov eax, 1          ; sys_exit
    mov ebx, 0          ; status code
    int 0x80            ; system call
