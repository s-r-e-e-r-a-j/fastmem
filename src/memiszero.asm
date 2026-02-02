; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memiszero
section .text
fm_memiszero:
.loop:
    test rsi, rsi
    jz .yes
    mov al, [rdi]
    test al, al
    jnz .no
    inc rdi
    dec rsi
    jmp .loop
.no:
    xor eax, eax
    ret
.yes:
    mov eax, 1
    ret

section .note.GNU-stack noalloc noexec nowrite
