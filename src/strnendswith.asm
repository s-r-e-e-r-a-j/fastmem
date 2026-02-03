; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strnendswith
section .text
fm_strnendswith:
    xor rcx, rcx
.len_s:
    cmp rcx, rdx
    jae .len_s_done
    mov al, [rdi + rcx]
    test al, al
    jz .len_s_done
    inc rcx
    jmp .len_s

.len_s_done:
    xor r8, r8
.len_suffix:
    mov al, [rsi + r8]
    test al, al
    jz .check
    inc r8
    jmp .len_suffix

.check:
    cmp r8, rdx
    ja .false
    cmp r8, rcx
    ja .false

    mov r9, rcx
    sub r9, r8
    lea rdi, [rdi + r9]

.compare:
    test r8, r8
    jz .true
    mov al, [rdi]
    cmp al, [rsi]
    jne .false
    inc rdi
    inc rsi
    dec r8
    jmp .compare

.true:
    mov eax, 1
    ret
.false:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
