; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strrepeat
section .text
fm_strrepeat:
    mov rax, rdi
    test rdx, rdx
    jz .finish
    mov r8b, [rsi]
    test r8b, r8b
    jz .finish
.repeat:
    mov rcx, rsi
.copy:
    mov r8b, [rcx]
    test r8b, r8b
    jz .next
    mov [rdi], r8b
    inc rdi
    inc rcx
    jmp .copy
.next:
    dec rdx
    jnz .repeat
.finish:
    mov byte [rdi], 0
    ret

section .note.GNU-stack noalloc noexec nowrite
