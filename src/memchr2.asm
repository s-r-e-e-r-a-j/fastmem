; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memchr2
section .text
fm_memchr2:
.loop:
    test rcx, rcx
    jz .notfound

    mov al, [rdi]
    cmp al, sil
    je .found
    cmp al, dl
    je .found

    inc rdi
    dec rcx
    jmp .loop

.found:
    mov rax, rdi
    ret

.notfound:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
