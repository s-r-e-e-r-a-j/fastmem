; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memclear_range
section .text
fm_memclear_range:
    add rdi, rsi
    xor al, al
.loop:
    test rdx, rdx
    jz .done
    mov [rdi], al
    inc rdi
    dec rdx
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
