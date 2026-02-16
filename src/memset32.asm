; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memset32
section .text
fm_memset32:
    mov rax, rdi 
    test rsi, rsi
    jz .done
.loop:
    mov [rdi], edx
    add rdi, 4
    dec rsi
    jnz .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
