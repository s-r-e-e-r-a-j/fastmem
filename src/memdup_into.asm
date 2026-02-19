; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memdup_into
section .text
fm_memdup_into:
    mov rax, rdi
.loop:
    test rdx, rdx
    jz .done
    mov cl, [rsi]
    mov [rdi], cl
    inc rdi
    inc rsi
    dec rdx
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
