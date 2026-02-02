; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memne
section .text
fm_memne:
.loop:
    test rdx, rdx
    jz .equal
    mov al, [rdi]
    cmp al, [rsi]
    jne .notequal
    inc rdi
    inc rsi
    dec rdx
    jmp .loop
.notequal:
    mov eax, 1
    ret
.equal:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
