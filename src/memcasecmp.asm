; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memcasecmp
section .text
fm_memcasecmp:
    test rdx, rdx
    jz .equal
.loop:
    mov al, [rdi]
    mov cl, [rsi]
    or al, 0x20
    or cl, 0x20
    cmp al, cl
    jne .diff
    inc rdi
    inc rsi
    dec rdx
    jnz .loop
.equal:
    xor eax, eax
    ret
.diff:
    movzx eax, al
    movzx ecx, cl
    sub eax, ecx
    ret

section .note.GNU-stack noalloc noexec nowrite
