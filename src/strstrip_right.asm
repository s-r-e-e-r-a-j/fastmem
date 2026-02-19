; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strstrip_right
section .text
fm_strstrip_right:
    mov rax, rdi
    mov rcx, rdi
.find_end:
    cmp byte [rcx], 0
    je .check
    inc rcx
    jmp .find_end
.check:
    dec rcx
.loop:
    cmp rcx, rdi
    jb .done
    mov dl, [rcx]
    cmp dl, ' '
    je .zero
    cmp dl, 9
    je .zero
    cmp dl, 10
    je .zero
    cmp dl, 13
    je .zero
    jmp .done
.zero:
    mov byte [rcx], 0
    dec rcx
    jmp .loop
.done:
    ret

section .note.GNU-stack noalloc noexec nowrite
