; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strtruncate
section .text
fm_strtruncate:
.loop:
    test rsi, rsi
    jz .done
    mov al, [rdi]
    test al, al
    jz .done
    inc rdi
    dec rsi
    jmp .loop
.done:
    mov byte [rdi], 0
    ret

section .note.GNU-stack noalloc noexec nowrite
