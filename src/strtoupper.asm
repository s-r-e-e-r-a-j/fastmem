; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strtoupper
section .text
fm_strtoupper:
    mov rax, rdi
.loop:
    mov dl, [rdi]
    test dl, dl
    jz .done
    cmp dl, 'a'
    jb .next
    cmp dl, 'z'
    ja .next
    sub byte [rdi], 32
.next:
    inc rdi
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
