; learn about the base pointer, which allows you to use the stack in the function without having to be super careful about returning with inital conditions

global _start

_start:
    call func
    mov eax, 1                      ; sys_exit
    mov ebx, 0                      ; status code
    int 0x80

func: ; if we call a function in our function then we would overwrite EBP and this approach wouldn't work, so instead, a common approach is to push the location first
        ; this portion is known as the prologue of the function 
    push ebp                        ; store the previous EBP on the stack
    mov ebp, esp                    ; EBP is the base point register and it will hold our return location so we can use the stack without worrying about the return location
    ; now we're free to do whatever we want to do with the stack
    
    sub esp, 2                      ; esp -= 2
    mov [esp], byte 'h'
    mov [esp+1], byte 'i'
    ; print the stack
    mov eax, 4                      ; sys_write
    mov ebx, 1                      ; stdout
    mov ecx, esp                    ; addr to write
    mov edx, 2                      ; bytes to write
    int 0x80                        ; system call

        ; this portion is known as the epologue
    mov esp, ebp                    ; puts back the return location into the stack for ret to use
    pop ebp                         ; pop off the previous return location from the stack so we can return the EBP (extended base pointer) to it's starting state
    ret