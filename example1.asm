; Assembly commands work by specifying a code in EAX to denote the type of command to run
;   and then specifying its parameters in the following registers (EBX, ECX, EDX, ESI, EDI)
; The command is called when an interrupt is called to transfer process control over to the 0x80 system call handler (0x80 is the kernal on linux)

section .text
    global _start
    _start:
        mov eax, 1                  ; move 1 into register eax (sys_exit)
        mov ebx, 42                 ; move 42 into register ebx (exit status, could be anything)
        sub ebx, 13                 ; subtract 13 from the 42 stored in ebx in place
        int 0x80                    ; interrupt, processor transfers control to the 0x80 (system_calls) interrupt handler. The system call it makes is determined by the EAX register, EBX is the exit status

        ; operators
        ; mov ebx, 123 : ebx = 123
        ; mov eax, ebx : eax = ebx
        ; add ebx, ecx : ebx += ecx
        ; sub ebx, edx : ebx -= edx
        ; mul ebx      : eax *= ebx
        ; div edx      : eax /= edx