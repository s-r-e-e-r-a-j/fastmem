; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strisspace
section .text
fm_strisspace:
.loop:
    mov al, [rdi]
    test al, al
    jz .true

    cmp al, ' '
    je .next
    cmp al, 9
    je .next
    cmp al, 10
    je .next
    cmp al, 11
    je .next
    cmp al, 12
    je .next
    cmp al, 13
    jne .false

.next:
    inc rdi
    jmp .loop

.true:
    mov eax, 1
    ret

.false:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
