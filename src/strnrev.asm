; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strnrev
section .text
fm_strnrev:
    mov rax, rdi
    test rsi, rsi
    jz .done
    lea rcx, [rdi + rsi - 1]
.loop:
    cmp rdi, rcx
    jge .done
    mov al, [rdi]
    mov dl, [rcx]
    mov [rdi], dl
    mov [rcx], al
    inc rdi
    dec rcx
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
