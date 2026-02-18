; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memisuniform
section .text
fm_memisuniform:
    cmp rsi, 1
    jbe .true
    mov al, [rdi]
    inc rdi
    dec rsi
.loop:
    cmp [rdi], al
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
