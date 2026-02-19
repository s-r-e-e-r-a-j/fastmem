; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memcpy
section .text
fm_memcpy:
    mov rax, rdi
    test rdx, rdx
    jz .done
.loop:
    mov cl, [rsi]
    mov [rdi], cl
    inc rsi
    inc rdi
    dec rdx
    jnz .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
