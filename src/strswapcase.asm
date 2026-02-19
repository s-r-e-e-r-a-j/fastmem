; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strswapcase
section .text
fm_strswapcase:
    mov rax, rdi
.loop:
    mov cl, [rdi]
    test cl, cl
    jz .done
    cmp cl, 'a'
    jb .check_upper
    cmp cl, 'z'
    ja .check_upper
    sub byte [rdi], 32
    jmp .next
.check_upper:
    cmp cl, 'A'
    jb .next
    cmp cl, 'Z'
    ja .next
    add byte [rdi], 32
.next:
    inc rdi
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
