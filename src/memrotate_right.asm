; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memrotate_right
section .text
fm_memrotate_right:
    mov rax, rdi
    test rsi, rsi
    jz .done
    mov rax, rdx
    xor rdx, rdx
    div rsi
    mov rcx, rdx
    test rcx, rcx
    jz .done
.outer:
    mov al, [rdi+rsi-1]
    mov r8, rdi
    add r8, rsi
    dec r8
    mov r9, rsi
    dec r9
.shift:
    mov dl, [r8-1]
    mov [r8], dl
    dec r8
    dec r9
    jnz .shift
    mov [rdi], al
    dec rcx
    jnz .outer
.done:
    mov rax, rdi
    ret

section .note.GNU-stack noalloc noexec nowrite
