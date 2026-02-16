; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memindex
section .text
fm_memindex:
    xor rcx, rcx
.loop:
    cmp rcx, rsi
    je .notfound
    mov al, [rdi + rcx]
    cmp al, dl
    je .found
    inc rcx
    jmp .loop
.found:
    mov rax, rcx
    ret
.notfound:
    mov rax, -1
    ret

section .note.GNU-stack noalloc noexec nowrite
