; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strnstartswith
section .text
fm_strnstartswith:
    xor rcx, rcx
.len_prefix:
    mov al, [rsi + rcx]
    test al, al
    jz .check
    inc rcx
    jmp .len_prefix

.check:
    cmp rcx, rdx
    ja .false

.compare:
    test rcx, rcx
    jz .true
    mov al, [rdi]
    test al, al
    jz .false
    cmp al, [rsi]
    jne .false
    inc rdi
    inc rsi
    dec rcx
    jmp .compare

.true:
    mov eax, 1
    ret
.false:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
