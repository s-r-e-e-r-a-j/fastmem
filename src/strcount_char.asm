; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strcount_char
section .text
fm_strcount_char:
    xor rax, rax
.loop:
    mov dl, [rdi]
    test dl, dl
    jz .done
    cmp dl, sil
    jne .next
    inc rax
.next:
    inc rdi
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
