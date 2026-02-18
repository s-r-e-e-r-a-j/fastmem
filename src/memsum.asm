; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memsum
section .text
fm_memsum:
    xor rax, rax
    test rsi, rsi
    jz .done
.loop:
    movzx rdx, byte [rdi]
    add rax, rdx
    inc rdi
    dec rsi
    jnz .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
