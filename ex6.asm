; goal is to understand the stack and how it works

global _start

_start:
    sub esp, 4              ; allocated four bytes on the stack to use however we like
    mov [esp], byte 'H'     ; store 'H' at the first byte of the stack
    mov [esp+1], byte 'e'
    mov [esp+2], byte 'y'
    mov [esp+3], byte '!'
    ; the above is the same as going
    ; push

    mov eax, 4              ; sys_write
    mov ebx, 1              ; stdout
    mov ecx, esp            ; write from ESP
    mov edx, 4              ; write 4 bytes
    int 0x80                ; system call

    mov eax, 1              ; sys_exit
    mov ebx, 0              ; status code
    int 0x80                ; system call