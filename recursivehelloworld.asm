global _start

section .data
    msg db "hello World", byte 10
    len equ $ - msg
    counter db 5

section .text
_start:
    ; call our recursive helloWorld function
    call helloWorlder
    call sysexit

sysexit:
    mov eax, 1
    mov ebx, 0
    int 0x80

helloWorlder: 
    ; push the old base pointer to the stack
    push ebp
    ; save the current stack location (so we can find our way back to the base pointer)
    mov ebp, esp
    
    ; if counter < 5
    cmp byte[counter], 0
    jl continueSection

    ; decrement counter and write msg to stdout
    dec byte[counter]
    
    mov eax, 4           
    mov ebx, 1           
    mov ecx, msg       
    mov edx, len
    int 0x80
    ; recursive step, call the function again
    call helloWorlder

    ; else
    continueSection:

    ; return the stack to the point it was at when we first entered the function
    mov esp, ebp
    ; retrieve our old base pointer
    pop ebp
    ; use the original stack source pointer to return
    ret

