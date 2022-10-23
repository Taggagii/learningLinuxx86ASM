global _start

section .text
_start:
    mov eax, 1      ; sys_exit
    mov ebx, 42     ; status code
    mov ecx, 99     ; set ecx to 99 (variable)
    cmp ecx, 100    ; compare ecx to 100 (sets flags in the background based on the comparison that we can check on later to see if it's < > or ==)
    jl skip         ; jump if less than (jump will only happen if the previous comparison has a lessthan result)
    mov ebx, 13     ; exit status is 13 proof of what the jmp operation is doing (what's being "jumped" over)
skip:  ; just like the _start label, a way of naming a specific location in the code (: means "create label" to nasm)
    int 0x80        ; interrupt and pass control to the kernel


; types of jumps:
;   je  A, B : jump if equal
;   jne A, B : jump if not equal
;   jg  A, B : jump if greater
;   jge A, B : jump if greater or equal
;   jl  A, B : jump if less
;   jle A, B : jump if less or equal