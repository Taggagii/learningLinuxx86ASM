global add42 ; want our add42 label to be accessable to the linker
add42:
    push ebp
    mov ebp, esp

    mov eax, [esp+8]
    add eax, 42

    mov esp, ebp
    pop ebp
    ret