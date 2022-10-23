; goal is to calculate a^b, where EBX = a, ECX = b

global _start

section .text
_start:
    mov ebx, 1      ; start ebx at 1 (stored final answer)
    mov ecx, 4      ; number of iterations

label:
    add ebx, ebx    ; ebx += ebx (double a)
    dec ecx         ; --ecx (decrement ECX [iteration count] slightly more efficent than `sub ecx, 1`)
    cmp ecx, 0      ; compare ecx [iteration count] with 0
    jg label        ; jump back to "label" only if ecx [iteration count] is greater than 0

    mov eax, 1      ; sys_exit
    int 0x80        ; system call
