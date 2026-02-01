; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memnot
section .text
fm_memnot:
    mov rax, rdi
    test rsi, rsi
    jz .done
.loop:
    mov cl, [rdi]
    not cl
    mov [rdi], cl
    inc rdi
    dec rsi
    jnz .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
