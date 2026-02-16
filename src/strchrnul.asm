; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strchrnul
section .text
fm_strchrnul:
.loop:
    mov al, [rdi]
    cmp al, sil
    je .found
    test al, al
    je .found
    inc rdi
    jmp .loop
.found:
    mov rax, rdi
    ret

section .note.GNU-stack noalloc noexec nowrite
