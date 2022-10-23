global _start

section .data
    ; making a constant named 'msg' containing "Hello, world!" followed by the 0x0a byte (hex for 10, newline character)
    msg db "Hello, world!", 0x0a
    len equ $ - msg ; length of the string by subracting the start of the string from the current location (end of the string)

section .text
_start:
    mov eax, 4          ; sys_write system call
    mov ebx, 1          ; stdout file descriptor (0: stdin, 1: stdout, 2:stderr)
    mov ecx, msg        ; bytes to write
    mov edx, len        ; number of bytes to write
    int 0x80            ; perform system call

    mov eax, 1          ; sys_exit system call
    mov ebx, 0          ; exit status code
    int 0x80