; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strremove_char
section .text
fm_strremove_char:
    mov rax, rdi
    mov r8b, sil
    mov rcx, rdi
.loop:
    mov dl, [rdi]
    test dl, dl
    jz .finish
    cmp dl, r8b
    je .skip
    mov [rcx], dl
    inc rcx
.skip:
    inc rdi
    jmp .loop
.finish:
    mov byte [rcx], 0
    ret

section .note.GNU-stack noalloc noexec nowrite
