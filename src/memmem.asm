; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memmem
section .text
fm_memmem:
    test rcx, rcx
    je .found
    cmp rcx, rsi
    ja .notfound
    mov r8, rsi
    sub r8, rcx
    xor r9, r9
.outer:
    cmp r9, r8
    ja .notfound
    xor r10, r10
.inner:
    cmp r10, rcx
    je .match
    mov r11, r9
    add r11, r10
    mov al, [rdi + r11]
    cmp al, [rdx + r10]
    jne .next
    inc r10
    jmp .inner
.next:
    inc r9
    jmp .outer
.match:
    lea rax, [rdi + r9]
    ret
.found:
    mov rax, rdi
    ret
.notfound:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
