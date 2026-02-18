; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memrotate_left
section .text
fm_memrotate_left:
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
    mov r10b, [rdi]
    mov r8, rdi
    mov r9, rsi
    dec r9
.shift:
    mov dl, [r8+1]
    mov [r8], dl
    inc r8
    dec r9
    jnz .shift
    mov [rdi+rsi-1], r10b
    dec rcx
    jnz .outer
.done:
    mov rax, rdi
    ret

section .note.GNU-stack noalloc noexec nowrite
