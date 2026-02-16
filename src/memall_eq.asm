; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memall_eq
section .text
fm_memall_eq:
    test rsi, rsi
    jz .true
.loop:
    mov al, [rdi]
    cmp al, dl
    jne .false
    inc rdi
    dec rsi
    jnz .loop
.true:
    mov eax, 1
    ret
.false:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
