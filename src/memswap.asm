; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memswap
section .text
fm_memswap:
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
    ret

section .note.GNU-stack noalloc noexec nowrite
