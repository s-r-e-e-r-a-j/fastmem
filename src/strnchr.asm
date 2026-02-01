; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strnchr
section .text
fm_strnchr:
    test rdx, rdx
    jz .not_found
.loop:
    mov al, [rdi]
    test al, al
    jz .not_found
    cmp al, sil
    je .found
    inc rdi
    dec rdx
    jnz .loop
.not_found:
    xor rax, rax
    ret
.found:
    mov rax, rdi
    ret

section .note.GNU-stack noalloc noexec nowrite
