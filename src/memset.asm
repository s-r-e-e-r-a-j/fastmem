; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memset
section .text
fm_memset:
    mov rax, rdi
    mov cl, sil
.loop:
    test rdx, rdx
    jz .done
    mov [rdi], cl
    inc rdi
    dec rdx
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
