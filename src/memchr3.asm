; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memchr3
section .text
fm_memchr3:
.loop:
    test r8, r8
    jz .not_found
    mov al, [rdi]
    cmp al, sil
    je .found
    cmp al, dl
    je .found
    cmp al, cl
    je .found
    inc rdi
    dec r8
    jmp .loop
.found:
    mov rax, rdi
    ret
.not_found:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
