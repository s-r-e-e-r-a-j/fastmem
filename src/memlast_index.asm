; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_memlast_index
section .text
fm_memlast_index:
    test rdx, rdx
    jz .not_found
    mov rcx, rdx
.loop:
    dec rcx
    cmp byte [rdi+rcx], sil
    je .found
    test rcx, rcx
    jnz .loop
.not_found:
    mov rax, -1
    ret
.found:
    mov rax, rcx
    ret

section .note.GNU-stack noalloc noexec nowrite
