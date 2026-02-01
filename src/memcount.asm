; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memcount
section .text
fm_memcount:
    xor rax, rax
    test rdx, rdx
    jz .done
.loop:
    mov cl, [rdi]
    cmp cl, sil
    jne .next
    inc rax
.next:
    inc rdi
    dec rdx
    jnz .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
