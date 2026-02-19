; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strstrip_left
section .text
fm_strstrip_left:
.loop:
    mov al, [rdi]
    cmp al, ' '
    je .advance
    cmp al, 9
    je .advance
    cmp al, 10
    je .advance
    cmp al, 13
    je .advance
    mov rax, rdi
    ret
.advance:
    inc rdi
    jmp .loop

section .note.GNU-stack noalloc noexec nowrite
