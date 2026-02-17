; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memrun
section .text
fm_memrun:
    xor rax, rax

.loop:
    test rdx, rdx
    jz .done

    mov cl, [rdi]
    cmp cl, sil
    jne .done

    inc rdi
    inc rax
    dec rdx
    jmp .loop

.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
