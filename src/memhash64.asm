; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memhash64
section .text
fm_memhash64:
    mov rax, 0

.loop:
    test rsi, rsi
    jz .done

    imul rax, rax, 131
    movzx rcx, byte [rdi]
    add rax, rcx

    inc rdi
    dec rsi
    jmp .loop

.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
