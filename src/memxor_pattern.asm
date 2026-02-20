; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memxor_pattern
section .text
fm_memxor_pattern:
    push rbx
    xor r8, r8
.loop:
    test rcx, rcx
    jz .done
    mov al, [rdi]
    mov bl, [rsi + r8]
    xor al, bl
    mov [rdi], al
    inc rdi
    inc r8
    cmp r8, rdx
    jne .continue
    xor r8, r8
.continue:
    dec rcx
    jmp .loop
.done:
    pop rbx
    ret

section .note.GNU-stack noalloc noexec nowrite
