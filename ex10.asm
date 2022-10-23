; functions take in their parameters on the stack, so this means we can now call functions from C in asm
; compile command:
;   nasm -f elf32 ex10.asm -o ex10.o
;   gcc -m32 ex10.o -o ex10

global main
extern printf

section .data
    msg db "Testing %i...", 0x0a, 0x00

main:
    push ebp
    mov ebp, esp
    
    push 123                    ; first argument
    push msg                    ; second argument
    call printf                 ; call printf with these arguments
    mov eax, 0                  ; return value for our main function (status code)
    ; note, the arguments are still on the stack, you have to remove them to preseve memory
    
    mov esp, ebp
    pop ebp
    ret