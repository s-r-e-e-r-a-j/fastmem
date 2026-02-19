; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strncmp
section .text
fm_strncmp:
    push rbx
    test rdx, rdx
    jz .eq
.loop:
    mov al, [rdi]
    mov bl, [rsi]
    cmp al, bl
    jne .diff
    test al, al
    je .eq
    inc rdi
    inc rsi
    dec rdx
    jnz .loop
.eq:
    xor eax, eax
    pop rbx
    ret
.diff:
    movzx eax, al
    movzx ebx, bl
    sub eax, ebx
    pop rbx
    ret

section .note.GNU-stack noalloc noexec nowrite
