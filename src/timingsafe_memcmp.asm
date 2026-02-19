; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_timingsafe_memcmp
section .text
fm_timingsafe_memcmp:
    push rbx
    xor eax, eax
    xor rcx, rcx
.loop:
    cmp rcx, rdx
    je .done
    mov bl, [rdi + rcx]
    xor bl, [rsi + rcx]
    or  al, bl
    inc rcx
    jmp .loop
.done:
    pop rbx
    ret

section .note.GNU-stack noalloc noexec nowrite
