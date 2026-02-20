; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memset16
section .text
fm_memset16:
    mov ax, si
.loop:
    test rdx, rdx
    jz .done
    mov [rdi], ax
    add rdi, 2
    dec rdx
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
