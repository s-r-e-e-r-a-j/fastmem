; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memfirst_index
section .text
fm_memfirst_index:
    xor rcx, rcx
.loop:
    cmp rcx, rdx
    je .not_found
    cmp byte [rdi+rcx], sil
    je .found
    inc rcx
    jmp .loop
.found:
    mov rax, rcx
    ret
.not_found:
    mov rax, -1
    ret

section .note.GNU-stack noalloc noexec nowrite
