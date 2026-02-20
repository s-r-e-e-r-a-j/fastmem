; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memrepeat
section .text
fm_memrepeat:
    test rcx, rcx
    jz .done
.outer:
    push rcx
    mov rcx, rdx
    mov r8, rdi
    mov r9, rsi
.inner:
    test rcx, rcx
    jz .inner_done
    mov al, [r9]
    mov [r8], al
    inc r8
    inc r9
    dec rcx
    jmp .inner
.inner_done:
    pop rcx
    add rdi, rdx
    dec rcx
    jnz .outer
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
