; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memreplace
section .text
fm_memreplace:
    xor rax, rax
    test rsi, rsi
    jz .done
.loop:
    mov r8b, [rdi]
    cmp r8b, dl
    jne .next
    mov [rdi], cl
    inc rax
.next:
    inc rdi
    dec rsi
    jnz .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
