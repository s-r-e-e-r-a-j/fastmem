; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memfill_increment
section .text
fm_memfill_increment:
    mov al, sil
.loop:
    test rdx, rdx
    jz .done
    mov [rdi], al
    inc al
    inc rdi
    dec rdx
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
