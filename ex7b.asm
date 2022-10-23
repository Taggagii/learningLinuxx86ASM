; goal is to create functions in asm such that we can reuse code and even call assembled C code functions
global _start

func:
    mov ebx, 42                 ; status code
    ret                         ; returns from the function (pops the return location from the stack and jumps there)

section .text
_start:
    call func                   ; calling a label "func" (pushes the return EIP to the stack and then jumps to the label) func sets EBX for us
    mov eax, 1                  ; sys_exit
    int 0x80                    ; system call

