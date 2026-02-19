; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memends_with
section .text
fm_memends_with:
    cmp rcx, rsi
    ja .false
    sub rsi, rcx
    add rdi, rsi
.loop:
    test rcx, rcx
    jz .true
    mov al, [rdi]
    cmp al, [rdx]
    jne .false
    inc rdi
    inc rdx
    dec rcx
    jmp .loop
.true:
    mov eax, 1
    ret
.false:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
