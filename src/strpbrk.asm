; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strpbrk
section .text
fm_strpbrk:
    push rbx
.outer:
    mov al, [rdi]
    test al, al
    jz .null

    mov rcx, rsi

.inner:
    mov bl, [rcx]
    test bl, bl
    jz .next
    cmp al, bl
    je .found
    inc rcx
    jmp .inner

.next:
    inc rdi
    jmp .outer

.found:
    mov rax, rdi
    pop rbx
    ret

.null:
    xor rax, rax
    pop rbx
    ret

section .note.GNU-stack noalloc noexec nowrite

