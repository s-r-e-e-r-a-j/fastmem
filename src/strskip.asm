; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strskip
section .text
fm_strskip:
.loop:
    mov al, [rdi]
    test al, al
    jz .done
    cmp al, sil
    jne .done
    inc rdi
    jmp .loop
.done:
    mov rax, rdi
    ret

section .note.GNU-stack noalloc noexec nowrite
