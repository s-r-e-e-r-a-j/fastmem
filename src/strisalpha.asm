; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strisalpha
section .text
fm_strisalpha:
.loop:
    mov al, [rdi]
    test al, al
    jz .true

    cmp al, 'A'
    jb .false
    cmp al, 'Z'
    jbe .next
    cmp al, 'a'
    jb .false
    cmp al, 'z'
    ja .false

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
