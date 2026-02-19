; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memswap
section .text
fm_memswap:
    push rbx
    test rdx, rdx
    jz .done
.loop:
    mov al, [rdi]
    mov bl, [rsi]
    mov [rdi], bl
    mov [rsi], al
    inc rdi
    inc rsi
    dec rdx
    jnz .loop
.done:
    pop rbx
    ret

section .note.GNU-stack noalloc noexec nowrite
