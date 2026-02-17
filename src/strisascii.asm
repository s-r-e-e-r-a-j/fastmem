; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strisascii
section .text
fm_strisascii:
.loop:
    mov al, [rdi]
    test al, al
    jz .true

    test al, 0x80
    jnz .false

    inc rdi
    jmp .loop

.true:
    mov eax, 1
    ret

.false:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
