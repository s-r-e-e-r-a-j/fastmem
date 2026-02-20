; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

extern fm_memcpy
global fm_memmove
section .text
fm_memmove:
    mov rax, rdi
    test rdx, rdx
    jz .done

    cmp rdi, rsi
    je .done

    mov rcx, rsi
    add rcx, rdx
    cmp rdi, rsi
    jb .forward
    cmp rdi, rcx
    jae .forward

    lea rsi, [rsi+rdx-1]
    lea rdi, [rdi+rdx-1]

.backward:
    mov r8b, [rsi]
    mov [rdi], r8b
    dec rsi
    dec rdi
    dec rdx
    jnz .backward
    ret

.forward:
    jmp fm_memcpy

.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
