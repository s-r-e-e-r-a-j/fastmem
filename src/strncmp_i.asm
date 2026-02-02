; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strncmp_i
section .text
fm_strncmp_i:
    test rdx, rdx
    jz .yes
.loop:
    mov al, [rdi]
    mov cl, [rsi]

    ; tolower(al)
    cmp al, 'A'
    jb .skip1
    cmp al, 'Z'
    ja .skip1
    add al, 32
.skip1:

    ; tolower(cl)
    cmp cl, 'A'
    jb .skip2
    cmp cl, 'Z'
    ja .skip2
    add cl, 32
.skip2:

    cmp al, cl
    jne .no
    test al, al
    jz .yes

    inc rdi
    inc rsi
    dec rdx
    jnz .loop

.yes:
    mov eax, 1
    ret
.no:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
