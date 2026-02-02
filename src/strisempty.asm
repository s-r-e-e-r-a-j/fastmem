; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strisempty
section .text
fm_strisempty:
    mov al, [rdi]
    test al, al
    jnz .no
    mov eax, 1
    ret
.no:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
