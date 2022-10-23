global _start

section .text
_start:
    mov eax, 1      ; sys_exit
    mov ebx, 42     ; status code
    jmp skip        ; jump to the "skip" label
    mov ebx, 13     ; exit status is 13 proof of what the jmp operation is doing (what's being "jumped" over)
skip:  ; just like the _start label, a way of naming a specific location in the code (: means "create label" to nasm)
    int 0x80        ; interrupt and pass control to the kernel
