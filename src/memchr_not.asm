; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memchr_not
section .text
fm_memchr_not:
.loop:
    test rdx, rdx
    jz .notfound
    mov al, [rdi]
    cmp al, sil
    jne .found
    inc rdi
    dec rdx
    jmp .loop
.found:
    mov rax, rdi
    ret
.notfound:
    xor rax, rax
    ret

section .note.GNU-stack noalloc noexec nowrite
