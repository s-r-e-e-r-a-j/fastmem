; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memdiff
section .text
fm_memdiff:
    push rbx
    xor rax, rax
.loop:
    cmp rax, rdx
    je .equal
    mov cl, [rdi + rax]
    mov bl, [rsi + rax]
    cmp cl, bl
    jne .done
    inc rax
    jmp .loop
.equal:
    mov rax, rdx
.done:
    pop rbx
    ret

section .note.GNU-stack noalloc noexec nowrite
