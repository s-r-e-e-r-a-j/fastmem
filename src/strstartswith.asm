; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strstartswith
section .text
fm_strstartswith:
.loop:
    mov al, [rsi]
    test al, al
    je .yes
    cmp al, [rdi]
    jne .no
    inc rsi
    inc rdi
    jmp .loop
.yes:
    mov eax, 1
    ret
.no:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
