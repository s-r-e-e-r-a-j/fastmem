; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memhas
section .text
fm_memhas:
.loop:
    test rsi, rsi
    jz .not_found
    mov al, [rdi]
    cmp al, dl
    je .found
    inc rdi
    dec rsi
    jmp .loop

.found:
    mov eax, 1
    ret

.not_found:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
