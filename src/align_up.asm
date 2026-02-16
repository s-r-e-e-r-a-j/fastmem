; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_align_up
section .text
fm_align_up:
    dec rsi
    add rdi, rsi
    not rsi
    and rdi, rsi
    mov rax, rdi
    ret

section .note.GNU-stack noalloc noexec nowrite
