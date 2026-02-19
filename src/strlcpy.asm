; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strlcpy
section .text
fm_strlcpy:
    xor rcx, rcx
.len:
    cmp byte [rsi+rcx], 0
    je .copy
    inc rcx
    jmp .len
.copy:
    mov rax, rcx
    test rdx, rdx
    jz .done
    mov r8, rdx
    dec r8
.loop:
    test r8, r8
    jz .nullterm
    mov cl, [rsi]
    test cl, cl
    jz .nullterm
    mov [rdi], cl
    inc rdi
    inc rsi
    dec r8
    jmp .loop
.nullterm:
    mov byte [rdi], 0
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
