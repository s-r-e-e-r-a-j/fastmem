; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strisprint
section .text
fm_strisprint:
.loop:
    mov al, [rdi]
    test al, al
    jz .true

    cmp al, 0x20
    jb .false
    cmp al, 0x7E
    ja .false

    inc rdi
    jmp .loop

.true:
    mov eax, 1
    ret

.false:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
