; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strrepeat
section .text
fm_strrepeat:
    mov rax, rdi
    test rdx, rdx
    jz .finish
    mov bl, [rsi]
    test bl, bl
    jz .finish
.repeat:
    mov rcx, rsi
.copy:
    mov bl, [rcx]
    test bl, bl
    jz .next
    mov [rdi], bl
    inc rdi
    inc rcx
    jmp .copy
.next:
    dec rdx
    jnz .repeat
.finish:
    mov byte [rdi], 0
    ret

section .note.GNU-stack noalloc noexec nowrite
