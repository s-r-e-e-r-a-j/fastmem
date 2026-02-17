; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memreverse
section .text
fm_memreverse:
    push rbx
    mov rax, rdi
    test rsi, rsi
    jz .done

    lea rdx, [rdi + rsi - 1]

.loop:
    cmp rdi, rdx
    jae .done

    mov bl, [rdi]
    mov cl, [rdx]
    mov [rdi], cl
    mov [rdx], bl

    inc rdi
    dec rdx
    jmp .loop

.done:
    pop rbx
    ret

section .note.GNU-stack noalloc noexec nowrite
