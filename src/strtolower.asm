; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strtolower
section .text
fm_strtolower:
    mov rax, rdi
.loop:
    mov dl, [rdi]
    test dl, dl
    jz .done
    cmp dl, 'A'
    jb .next
    cmp dl, 'Z'
    ja .next
    add byte [rdi], 32
.next:
    inc rdi
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
