; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strisxdigit
section .text
fm_strisxdigit:
.loop:
    mov al, [rdi]
    test al, al
    jz .true

    cmp al, '0'
    jb .check_alpha
    cmp al, '9'
    jbe .next

.check_alpha:
    cmp al, 'A'
    jb .check_lower
    cmp al, 'F'
    jbe .next

.check_lower:
    cmp al, 'a'
    jb .false
    cmp al, 'f'
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
