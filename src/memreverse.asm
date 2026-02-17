; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memreverse
section .text
fm_memreverse:
    mov rax, rdi
    test rsi, rsi
    jz .done

    lea rdx, [rdi + rsi - 1]

.loop:
    cmp rdi, rdx
    jae .done

    mov al, [rdi]
    mov cl, [rdx]
    mov [rdi], cl
    mov [rdx], al

    inc rdi
    dec rdx
    jmp .loop

.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
