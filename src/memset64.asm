; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memset64
section .text
fm_memset64:
    mov rax, rsi
.loop:
    test rdx, rdx
    jz .done
    mov [rdi], rax
    add rdi, 8
    dec rdx
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
