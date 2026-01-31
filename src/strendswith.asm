; Developer: Sreeraj
; GitHub: https://github.com/s-r-e-e-r-a-j

global fm_strendswith
section .text
fm_strendswith:
    xor rcx, rcx
.len1:
    mov al, [rdi + rcx]
    test al, al
    je .len1_done
    inc rcx
    jmp .len1
.len1_done:
    xor rdx, rdx
.len2:
    mov al, [rsi + rdx]
    test al, al
    je .len2_done
    inc rdx
    jmp .len2
.len2_done:
    cmp rdx, rcx
    ja .no
    sub rcx, rdx
    add rdi, rcx
.loop:
    test rdx, rdx
    je .yes
    mov al, [rsi]
    cmp al, [rdi]
    jne .no
    inc rsi
    inc rdi
    dec rdx
    jmp .loop
.yes:
    mov eax, 1
    ret
.no:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite
