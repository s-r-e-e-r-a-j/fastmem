; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memavg
section .text
fm_memavg:
    test rsi, rsi
    jz .zero
    xor rax, rax
    mov rcx, rsi
.loop:
    movzx rdx, byte [rdi]
    add rax, rdx
    inc rdi
    dec rsi
    jnz .loop
    xor rdx, rdx
    div rcx
    ret
.zero:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
