; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memswap_ranges
section .text
fm_memswap_ranges:
.loop:
    test rdx, rdx
    jz .done
    mov al, [rdi]
    mov cl, [rsi]
    mov [rdi], cl
    mov [rsi], al
    inc rdi
    inc rsi
    dec rdx
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
